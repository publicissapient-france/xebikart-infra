# XebiKart - Machine Learning - Vagrant configurations

This directory contains Vagrant file for ML envornment that can be easily configured and provisionned with a running configuration, independently on your host machine type (Win/Mac/Linux) and it's actual setup you don't want to disharm.

Ideally, you need to install Vagrant on your host machine from [HashiCorp donwload page](https://www.vagrantup.com/downloads.html) and you'll need to install some Virtual Machines environnement, e.g. [download and install VirtualBox](https://www.virtualbox.org/wiki/Downloads)



Then you need to customize your configuration:
```
cd ml-vagrant
nano Vagrant
```

and replace the following line by your username
```
MAC_USER = '<PUT_YOUR_USERNAME_HERE>'
```
e.g.:
```
MAC_USER = 'johndoe'
```
Verify also what VM's directory you want to share and synchronize with your machine's native directory, by default it's the
```
/home/<USERNAME_HERE>/xebikart-car-app"
```
change this if wanted. Press CTRL+X for exit and confirm with "Y".

Create the exchange directory (or similar)
```
mkdir ~/xebikart-car-app
```

Laucnh the VM instantiation:

```
vagrant up
```

Then, you can easily access your newly created VM via

```
vagrant ssh
```


To train you car, you can get all files from the raspberry directly (for the IP address of the car 2):
```
rsync -r pi@10.3.12.150:~/xebikart-car-app ~/
```

Still in the VM, create your model's directory and launch training
```
cd ~/xebikart-car-app
mkdir models
python manage.py train --tub=./tub --model=./models/my_first_model
```

Once trained, re-push your model to the raspberry pi
```
rsync -r pi@10.3.12.150:~/xebikart-car-app ~/
```

In another shell, go to the raspberry via ssh and launch the driving, (stop xebikart systemd service first if necessary) e.g. or similar (ensure you dont' have the joystick by default enabled in the config.py to be able to manage from RaspberryPi's webserver launched on 10.3.12.150:8887)
```
ssh pi@10.3.12.150
sudo systemctl stop xebikart-car-app 
cd xebikart-car-app
python manage.py drive --model=./models/my_first_model
```
In the webserver console choose in the "Mode & Pilot" the option "Local Pilot"

That's all!
