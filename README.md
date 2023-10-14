![R (2)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/233f4a2c-3de1-4413-945e-7f6c72b85fbc) **Project Overview:** **FRP-TCP Tunnel-Loadbalance**
---------------------------------------------


![download](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/2071bdb0-805c-4639-83bd-8703fa86098f) [Navigate to my Script](https://github.com/Azumi67/FRP-V2ray-Loadbalance/blob/main/README.md#-my-script)



-------------------------------------------------------
![lang](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/f6468974-f3d7-4c4a-99cc-ae9df6391c3c)**Languages**

- [Persian](https://github.com/Azumi67/FRP-V2ray-Loadbalance#%D8%AA%D8%A7%D9%86%D9%84-tcp-%D8%A8%D8%A7-%D9%84%D9%88%D8%AF-%D8%A8%D8%A7%D9%84%D8%A7%D9%86%D8%B3)

- [English](https://github.com/Azumi67/FRP-V2ray-Loadbalance#-project-overview-frp-tcp-tunnel-loadbalance)


------------------------------------------------------------------------------
![check](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/d8bc4857-3be9-4b74-8ef6-ac1a6f9c4ca3) **Features :**

- You can establish a TCP tunnel with IPV6 on single or mutliple ports.
- You can also do a simple IPV4 tunnel.
- You can create a load balance up to 6 IPV6 on single or multiple ports[for loadbalance multiple ports, the connection  will be chosen randomly so I prefer different IPV6 on single port].
- You can specify port range and establish a tunnel with IPV4/6 
- You can setup FRP with dashboard if you want to with your desired Sub-domain, username/password and custom port for your dashboard.
- There is a service status in the main menu.
- There is a restart button to restart the services.
- You can also use it for openvpn as it supports the tcp protocol, but I've changed some of the names to be relevant to V2ray. for example : kharej v2ray port is just a  name and can also be used for kharej ovpn port.
- It should support x86 and amd64.

  -------------------------------------------------------------------
![6348248](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/aea670b6-0490-40a1-b90a-0f6c9d30c0e7)**Guide**
  - I will describe how to configure FRP simple config, load balancing on single and multiple ports and the dashboard as well.  [ use this as a sample]
  - First configure your iran server please !
  - Please make sure to install X-ui or openvpn on kharej/client. you don't need to install anything on iran side except frp.

![3022470](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/da96f9b0-18cf-4901-bfd9-65043df654d4) **First configure your iran server**

**FRP Kharej - Simple V2ray Config**

![KHAREJ-SIMPLE IPV6](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/ec5822de-fb15-4a77-90a1-3fa0ea80528f)

  - Enter your Iran & Kharej IPV6
  - Tunnel port can be any port, i used 443 here. [Same value for both iran & kharej]
  - Tunnel token is like a password [for example : azumi][Same value for both iran & kharej]
  - Kharej V2ray port is your original port[for example 8080]
  - Iran V2ray port will be your new port used in V2rayng [for example 8081]
  - You can specify port range if you have a lot of ports. for example: kharej v2ray ports = 8080,8081,8082  | iran v2ray ports = 8080,8081,8082

    -------------------------------------------------------------------------------
**FRP Iran - Simple V2ray Config with Dashboard**

   ![Exclamation-Mark-PNG-Clipart](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/9db1ca71-d92f-45e2-939f-48425d3edad6) **Don't use Capital words like here**


![IRAN DASHBOARD2](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/d48e6c27-6b70-415b-8363-b4426eea2f59)
   - If you don't have a domain, please use "without dasboard version".
   - Tunnel port can be anything, i used 332[Same value for both Kharej & Iran]
   - Tunnel token is like password [for example azumi]
   - Iran v2ray port will be your new port used in V2rayng [for example 8081]
   - Kharej V2ray port is your original port [for example 8080]
   - Enter your subdomain and your email [it's not in the picture above]
   - Enter your desired Dashboard username/password and port.[ i used azumi for username/password and 700 as port]
   - You can connect to your tunnel dashboard using https://sub-domain.com:700. << This is an example.
   - Do the same thing  in iran side as well. you can specify port range if you have a lot of ports. for example: kharej v2ray ports = 8080,8081,8082  | iran v2ray ports = 8080,8081,8082 < this is an example

     ![R (12)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/2f672098-4b41-4da7-b930-7f17f2c774e2) Additional example :
     - You can use different methods if you want. for example you can establish a tunnel using 3 kharej IPV6 with different ports and on iran side, from the menu, choose single config and use a port range instead. ( you don't need to choose mutli config if you don't want to)
     - for example :
       1. Kharej server : IPV6-1 kharej v2ray port : 8080 | iran v2ray port : 8080 ---- IPV6-2 kharej v2ray port : 8081 | iran v2ray port : 8081
       2. iran server : kharej v2ray port : 8080,8081 | iran v2ray port : 8080,8081

  - Multi config on iran menu is there for people who wants to use different ipv6 for every port on iran side as well and not just kharej side.
  - Make sure that your kharej & v2ray ports are correct both on kharej & iran side.

-----------------------------------------------------------------------------------
**FRP Kharej - Simple V2ray Multiple ports**

   ![Exclamation-Mark-PNG-Clipart](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/a1182e5c-b914-4a36-a4c6-776399033d14) **I used 3 IPV6 with three different ports** [You can test different methods]

![simple ipv6 mutli](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/68a65f8e-c132-4da1-8b75-7d7079161d3c)


  - Create 4 IPV6 for iran, one for tunnel and 3 for different ports.
  - Create 3 Kharej IPV6 for different ports.
  - Enter your Iran IPV6.
  - Kharej V2ray port is your original v2ray port [for example 8080]
  - Iran V2ray port will be your new v2ray port [here we use the same port for kharej and iran v2ray port, you can use a different port than the original one for iran side].
  - I used the same port for Iran & Kharej V2ray port for every IPV6 that i have added.
  - Enter a different port for each new Kharej IPV6.
  - Enter as many Kharej IPV6s as you want, I chose 3 IPV6s.
  - Enter the health check interval for each Khare IPV6 [for example 10 seconds].
  - On kharej side there is a tcp health check.

    ----------------------------------------------------------------------------
 **FRP Iran - Simple V2ray Multiple Ports**

  ![Exclamation-Mark-PNG-Clipart](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/5353de60-a16c-4cad-a824-afcc2d695029) **I used 3 IPV6 for iran[3 IPV6 for kharej]**

![simple iran multi](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/f827c7df-c7ff-49da-a004-3406cd9bc1d9)

   - I used one Iran IPV6 for the tunnel in the Kharej server above.
   - Enter your remaining Iran IPV6 when prompted.
   - Enter your subdomain and email, choose a username, password and port when asked.
   - Enter Tunnel Port [for example 443 or any port you want]- Same value for both Kharej & Iran
   - Enter Iran and Kharej v2ray port, I used the same port for each new IPV6. [You can test different ports.] for example : IPV6(1) = kharej v2ray port 8080 | iran v2ray port 8080. use another port for the next ipv6.
   - Kharej v2ray port is your original v2ray port and Iran v2ray port is your new v2rayng port.
   - This works well with Kharej multiple IPV6 and ports[ Directory : FRP Simple V2ray-Kharej-IPV6-mutli ipv6 tunnel]
   - Make sure to enter the same port for iran side as you have choosen on kharej server. for example if you have choosen 8080 for kharej v2ray port on kharej side, you should enter the same port for kharej v2ray port on iran side.
     

![Exclamation-Mark-PNG-Clipart](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/9e1dd2ee-01ee-4888-9ef8-c68ac19cf5c5) Additional Info :
- You can use different methods, you don't need to use mutli config on iran side if you don't want to set an ipv6 for every port.
 - let me give you an example :
 - A. Kharej side: You have 2 IPV6 | IPV6-1 - Kharej v2ray port : 8080 - Iran v2ray port : 8080 | IPV6-2 - Kharej v2ray port : 8081 - Iran v2ray port : 8081
 - B. Iran side : You have selected single config : Kharej v2ray port : 8080,8081 | Iran v2ray port : 8080,8081
 - or you can use mutli config for iran server and proceed with the examples given in the picture above. ( for each ipv6, you enter a new port)

------------------------------------------------------------------------------------------
**LoadBalance Kharej Single Port**

![LOADBALANCE SINGLE PORT KHAREJ](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/7e005c6f-0e60-4ca5-980c-d41be7c61b37)

- I have chosen 3 Kharej IPV6 and 1 Iran IPV6 for this purpose.
- Tunnel token is like password [Don't use capital word. Same value for Kharej & Iran. For example : azumi].
- Tunnel Port is the same for Kharej & Iran. [For example : 443]
- Enter your Iran IPV6 address.
- Kharej V2ray port is your original v2ray port [e.g. 8080].
- Iran V2ray port will be your new v2ray port [for example 8081,443 etc..].
- Select health check interval for each Kharej IPV6 [for example 10 seconds].

![Exclamation-Mark-PNG-Clipart](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/ee2fa4f2-ac98-472c-8505-06f5738c6a39) **NOTE**
- You can choose a single port for your kharej & iran v2ray ports. [ for example : if you have 2 IPV6, for each ipv6 you enter a single point for iran & kharej v2ray port] for example kharej & iran v2ray ports : both 8080 OR kharej v2ray port 8080 | Iran v2ray port 443
- You can choose a different port for iran and another for kharej v2ray port. for example : 443 for iran, 8080 for kharej
- You only need one IPV6 for iran server.
- You can have as many IPV6 for kharej server.
- Make sure to enter the same port for iran side as you have choosen on kharej server. for example if you have choosen 8080 for kharej v2ray port on kharej side, you should enter the same port for kharej v2ray port on iran side.


  -----------------------------------------------------------------------------------
**Loadbalance Iran Single Port**

  ![IRAN DASHBOARD2](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/805971fd-d35d-4d93-9a5e-ab7911362870)

  - Tunnel token is like password [same value you entered in kharej server. For example : azumi].
  - Tunnel port can be any port [same value you entered in kharej server, for example : 443].
  - Enter your dashboard username, password and desired port. [for example : https://yourdomain.com:700]
  - Kharej V2ray port is your original v2ray port [e.g. 8080].
  - Iran V2ray port will be your new v2ray port [for example 8081,443 etc..].you can also use the same port for iran & kharej v2ray port.
  - One single port for both Kharej & iran V2ray port.

![R (12)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/75d10b0e-6f41-4172-82a0-fda086593b6e) **Additional info :**
**Loadbalance Multiple ports**
- For loadbalancing multiple ports, it uses random method. it means if you have different ports, it may connect to one port at a time as the loadbalancer is working like that. that is why i prefer multiple IPV6 on a single port. [You can try different method and different ports.]
- Let's say you have 3 Kharej IPV6 with three different ports[ 8080-8081-8082], for your first kharej IPV6... you enter 8080 for both kharej/iran v2ray port and so on. [You can of course enter 8080 for kharej V2ray port and one single port [443] for every Iran V2ray ports.
- On iran side, if you are using one local ip, you should give port range for kharej/iran v2ray port. for example : kharej v2ray port : 8080,8081,8082 - iran v2ray port : 8080,8081,8082 << This should be done on iran side- loadbalance section.
- On iran side, if you are using three local ips[Iran IPV6} , you can enter the ports for every IPV6 seperately.<< this is available on simple v2ray tunnel nad it is not considered loadbalance hence not in loadbalance section.
- Don't use capital words when entering your inputs.
- Always configure iran server first.
- Make sure to enter the same port for iran side as you have choosen on kharej server. for example if you have choosen 8080 for kharej v2ray port on kharej side, you should enter the same port for kharej v2ray port on iran side.

 -----------------------------------------------------------------------------------------------

![scri](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/d6fe92dc-e828-425f-9a65-1db507259872)**Helpful Scripts**

- First, although it's optional, I recommend using the [opiran](https://github.com/opiran-club) vps optimiser or any other script you prefer:
```
apt install curl -y && bash <(curl -s https://raw.githubusercontent.com/opiran-club/VPS-Optimizer/main/optimizer.sh --ipv4)
```

- You can make extra Native IPV6 easily with this script below :
  
```
bash <(curl -s -L https://raw.githubusercontent.com/opiran-club/softether/main/opiran-seth)
```

--------------------------------------------------------------------------------------------

![R (a2)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/4dc5f196-1130-4870-b5bc-1be80c2d3a2a) **My Script** 
-----------------------------------------------------------

```
apt install curl -y && bash <(curl -Ls https://raw.githubusercontent.com/Azumi67/FRP-V2ray-Loadbalance/main/frptcp.sh --ipv4)
```

----------------------------------------------------------------------
![R (7)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/c159b96c-2b1d-460e-9c11-fd44660b5630) **Telegram channel :**
![R (6)](https://github.com/Azumi67/FRP-Wireguard/assets/119934376/b9c77229-d9b2-42e3-910c-a0a2ea820c92) [OPIRAN](https://github.com/opiran-club)

----------------------------------------------
![R23 (1)](https://github.com/Azumi67/FRP-Wireguard/assets/119934376/31baa226-5045-4489-90d2-1a066a91e880)

![R (6)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/be0dd34c-7b47-4d93-904c-eecf013d7b06)[FRP-Source](https://github.com/fatedier/frp)

![R (9)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/33388f7b-f1ab-4847-9e9b-e8b39d75deaa)[VPS-optimize & Extra IP](https://github.com/opiran-club)


------------------------------------------------------------------------------------------------------------
![youtube-131994968075841675](https://github.com/Azumi67/FRP-Wireguard/assets/119934376/dcde492b-ba44-4837-bb50-bbe4b3ac843a) **Video Guide :**  Soon



-----------------------------------------------------------------------------------------------------------------------------------

![R (2)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/91f1ac45-d411-4005-8e12-7acee9c0054f)
**تانل TCP با لود بالانس**
------------------------------------------


![check](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/e88c4e01-657f-4af8-9cf3-4e08c55ab19f)
**امکانات**

- ایجاد تانل TCP با ایپی ورژن 4 و 6 ( به طور مثال برای V2ray ایجاد کنید.)
- میتوانید از تک یا چندین پورت اگر تعداد کانفیگ بیشتری دارید برای تانل استفاده نمایید.
- میتوانید از port range استفاده نمایید اگر پورت های زیادی دارید.( امکان تانل با ایپی 4 و 6)
- میتوانید برای هر پورت یک ایپی ورژن 6 اختصاص دهید و بر روی تک پورت، لود بالانس ایجاد نمایید.
- میتوانید بر روی چندین پورت با ایپی ورژن های مختلف ، لود بالانس ایجاد نمایید. (کانکشن رندوم خواهد بود.)
- قابلیت TCP healthcheck برای لود بالانس
- امکان ایجاد داشبورد تانل با ساب دامین، نام کاربری، رمز عبور و پورت دلخواه شما.
- امکان مشاهده سرویس و ریست کردن آن.
- میتوان برای تانل openvpn هم استفاده کرد چون از پروتکل tcp پشتیبانی میکند اما نام ها برای v2ray انتخاب شده است ولی در اصل تفاوتی ایجاد نمیکند. به طور مثال پورت v2ray خارج که میتوان اینگونه هم نوشت < پورت ovpn خارج. 
- پشتیبانی از x86 و amd64.

---------------------------------------------

![6348248](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/fee3ff53-0570-468d-b4bd-097687d1bed6)
**آموزش**
- نخست سرور ایران را کانفیگ کنید.
- سرور خارج - ساخت تانل ساده تک پورت

![KHAREJ-SIMPLE IPV6](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/16855308-9c31-47c1-933c-077a557e1611)
<div dir="rtl">&bull; ایپی 6 ایران و خارج را وارد نمایید.</div>
<div dir="rtl">&bull; پورت تانل میتواند هر پورتی باشد ( پورت تانل باید برای ایران و خارج یکسان باشد)</div>
<div dir="rtl">&bull; توکن تانل مانند پسورد میباشد ( توکن برای ایران و خارج یکسان میباشد)</div>
<div dir="rtl">&bull; پورت v2ray خارج، پورت اصلی کانفیک شما است.</div>
<div dir="rtl">&bull; پورت v2ray ایران، پورت v2rayng شما خواهد بود.</div>
<div dir="rtl">&bull; برای تعداد بالای پورت میتوان از port range استفاده نمایید. به طور مثال : پورت v2ray خارج : 8080,8081,8082 و برای پورت v2ray ایران : 8080,8081,8082</div>

  
  -------------------------------------------

   **سرور ایران - تانل تک پورت با داشبورد**
  
  ![IRAN DASHBOARD2](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/040c5bd9-7dcd-4154-b1d0-4186f480467a)

  
<div dir="rtl">&bull; اگر دامین ندارید لطفا از نسخه بدون داشبورد برای کانفیگ ایران استفاده نمایید.</div>
<div dir="rtl">&bull; پورت تانل میتواند هر پورتی باشه. من 443 قرار دادم.ورت تانل در سرور ایران و خارج باید یکی باشد</div>
<div dir="rtl">&bull; توکن مانند پسورد است ( باید هم در سرور خارج و ایران، از یک توکن یکسان استفاده نمایید)</div>
<div dir="rtl">&bull; پورت v2ray ایران همان پورت v2rayng شما خواهد بود. ( اطفا دقت کنید که پورتی که برای سرور ایران انتخاب کردید هم در سرور خارج و ایران یکسان باشد) . به طور مثال اگر در سرور خارج پورت 8081 را برای پورت v2ray ایران انتخاب کرده اید، همان پورت را هم در سرور ایران وارد نمایید.</div>
<div dir="rtl">&bull; پورت v2ray خارج همان پورت اصلی کانفیگ شما است .</div>
<div dir="rtl">&bull; اگر گزینه داشبورد دار را انتخاب کرده اید، پس از وارد کردن نام ساب دامین و ایمیل، نام کاربری، رمزعبور و پورت دلخواهتون را وارد نمایید.</div>
<div dir="rtl">&bull; برای تعداد بالای پورت میتوان از port range استفاده نمایید. به طور مثال : پورت v2ray خارج : 8080,8081,8082 و برای پورت v2ray ایران : 8080,8081,8082</div>

----------------------------------
 
![Exclamation-Mark-PNG-Clipart](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/07548d47-50c0-4bc6-831d-a602a7267dd6) **توجه**
 
 <div dir="rtl">&bull; اگر کانفیگ شما به هر دلیلی وصل نشد لطفا دقت کنید که پورت های خارج و ایران به درستی هم در سرور ایران و خارج وارد شده اند.میتوانید از پورت های مختلفی برای تانل و پورت v2ray خارج و ایران آزمایش کنید.</div>

-----------------------------------------------------------------

 ![R (12)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/f0c6aff8-3070-4195-97db-33f44791326b) **اطلاعات اضافی**
 
  <div dir="rtl">&bull; میتوانید از روش های مختلف برای کانفیگ کردن استفاده نمایید. به طور مثال شما میخواهید با 3 ایپی 6 خارج و 1 ایپی 6 ایران روی 3 پورت متفاوت، تانل را ایجاد کنید.در سرور خارج ازمنوی ایپی6 و گزینه مولتی کانفیگ، ایپی 6 ایران و پورت و توکن تانل را وارد میکنید و سپس ایپی 6 های خارج را وارد مینمایید.
  برای هر ایپی 6 یک پورت برای سرور خارج و ایران قرار میدیم. به طور مثال ایپی 6 اول، پورت v2ray خارج و ایران 8080 قرار میدهیم.
  برای ایپی 6 دوم، پورت های v2ray ایران و خارج را 8081 قرار میدهیم. 
  حالا در سرور ایران، کانفیگ تک پورت را انتخاب میکنیم چون میخواهیم تنها از یک ایپی 6 ایران استفاده کنیم . برای همین میتوانیم از port range استفاده کنیم. پس به این صورت پورت v2ray خارج 8080,8081 میشه و پورت v2ray ایران هم 8080,8081 میشه.</div>
 <div dir="rtl">&bull;</div>

 <div dir="rtl">&bull; میتوانید از کانفیگ چند ایپی و پورت برای سرور ایران استفاده کنید که گزینه مولتی کانفیگ برای همین مورد میباشد و باید به تعداد ایپی 6 خارج ، ایپی 6 ایران بسازید و به ازای هر ایپی 6 یک پورت جداگانه بذارید. عکس بعدی در همین باب میباشد.</div>

-----------------------------------------------------------------

 **سرور خارج - تانل مولتی کانفیگ با چندین ایپی 6**
  
![simple ipv6 mutli](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/4f08ac5f-b6c9-4178-821f-481617457f71)

 <div dir="rtl">&bull; اینجا از 3  ایپی 6 خارج و 4 ایپی 6 ایران استفاده شده است که یکی از ایپی 6 های ایران برای تانل میباشد</div>
   <div dir="rtl">&bull; تعداد ایپی 6 برای سرور خارجتون را وارد کنید به طور مثال من 3 ایپی 6 میخواستم. سپس ایپی های 6 خارج را مانند عکس وارد نمایید.</div>
   -
  <div dir="rtl">&bull;  ایپی 6 ایران برای تانل را وارد نمایید.</div>
    <div dir="rtl">&bull; پورت تانل 443 و همچنین توکن تانل را وارد میکنید و باید همان را در سرور ایران هم وارد نمایید.</div>
    -
     <div dir="rtl">&bull; پورت v2ray خارج که همان پورت اصلی کانفیگ میباشد را وارد میکنیم. به طور مثال پورت من 8080 است. دقت کنید که برای هر ایپی 6 خارج، شما پورت متفاوتی میدهید. به طور مثال برای ایپی 6 اول، پورت v2ray خارج 8080 و برای ایپی 6 دوم، پورت v2ray خارج 8081 میباشد.</div>
      <div dir="rtl">&bull; پورت v2ray ایران همان پورت v2rayng شما خواهد بود. برای هر ایپی 6 خارج مانند مثال بالا پورت متفاوت وارد نمایید.</div>
      -
       <div dir="rtl">&bull; دقت کنید که پورت هایی که در اینجا برای سرور خارج و ایران وارد میکنید در سرور ایران هم به همین صورت وارد نمایید.</div>
        <div dir="rtl">&bull; برای هر ایپی 6 مدت زمان بررسی tcp health check را مشخص کنید. تنها در سرور خارج این امکان را قرار دادم.</div>
         <div dir="rtl">&bull; برای کانفیگ سرور ایران میتوانید از دو روش single port یا mutli port استفاده نمایید که روی عکس بعدی توضیح میدم.</div>


-------------------------------------------------------------- 
 **سرور ایران - تانل با چندین ایپی 6 ایران و پورت های متفاوت**
 <div dir="rtl">&bull;</div>
 
  ![simple iran multi](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/db1e4433-8f80-4641-aa0a-69858a644c93)

 <div dir="rtl">&bull;  عکس قبلی در سرور خارج از 4 ایپی 6 ایران ( یک ایپی 6 ایران برای تانل در سرور خارج) استفاده شده است و 3 تا دیگر در سرور ایران استفاده خواهد شد. </div>
 <div dir="rtl">&bull; نام ساب دامین، ایمیل را برای گرفتن cert وارد کنید. نام کاربری، رمزعبور و پورت دلخواهتون را بدید تا داشبورد برای شما فعال شود.</div>
 <div dir="rtl">&bull; پورت تانل را قرار بدهید. پورت تانل در سرور ایران و خارج باید یکسان باشد.</div>
 -
  <div dir="rtl">&bull; به ازای هر ایپی 6 ایران، پورت متفاوتی بدهید. به طور مثال در عکس قبلی برای پورت v2ray خارج و ایران به ازای هر ایپی 6 خارج پورت متفاوتی گذاشتیم. برای اولین ایپی 6 خارج مقدار 8080 را وارد کردیم. پس داخل سرور ایران هم باید به ازای هر ایپی 6 ایران، پورت متفاوت میدهیم.بدین صورت برای اولین ایپی 6 ایران مانند سرور خارج، پورت v2ray خارج و ایران را 8080 قرار دادیم. سایر ایپی ها هم به همین صورت خواهد بود اما با پورت متفاوت .</div>
  -
   <div dir="rtl">&bull; توکن تانل را وارد کنید . به طور مثال azumi. باید در سرور خارج و ایران یکسان باشد</div>
   -
    <div dir="rtl">&bull; این کانفیگ برای کسانی هست که قصد استفاده از چنیدن پورت با چندین ایپی 6 خارج و ایران دارند. شما میتوانید مانند عکس قبلی سرور خارج را کانفیگ کنید و از سرور ایران تک پورت با port range استفاده کنید. به طور مثال : شما 2 ایپی 6 با پورت های 8080 و 8081 در سرور خارج ساختید و نمیخواهید از چندین ایپی 6 در ایران هم استفاده کنید و از port range در سرور ایران میخواهید استفاده کنید.
   نمونه کانفیگ به این صورت خواهد بود. پورت v2ray خارج = 8080,8081 و پورت v2ray ایران = 8080,8081</div>
    <div dir="rtl">&bull; دقت کنید که پورت هایی که برای v2ray هر ایپی 6 در سرور خارج دادید همان پورت را در سرور ایران برای هر ایپی 6 وارد کنید.</div>

--------------------------------------------------------------------
 **لود بالانس تک پورت - سرور خارج**
 <div dir="rtl">&bull;</div>

![LOADBALANCE SINGLE PORT KHAREJ](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/cae1ed51-965e-4979-9a33-42588ba9b696)

 <div dir="rtl">&bull;از 3 ایپی 6 خارج و 1 ایپی 6 ایران در این روش استفاده شده است.برعکس روش های قبل برای هر ایپی 6 تنها یک پورت را انتخاب میکنیم</div>
  <div dir="rtl">&bull; توکن تانل مانند پسورد میباشد. باید هم در سرور ایران وخارج یکسان باشد.</div>
   <div dir="rtl">&bull;پورت تانل مینواند هر پورتی باشد. به طور مثال 443 که باید هم در سرور ایران و خارج یکسان باشد.</div>
    <div dir="rtl">&bull; ایپی 6 ایران خود را وارد کنید و به به ازای هر ایپی 6 خارج تنها یک پورت یکسان بدهید. به طور مثال پورت v2ray خارج 8080 و پورت v2ray ایران 8080 یا8081 یا 443 میتواند باشد. لطفا همان پورت را در سرور ایران هم وارد نمایید.</div>
     <div dir="rtl">&bull; پورت خارج همان پورت اصلی کانفیگ شما و پورت ایران پورت جدید v2rayng شما میباشد</div>
      <div dir="rtl">&bull; زمان مناسب برای tcp health check ایپی 6 های خارجتان را انتخاب نمایید که در صورت سالم نبودن ایپی 6 شما از لود بالانس خارج شود.</div>
       <div dir="rtl">&bull; نگران زمان tcp health checkنباشید.10 ثانیه زمان پیش فرض ان است. لطفا به صورت دستی وارد نمایید.</div>

------------------------------------------

 **لود بالانس تک پورت - سرور ایران**

![Screenshot 2023-10-11 055029](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/75a3a0cc-60d2-474d-839f-c9b48974f6c6)

 <div dir="rtl">&bull; تانل توکن مانند پسورد میباشد. در هر دو سرور ایران و خارج باید یکسان باشد.</div>
  <div dir="rtl">&bull; پورت تانل میتواند هر پورتی باشد. به طور مثال 443 و باید در هر دو سرور ایران و خارج یکسان باشد.</div>
   <div dir="rtl">&bull; نام ساب دامین، ایمیل، نام کاربری، رمزعبور و پورت دلخواه را وارد نمایید.</div>
    <div dir="rtl">&bull; پورت v2ray خارج همان پورت اصلی کانفیگ شما میباشد. همان پورتی را قرار دهید که در سرور خارج قرار داده اید.</div>
     <div dir="rtl">&bull; پورت ایران همان پورت جدید شما در v2rayng خواهد بود. همان پورتی را قرار دهید که برای سرور ایران در سرور خارج قرار داده اید.</div>

------------------------------------------------------------------------------------

 **لود بالانس مولتی پورت - سرور خارج**

 <div dir="rtl">&bull; در لود بالانس مولتی پورت ، کانکشن شما بر روی هر پورت به صورت تصادفی خواهد بود</div>
 <div dir="rtl">&bull; شما میتوانید از چندین پورت متفاوت برای سرور خارج وایران استفاده کنید یا پورت متفاوت برای سرور خارج ولی ورت یکسان برای سرور ایران استفاده نمایید.</div>
  <div dir="rtl">&bull; به طور مثال (روش اول): در روش اول شما برای هر کانفیگ پورت متفاوتی در سرور خارج دارید. کانفیگ اول 8080، دوم 8081 و سوم 8082. میتوانید برای پورت v2ray ایران هم برای کانفیگ اول 8080، کانفیگ دوم 8081 و کانفیگ سوم 8082 بذارید. ( باید همین پورت ها هم در سرور ایران یا به صورت مولتی ipv6 یا تک ایپی و استفاده از port range اضافه نمایید)</div>
   <div dir="rtl">&bull; مثال دوم(روش دوم) : شما 3 کانفیگ مانند مثال بالا با پورت های 8080، 8081 و 8082 ذارید.پورت v2ray خارج به ازای هر ایپی 6 به ترتیب 8080 ، 8081 و 8082 خواهد بود و پورت ثابت 443 برای پورت های v2ray ایران. >> این تنطیمات در سرور خارج بود. در سرور ایران، شما پورت v2ray خارج را 8080,8081,8082 و پورت v2ray ایران را 443 میگذارید.</div>
 <div dir="rtl">&bull; در عکس پایین از روش اول استفاده شده است.</div>

 <div dir="rtl">&bull;</div>
 
  ![Screenshot 2023-10-11 074043](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/2c130333-f5aa-46c4-b8be-0024f066fd2d)

 <div dir="rtl">&bull; ایپی 6 ایران را وارد نمایید</div>
  <div dir="rtl">&bull; پورت و توکن تانل را وارد کنید و باید در هر دو سرور ایران و خارج یکسان باشد.</div>
   <div dir="rtl">&bull; مانند توضیحات بالا و مطابق عکس میتوانید برای هر ایپی 6 خارج پورت جداگانه بذارید.</div>



   ----------------------------------

  **لود بالاتس مولتی پورت - سرور ایران** 

  ![iran](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/1dbd5e4f-71d5-4ce8-8358-ba307ab03be7)

   <div dir="rtl">&bull; پورت و توکن تانل را مشابه سرور خارج وارد میکنید.</div>
 <div dir="rtl">&bull; پورت v2ray خارج مانند سرور خارج خواهد بود اما چون از تک ایپی در سرور ایران استفاده خواهیم کرد، بنابراین از پورت رنج استفاده میکنیم. پورت v2rayخارج  8080,8081,8082</div>
  <div dir="rtl">&bull; پورت v2ray ایران هم مانند سرور خارج وارد میکنید . پس پورت v2ray ایران 8080,8081,8082 میباشد.</div>
   <div dir="rtl">&bull; اگر در سرور خارج پورت v2ray خارج 8080 و 8081 و 8082 بود ولی پورت v2ray ایران تک پورت 443 بود، بنابراین در سرور ایران هم همین مقدار را میگذارید. به طور مثال پورت v2ray ایران 443</div>
    <div dir="rtl">&bull; میتوانید از port range بدین صورت هم در سرور ایران استفاده نمایید. به طور مثال پورت v2ray خارج = 8082-8080 و پورت v2ray ایران = 8082-8080</div>


--------------------------------

![scri](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/cbfb72ac-eff1-46df-b5e5-a3930a4a6651)
**اسکریپت های کارآمد :**

 <div dir="rtl">&bull; میتوانید از اسکریپت opiran vps optimizer یا هر اسکریپت دیگری استفاده نمایید.</div>
 
 
  ```
apt install curl -y && bash <(curl -s https://raw.githubusercontent.com/opiran-club/VPS-Optimizer/main/optimizer.sh --ipv4)
  ```
  
  --------------------
   <div dir="rtl">&bull; اضافه کردن ایپی 6 اضافه</div>
 
  
  ```
  bash <(curl -s -L https://raw.githubusercontent.com/opiran-club/softether/main/opiran-seth)
 ```


  ---------------------------------------------

![R (a2)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/2b8cac5e-ff8b-453d-a42d-a21a5339f156)
**اسکریپت frp بود بالانس**

  ```apt install curl -y && bash <(curl -Ls https://raw.githubusercontent.com/Azumi67/FRP-V2ray-Loadbalance/main/frptcp.sh --ipv4) ```

    ---------------------------------------------
![R (7)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/3f13cee6-9e15-484a-985e-6ff3b35938b8)
**کانال تلگرام**

![R (6)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/f81bf6e1-cfed-4e24-b944-236f5c0b15d3) [اپیران](https://github.com/opiran-club)



---------------------------------
![R23 (1)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/18d12405-d354-48ac-9084-fff98d61d91c)
**سورس ها**

![R (6)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/be0dd34c-7b47-4d93-904c-eecf013d7b06) [سورس های FRP](https://github.com/fatedier/frp)

![R (9)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/33388f7b-f1ab-4847-9e9b-e8b39d75deaa) [سورس های اپیران](https://github.com/opiran-club)

----------------------
![youtube-131994968075841675](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/24202a92-aff2-4079-a6c2-9db14cd0ecd1)
**ویدیوی آموزش**
