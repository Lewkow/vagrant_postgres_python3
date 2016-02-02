#!/bin/bash

sudo yum -y update

# install postgres
sudo yum -y install postgresql-server postgresql-contrib 
sudo yum -y install vim wget gcc
sudo yum install python-devel
sudo yum install postgresql-devel
sudo yum install postgresql-libs

# create new database cluster
sudo postgresql-setup initdb

# copy the config which makes passwords required for the db
# sudo cp /vagrant/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf
# sudo chown postgres:postgres /var/lib/pgsql/data/pg_hba.conf
# sudo chmod 600 /var/lib/pgsql/data/pg_hba.conf

# start postgres
sudo systemctl start postgresql
sudo systemctl enable postgresql

# setup python3
cd ~/
wget -q https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz
tar -zxf Python-3.4.3.tgz
mkdir ~/Python3
cd Python-3.4.3
./configure -prefix="${HOME}"/Python3 > /dev/null
make install > /dev/null
cd ~/Python3
./bin/pyvenv ./virtualenv
echo 'source ~/Python3/virtualenv/bin/activate' >> ~/.bashrc
source ~/.bashrc
pip install --upgrade pip
pip install sqlalchemy
pip install psycopg2