<?php

function request($url) {
    $ch = curl_init($url);
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_CONNECTTIMEOUT => 10,
        CURLOPT_TIMEOUT => 30,
    ]);
    $response = curl_exec($ch);
    if ($response === false) {
        error_log('cURL Error: ' . curl_error($ch));
    }
    curl_close($ch);
    return $response;
}

if (isset($_POST['token']) and isset($_POST['admin-id']) and isset($_POST['db-name']) and isset($_POST['db-user']) and isset($_POST['db-pass']) and isset($_POST['install_location'])) {
	if (!file_exists('pooya.install')) {
		if (file_exists('../config.php') and file_exists('../index.php') and file_exists('../texts.json') and file_exists('../sql/sql.php')) {
		    $domain = 'https://' . $_SERVER['HTTP_HOST'] . '/' . explode('/', explode('public_html/', $_SERVER['SCRIPT_FILENAME'])[1])[0];
		    
			$getTokenStatus = json_decode(request('https://api.telegram.org/bot' . $_POST['token'] . '/getMe'), true)['ok'];
			if ($getTokenStatus == true) {
			    $config_file = file_get_contents('../config.php');
			    
				$replace = str_replace(['[*TOKEN*]', '[*DEV*]', '[*DB-NAME*]', '[*DB-USER*]', '[*DB-PASS*]'], [$_POST['token'], $_POST['admin-id'], $_POST['db-name'], $_POST['db-user'], $_POST['db-pass']], file_get_contents('../config.php'));
				file_put_contents('../config.php', $replace);
				
				$webhook = json_decode(request('https://api.telegram.org/bot' . $_POST['token'] . '/setWebhook?url=' . $domain . '/index.php'), true);
				if ($webhook['ok'] == false) {
				    file_put_contents('../config.php', $config_file);
				    die('<h2 style="text-align: center; color: black; font-size: 32px; margin-top: 50px;">عملیات انجام ست وبهوک با خطا مواجه شد ❌</h2>');
				}
				
				$connect = json_decode(request($domain . '/sql/sql.php?db_name=' . $_POST['db-name'] . '&db_username=' . $_POST['db-user'] . '&db_password=' . $_POST['db-pass']), true);
				if ($connect['status'] == false) {
				    file_put_contents('../config.php', $config_file);
				    die('<h2 style="text-align: center; color: black; font-size: 32px; margin-top: 50px;">اطلاعات دیتابیس ارسالی شما اشتباه است ❌</h2>');
				}
				
				file_put_contents('pooya.install', json_encode(['development' => '@PooyaPanel', 'install_location' => $_POST['install_location'], 'main_domin' => $domain, 'token' => $_POST['token'], 'dev' => $_POST['admin-id'], 'db_name' => $_POST['db-name'], 'db_username' => $_POST['db-user'], 'db_password' => $_POST['db-pass']], 448));
				$send_message = json_decode(request('https://api.telegram.org/bot' . $_POST['token'] . '/sendMessage?chat_id=' . $_POST['admin-id'] . '&text=' . urlencode(base64_decode('4pyFINix2KjYp9iqINio2Kcg2YXZiNmB2YLbjNiqINmG2LXYqCDYtNivLgoK8J+agCDYsdio2KfYqiDYsdinIC9zdGFydCDaqdmG24zYry4KCvCfkJ0gLSBAUG9veWFQYW5lbCAtIEBQb295YVBhbmVsR2Fw'))), true);
			    print '<h2 style="text-align: center; color: black; font-size: 32px; margin-top: 50px;">ربات شما با موفقیت نصب شد ✅</h2>';
			    
			} else {
				print '<h2 style="text-align: center; color: black; font-size: 32px; margin-top: 50px;">توکن ارسالی اشتباه است ❌</h2>';
			}
		} else {
			print '<h2 style="text-align: center; color: black; font-size: 32px; margin-top: 50px;">فایل های اصلی ربات یافت نشد ❌</h2>';
		}
	} else {
		print '<h2 style="text-align: center; color: black; font-size: 32px; margin-top: 50px;">ربات قبلا یک بار نصب شده است ❌</h2>';
	}
} else {
	print '<h2 style="text-align: center; color: black; font-size: 40px; margin-top: 60px;">مقادیر اجباری به درستی ارسال نشده است ❌</h2>';
}

?>
