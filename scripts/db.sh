#!/bin/bash
# Usage: 
# db_set 123456 '{"name":"London","attractions":["Big Ben","London Eye"]}'
# db_set 42 '{"name":"San Francisco","attractions":["Golden Gate Bridge"]}'
# db_get 42
# It is append only, so old values won't be delete, but when we use db_get
# because we use tail -n 1,we will always get the new value.

db_set () {
	echo "$1,$2" >> database
}

db_get () {
	grep "^$1," database | sed -e "s/^$1,//" | tail -n 1
}
