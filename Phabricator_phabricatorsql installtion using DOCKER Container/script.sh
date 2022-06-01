#/bin/bash
cd /var/www/html/phabricator/
./bin/phd start 
./bin/phd status
service apache2 status


