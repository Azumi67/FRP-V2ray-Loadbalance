![R (2)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/233f4a2c-3de1-4413-945e-7f6c72b85fbc) **Project Overview:** **FRP-TCP Tunnel-Loadbalance**
---------------------------------------------

![check](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/d8bc4857-3be9-4b74-8ef6-ac1a6f9c4ca3) **Features :**

- You can establish a TCP tunnel with IPV6 on single or mutliple ports.
- You can also do a simple IPV4 tunnel.
- You can create a load balance up to 6 IPV6 on single or multiple ports[for loadbalance multiple ports, the connection  will be chosen randomly so I prefer different IPV6 on single port].
- You can setup FRP with dashboard if you want to with your desired Sub-domain, username/password and custom port for your dashboard.
- There is a service status in the main menu.
- There is a restart button to restart the services.
- It should support x86 and amd64.

  -------------------------------------------------------------------
![1234](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/51070f36-f6ee-4c03-b0c1-22ca1c49b172) **Guide**
  - I will describe how to configure FRP simple config, load balancing on single and multiple ports and the dashboard as well.  [ use this as a sample]

![3022470](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/da96f9b0-18cf-4901-bfd9-65043df654d4) **First configure your iran server if possible**

**FRP Kharej - Simple V2ray Config**

![KHAREJ-SIMPLE IPV6](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/ec5822de-fb15-4a77-90a1-3fa0ea80528f)

  - Enter your Iran & Kharej IPV6
  - Tunnel port can be any port, i used 443 here. [Same value for both iran & kharej]
  - Tunnel token is like a password [for example : azumi][Same value for both iran & kharej]
  - Kharej V2ray port is your original port[for example 8080]
  - Iran V2ray port will be your new port used in V2rayng [for example 8081]

    -------------------------------------------------------------------------------
**FRP Iran - Simple V2ray Config with Dashboard**

   ![Exclamation-Mark-PNG-Clipart](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/9db1ca71-d92f-45e2-939f-48425d3edad6) **Don't use Capital words like here**


![IRAN DASHBOARD2](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/d48e6c27-6b70-415b-8363-b4426eea2f59)
   
   - Tunnel port can be anything, i used 332[Same value for both Kharej & Iran]
   - Tunnel token is like password [for example azumi]
   - Iran v2ray port will be your new port used in V2rayng [for example 8081]
   - Kharej V2ray port is your original port [for xample 8080]
   - Enter your subdomain and your email [it's not in the picture above]
   - Enter your desired Dashboard username/password and port.[ i used azumi for username/password and 700 as port]
   - You can connect to your tunnel dashboard using https://sub-domain.com:700. << This is an example.

-----------------------------------------------------------------------------------
**FRP Kharej - Simple V2ray Multiple ports**

   ![Exclamation-Mark-PNG-Clipart](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/a1182e5c-b914-4a36-a4c6-776399033d14) **I used 3 IPV6 with three different ports** [You can test different methods]

![simple ipv6 mutli](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/d88f7be4-9178-452c-8f92-a6eaf479fdee)

  - Create 4 IPV6 for iran, one for tunnel and 3 for different ports.
  - Create 3 IPV6 for kharej for different ports.
  - Enter your Iran IPV6.
  - Kharej V2ray port is your original v2ray port [forexample 8080]
  - Iran V2ray port will be your new v2ray port [here we use the same port for kharej and iran v2ray port, you can use a different port than the original one for iran side].
  - Enter a different port for each new Khare IPV6.
  - Enter as many Kharej IPV6s as you want, I chose 3 IPV6s.
  - Enter the health check interval for each Khare IPV6 [for example 10 seconds].

    ----------------------------------------------------------------------------
 **FRP Iran - Simple V2ray Multiple Ports**

  ![Exclamation-Mark-PNG-Clipart](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/5353de60-a16c-4cad-a824-afcc2d695029) **I used 3 IPV6 for iran[3 IPV6 for kharej]**

![simple iran multi](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/f827c7df-c7ff-49da-a004-3406cd9bc1d9)

   - I used one Iran IPV6 for the tunnel in the Kharej server above.
   - Enter your remaining Iran IPV6 when prompted.
   - Enter your subdomain and email, choose a username, password and port when asked.
   - Enter Tunnel Port [for example 443 or any port you want]- Same value for both Kharej & Iran
   - Enter Iran and Kharej v2ray port, I used the same port for each new IPV6. [You can test different ports.]
    - Kharej v2ray port is your original v2ray port and Iran v2ray port is your new v2ray port.

      ---------------------------------------------------------------
**LoadBalance Kharej Single Port**

![LOADBALANCE SINGLE PORT KHAREJ](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/7e005c6f-0e60-4ca5-980c-d41be7c61b37)

- I have chosen 3 Kharej IPV6 and 1 Iran IPV6 for this purpose.
- Tunnel token is like password [Don't use capital word. Same value for Kharej & Iran. For example : azumi].
- Tunnel Port is the same for Kharej & Iran. [For example : 443]
- Enter your Iran IPV6 address.
- Kharej V2ray port is your original v2ray port [e.g. 8080].
- Iran V2ray port will be your new v2ray port [for example 8081,443 etc..].
- Select health check interval for each Kharej IPV6 [for example 10 seconds].

  -----------------------------------------------------------------------------------
**Loadbalance Iran Single Port**

  ![IRAN DASHBOARD2](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/805971fd-d35d-4d93-9a5e-ab7911362870)

  - Tunnel token is like password [same value you entered in kharej server. For example : azumi].
  - Tunnel port can be any port [same value you entered in kharej server, for example : 443].
  - Enter your dashboard username, password and desired port. [for example : https://yourdomain.com:700]
  - Kharej V2ray port is your original v2ray port [e.g. 8080].
  - Iran V2ray port will be your new v2ray port [for example 8081,443 etc..].

![R (12)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/75d10b0e-6f41-4172-82a0-fda086593b6e) **Additional info :**

- For loadbalancing multiple ports, it uses random method. it means if you have different ports, it may connect to one port at a time. that is why i prefer multiple IPV6 on a single port. [You can try different method and different ports.]
- Don't use capital word when entering your inputs.

- -----------------------------------------------------------------------------------------------

![R (3)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/f4cdc26b-ecba-4590-a852-25cf8d89a833) **Helpful Scripts**

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

```
here
```

----------------------------------------------------------------------
![R (7)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/c159b96c-2b1d-460e-9c11-fd44660b5630) **Telegram channel :**
![R (6)](https://github.com/Azumi67/FRP-Wireguard/assets/119934376/b9c77229-d9b2-42e3-910c-a0a2ea820c92) [OPIRAN](https://github.com/opiran-club)

----------------------------------------------
![R23 (1)](https://github.com/Azumi67/FRP-Wireguard/assets/119934376/31baa226-5045-4489-90d2-1a066a91e880)
![circle-clipart-chain-link-9](https://github.com/Azumi67/FRP-Wireguard/assets/119934376/348d93a7-b12b-414a-908d-664ea38f4cdf)[FRP-Source](https://github.com/fatedier/frp)
![circle-clipart-chain-link-9](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/dd1aaa6c-518a-4389-bed4-25b40854fe25)[VPS-optimize & Extra IP](https://github.com/opiran-club)


------------------------------------------------------------------------------------------------------------
![youtube-131994968075841675](https://github.com/Azumi67/FRP-Wireguard/assets/119934376/dcde492b-ba44-4837-bb50-bbe4b3ac843a) **Video Guide :**  Soon



-----------------------------------------------------------------------------------------------------------------------------------

**تانل TCP با لود بالانس**




