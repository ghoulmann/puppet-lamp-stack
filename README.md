# LAMP Stack Environment for MyIEP and Mobile Web Development

## Shout outs!

Credit must be given where credit is due. Most of this work was made possible by:

* [PerishableDave/puppet-lamp-stack](https://github.com/PerishableDave/puppet-lamp-stack).

* [jas0nkim/my-vagrant-puppet-lamp](https://github.com/jas0nkim/my-vagrant-puppet-lamp).

## Prerequisites

* [Vagrant](http://www.vagrantup.com/)

* [Virtual Box](https://www.virtualbox.org/)

## Instructions

1. Ensure Vagrant and VirutalBox are installed.

2. Install precise32 Vagrant box. (If not installed already)

    ($ stands for your user prompt throughout this document)

	$ vagrant box add precise32 http://files.vagrantup.com/precise32.box

3. Go to the folder where you want your development environment. For example, /Documents.

4. $ cd ~/Documents (in my example)

5. $ git clone https://github.com/ghoulmann/puppet-lamp-stack.git mobile-web

4. The directory "webroot" in the root directory of the clone (/Documents/mobile-web) will act as your root web folder.

5. Open up terminal, change directory to this git repo root, and start the vagrant box.

	$ cd /Documents/mobile-web/

	$ vagrant up

6. You're all set up. The webserver will now be accessible from [http://localhost:8888](http://localhost:8888)

7. Clone the mobile web or MyIEP repo inside this repository **inside the webroot** folder.

	$ git clone https://github.com/ChelseaSchool/MyIEP.git

or

	$ git clone https://github.com/ChelseaSchool/Chelsea_Mobile.git


## Included in the Stack

* apache2 - rewrite mode enabled, having virtual host with config - refer manifest/vagrant_webroot.sample
* php5
* php5-cli
* php5-mysql
* php-pear - installed packages: phpunit and its dependencies
* php5-dev
* php5-gd
* php5-mcrypt
* libapache2-mod-php5
* mysql-server
* curl
* vim
* htop
* phpmyadmin

### Navigate to the Mobile Web

1. Launch a browser

2. navigate to http://localhost:8888/Chelsea_Mobile
