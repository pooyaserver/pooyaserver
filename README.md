 ## آموزش راه اندازی و نصب ربات روی هاست ( سیپنل )
- وارد ربات بات فادر [@BotFather](https://t.me/BotFather) شوید و با دستور `/new_bot` یک ربات جدید ساخته و توکن را دریافت کنید.
- وارد هاست خود شوید و به قسمت [ `MySQL® Database Wizard` ] مراجعه کنید و یک دیتابیس جدید ساخته و همه دسترسی های لازمه را فعال کنید.
- وارد پوشه [ `public_html` ] شوید و در این پوشه یک پوشه جدید ( نام دلخواه ) ایجاد کنید.
- همه فایل ها و پوشه های ربات پنل پنل را به صورت دقیق و درست در پوشه ای که ساختید آپلود کنید.
- فایل `install.html` را اجرا کنید , نمونه ادرسی که باید اجرا کنید : ( که در این نمونه آدرس `Domain.com` برابر با دامین شما و `folder` برابر با نام پوشه ای که ساخته بودید )
```bash
https://Domain.com/folder/install/install.html
```
- تمامی ورودی های خواسته شده از شما را در صفحه به صورت دقیق و صحیح وارد کنید و در نهایت بر روی دکمه **ثبت و نصب ربات** کلیک کنید.
- آیدی عددی خود را میتوانید از طریق ربات [@UserInfoBot](https://t.me/userinfobot) دریافت کنید.
- بعد از پر کردن تمامی فیلد های لازمه و زدن دکمه **ثبت و نصب ربات** یک پیام موفقیت آمیز در ربات به شما ارسال خواهد شد.
- از طریق دستور `/panel` یا `panel` میتوانید وارد پنل مدیریت ربات شوید.

 ## آموزش راه اندازی و نصب ربات روی سرور
- وارد سرور خود شوید.
- دستور زیر رو برای نصب ربات ارسال کنید.
```bash
bash <(curl -s https://raw.githubusercontent.com/pooyaserver/pooyaserver/main/pooya.sh)
```
- بعد از اجرای این دستور باید کمی صبر کنید تا به مرحله وارد کردن دامنه برسید.
- دامنه اتون را بدون `http` و `https` وارد کنید ( حتما باید `SSL` دامنه فعال باشد )
- بعد از وارد کردن دامنه کمی باید صبر کنید تا به مرحله ساخت دیتابیس برسید.
- وقتی به مرحله دیتابیس رسیدید از شما اطلاعات دیتابیس رو میخواد , در صورتی که میخوایید به صورت دیفالت همه چیو بسازه در قسمت مرحله دیتابیس هر دو قسمت رو `enter` بزنید.
- بعد از به اتمام رسیدن این بخش دیتابیس شما ساخته خواهد شد و در مرحله بعدی از شما سه تا اطلاعات گرفته میشه باید وارد کنید ( `token` | `chat_id` | `domain` )
- بعد از وارد کردن این اطلاعات ربات پنل بر روی سرور شما نصب خواهد شد.
- بعد از نصب یک پیام مبنی بر موفقیت آمیز بودن نصب در ربات به شما ارسال خواهد شد.
- وارد ربات شوید و ربات را `/start` کنید.

## آموزش آپدیت ربات
- برای آپدیت ربات به اخرین نسخه فقط کافیست دستور زیر را اجرا کنید :
```bash
bash <(curl -s https://raw.githubusercontent.com/pooyaserver/pooyaserver/main/update.sh)
```
- بعد از اجرای این دستور , برای آپدیت دستور `1` را ارسال کنید و سپس `y`

## سوالات متداول
- **جوین اجباری**: قفل چوین اجباری ربات از طریق پنل مدیریت ربات تنظیم میشه و محدودتی نداره یعنی میتونید تعداد 5 تا هم جوین اجباری ثبت کنید.
- **ثبت نشدن پنل/سرور در ربات**: دلایل زیادی باعث لاگین نشدن ربات به پنل شما میشه برای مثال باز نبودن دسترسی `CURL` به صورت کامل موفق خطا گرفتن داخل متن توضیحات هست.
- **خطای ست وبهوک موقع نصب**: این خطا زمانی رخ میدهد که توکن ارسالی اشتباه باشد یا هاست شما نمیتواند برای ست وبهوک کردن ربات به سایت تلگرام request بفرستد که دلیل ارسال request ناموفق بسته بودن دسترسی `curl` یا ایرانی بودن هاستتان است.
- **خطای توکن اشتباه موفق نصب**: همونطور که از متن خطا معلومه توکن که برای نصب ارسال کردید اشتباه هست.
- **خطای اطلاعات دیتابیس**: این خطا زمانی رخ میدهد که اطلاعات دیتابیس ارسالی شما به اشتباه هست ( `name` , `username`, `password` ).

## دسترسی های لازم برای نصب روی هاست
- باز بودن دسترسی `CURL`
- باز بودن دسترسی `curl_exec`
- باز بودن پورت های لازمه مثلا `8000`
- مجوز لازم برای ساخت/حذف/ویرایش فایل
- ورژن هاست روی `7.4` باشه ( به زودی روی همه نسخه ها کار میکنه )

## نکات مهم
- به هیچ وجه ادیت خاصی روی سورس اعمال نکنید اگه آپشن خاصی مد نظر دارید در [گروه تلگرامی](https://t.me/pooyaserverGap) پنل پنل میتونید نظرات خود را ثبت کنید.
- حتما حتما ربات جدید برای نصب ربات بسازید یعنی از توکن های قبلی خود استفاده نکنید.
- اطلاعات دیتابیس رو به درستی وارد کنید.
- موقع افزودن پنل به ربات اگر پنلتون ssl داشت ادرس ورودی رو با `https` بدید و در غیر این صورت `http` وارد کنید.
- برای ران کردن ربات در هاست حتما باید ssl دامنه فعال باشد.
- در صورت ران کردن روی هاست , هاست باید خارجی باشد.
- در صورت ران کردن روی سرور باید پسورد `roor` را بدانید.

## **پنل های پشتیبانی شده در ربات**
- Marzban
```bash
sudo bash -c "$(curl -sL https://github.com/Gozargah/Marzban-scripts/raw/master/marzban.sh)" @ install
```
- Sanaei
```bash
bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
```

## آموزش ساخت ربات در BotFather ( مرحله به مرحله )
- وارد ربات [@BotFather](https://t.me/BotFather) شوید و ربات را `/start` کنید.
- دستور `/newbot` را جهت ساخت ربات جدید ارسال کنید.
- نام ربات خود را ارسال کنید.
- یوزرنیم ربات خود را ارسال کنید ( اخر یوزرنیم باید `bot` باشد ).
- در صورت صحیح بودن یوزرنیم ارسالی ربات شما ساخته خواهد شد.
- نمونه توکن ربات :
```bash
66332901756:AAFsGVqaydeIeQJsqCcVbhSJ9fiyBLtR9VU0s
```

## امکانات ربات پنل پنل
- دیزاین شیک و خاش
- مولتی پنل
- مولتی پلن
- افزودن پنل
- ساپورت از پنل سنایی و مرزبان
- افزودن پلن با فیلد های دلخواه
- اشتراک هوشمند
- وضعیت کامل سرور/پنل
- اطلاعات کامل یوزر
- مسدود کردن یوزر
- ازاد کردن یززر
- ارسال پیام به یوزر
- ارسال همگانی
- فوروارد همگانی
- قفل جوین اجباری نامحدود
- درگاه `zarinpal` و `idpay` و به صورت کارت به کارت
- درگاه `NOWPayments`
- تنظیم متون ربات
- گزارش لحضه از در ربات
- مدیریت آمار ربات
- مدیریت کامل بخش درگاه پرداخت
- مدیریت کامل بخش راهنمای اتصال
- مدیریت ضد اسپم ربات
- مدیریت اکانت تست
- لینک هوشمند
- ساخت Qr code برای سرویس
- مدیریت کامل پروتکل ها
- امکان مدیریت کامل پنل/سرور
- امکان مدیریت کامل پلن های اضافه شده ( حذف / تغییر نام / تغییر حجم و . . . )
- افزودن ادمین به صورت نامحدود
- حذف ادمین
- مشاهده لیست ادمین ها
- اطلاع رسانی کامل خرید سرویس و . . .
- پشتیبانی انلاین در ربات
- **در نسخه های بعدی آپشن های زیادی به ربات اضافه خواهد شد.**

## حمایت
- Bank Saman: `6219861935768316`
- Tron (TRX): `TY3JFGRPktAjBQYbfwgMAc5F4sJrDB4Ed9`
- Bitcoin network: `bc1q3fmrdkcwsz9yyzy8a9ud68kfdhxuuj37hewdut`

## کانال و گروه پنل پنل
**حتما به کانال و گروه پنل پنل بپیوندید.**
- Channel: [@pooyaserver](https://t.me/pooyaserver)
- Group: [@pooyaserverGap](https://t.me/pooyaserverGap)
- Bot: [@pooyaserverBot](https://t.me/pooyaserverBot)