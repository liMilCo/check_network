[English](README.md)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
## راهنما
این پکیج هر 2 دقیقه یک بار از سایت گوگل پینگ میگیره و اگر نتونست به شبکه دسترسی داشته باشه یا شبکه مشکلی داشته باشه شبکه رو ریست میکنه.

## چگونه

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



# Install

```
bash <(curl -Lfo- https://raw.githubusercontent.com/limilco/check_network/main/install.sh)
```

# Uninstall

```
bash <(curl -Lfo- https://raw.githubusercontent.com/limilco/check_network/main/uninstall.sh)
```

**Buy Me a Coffee :**

- Tron USDT (TRC20): `TDncy4ESqxsjL2fTv2fFauAnwah7EERrSt`
