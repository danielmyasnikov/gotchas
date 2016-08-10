# Backup your SSH keys
# Fresh install Yosemite from Jago's network drive
# Get Jago to install Red Ant keychain and recovery key
# Get Jago to setup network user
# Turn on full disk encryption
System Preferences > Security & Privacy > FileVault > Turn On FileVault
# Install XCode from App Store
Open XCode
Accept license
Peferences > Downloads > Install Command Line Tools
# also run
xcode-select --install
# Copy your ssh key into ~/.ssh
# Clone red ant boxen
sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
git clone git@github.com:red-ant/our-boxen.git /opt/boxen/repo
# Add yourself as a remote
cd /opt/boxen/repo
git remote add mcauser git@github.com:mcauser/our-boxen.git
# create your dev folder
mkdir -p /Users/${USER}/src
# Install boxen
cd /opt/boxen/repo
./script/boxen
# enter your github username, password and OTP
# If you get an error about unable to use OAuth token
Log into github.com
Go to github.com/settings/tokens
Rename Boken token to something other than Boxen. eg. "Boxen iMac", "Boxen MacBook"
Run ./script/boxen again
# update rbenv
cd /opt/boxen/rbenv
git pull
# update ruby build
cd /opt/boxen/ruby-build
git pull
# manually install ruby version
rbenv install 2.1.3
# i manually installed git with brew
brew rm git
# i manually installed mysql with brew
brew rm mysql
# reload shell
source /opt/boxen/env.sh
# error installing mysql
FATAL ERROR: Could not find my-default.cnf
# fix by reinstalling
brew reinstall mysql
# the problem is with puppet-mysql 2.0.1
https://github.com/boxen/puppet-mysql/issues/57
rm puppetfile.lock
librarian-puppet install --clean
# install old ruby 1.8.7 fails - you need to install with gcc-4.8
# does not work
rbenv install 1.8.7-p374
# works
CC=/opt/boxen/homebrew/bin/gcc-4.8 rbenv install 1.8.7-p374
# or simply
CC=gcc-4.8 rbenv install 1.8.7-p374
# therubyracer and v8 issues
brew tap homebrew/versions
brew install v8-315

gem install libv8 -v '<check version in gemfile.lock>' -- --with-system-v8
gem install therubyracer -- --with-v8-dir=/usr/local/opt/v8-315

bundle install
