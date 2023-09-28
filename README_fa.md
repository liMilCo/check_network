[English](README.md)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
## راهنما
این پکیج هر 2 دقیقه یک بار از سایت گوگل پینگ میگیره و اگر نتونست به شبکه دسترسی داشته باشه یا شبکه مشکلی داشته باشه شبکه رو ریست میکنه.

# Install

```
bash <(curl -Lfo- https://raw.githubusercontent.com/limilco/check_network/main/install.sh)
```

# Uninstall

```
bash <(curl -Lfo- https://raw.githubusercontent.com/limilco/check_network/main/uninstall.sh)
```


## ساخت برنامه به صورت دستی

ابتدا یک فایل با نام check_network در شاخه home میسازیم و کد های زیر را در آن وارد میکنیم:
این فایل خیلی ساده یک لینک یا ایپی (مثلا google.com یا 1.1.1.1) را پینگ میگیرد و اگر شکست خرد سرویس شبکه را با کد: (systemctl restart systemd-networkd) ریست میکند. همچنین برای برسی آینده زمان ریست شدن شبکه را در فایل check_network.log ذخیره میکند.

```shell
#!/bin/bash
ROUTER_IP=google.com

TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`

if ( ! ping -c1 $ROUTER_IP ) then
        echo "Net is down!! Attempting to restart at $TIMESTAMP." >> /home/check_network.log

        systemctl restart systemd-networkd
fi
```
برای این کار ابتدا با دستور 
```
nano /home/check_network
```
فایل را ایجاد کرده کد های بالا را کپی کنید و در این فایل پیست کنید بعد با دکمه [کنترل + O] و [اینتر] فایل را ذخیره کنید و با دکمه [کنترل + X] از برنامه خارج شده و به خط فرمان برگردید. بعد برای اجرایی کردن این فایل دستور زیر را اجرا کنید:

```
chmod +x /home/check_network
```

برای ساخت فایل بازبینی (log) دستور زیر را اجرا کنید:

```
echo "#Network Restart" > /home/check_network.log
```
برای اینکه این فایل در دوره های مشخص مثلا هر 2 دقیقه یک بار اجرا شود، با کد زیر را اجرا کنید؛
با این کار در شاخه (/etc/cron.d) یک فایل با نام (check_network_or_rst) میسازیم و متن زیر را در آن وارد میکنیم.
```
echo "*/2 * * * * root  /home/check_network" > /etc/cron.d/check_network_or_rst
```

## حذف برنامه به صورت دستی

برای حذف این برنامه کافیست فایل های زیر را با دستور rm حذف کنیم یا کد زیر را اجرا کنیم:

```shell
rm /home/check_network
rm /home/check_network.log
rm /etc/cron.d/check_network_or_rst 
```

**Buy Me a Coffee :**

- Tron USDT (TRC20): `TDncy4ESqxsjL2fTv2fFauAnwah7EERrSt`
