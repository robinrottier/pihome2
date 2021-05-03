#!/bin/sh

mysql -uroot -ppassw0rd -e "SELECT CONCAT(QUOTE(user),'@',QUOTE(host)) UserAccount FROM mysql.user"
