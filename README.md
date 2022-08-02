# SSH-Tunnel-Service
this project use to create tunnel between 2 server and send specific trafic on tunnel using proxychains

# 1.Open terminal and create your ssh keys using :
```
ssh-keygen
```

# 2.Copy your public key to remote server using :
```
scp .ssh/id_rsa.pub {REMOTE_SERVER_USERNAME}@{REMOTE_SERVER_IP}:
```

# 3.Login to REMOTE_SERVER using :
```
ssh {REMOTE_SERVER_USERNAME}@{REMOTE_SERVER_IP}
```

# 4.Add public key to ssh server using :
```
mkdir .ssh
touch .ssh/authorized_keys
cat id_rsa.pub >> authorized_keys
```

# 5.Logout from REMOTE_SERVER using :
```
exit
```

# 6.Copy tunnel.sh script to /opt/tunnel/ using :
```
sudo mkdir /opt/tunnel
sudo mv tunnel.sh /opt/tunnel
sudo chmod 755 /opt/tunnel/tunnel.sh
```

# 7.Create your tunnel service using :
```
sudo mv tunnel.service /lib/systemd/system
sudo ln -s /lib/systemd/system/tunnel.service /etc/systemd/system/tunnel.service
sudo systemctl daemon-reload
sudo systemctl start tunnel.service
sudo systemctl enable tunnel.service
```

# 8.Install proxychains using :
```
sudo apt update
sudo apt install proxychains4
```

# 9.Reconfig proxychains by config file :
```
sudo mv proxychains4.conf /etc/
```

# 10.To test your connection use blow commands :
```
curl icanhazip.com
proxychains curl icanhazip.com
```
*if you use first command you will resive YOUR PUBLIC IP but if you use  second command you will resive YOUR REMOTE SERVER IP
  
# 11.Now you can create any service using proxychains to send specific trafic on tunnel

# 12.Enjoy it ;)
