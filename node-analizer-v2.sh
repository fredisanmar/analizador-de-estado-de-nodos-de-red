
#!/bin/bash
apt-get install prips -y> /dev/null
read -p '¿qué red quieres analizar?: ' network
prips $network>/tmp/ip-range.txt


##############################################################################


node_status()
{
        if ping -c 1 $1 &> /dev/null
        then
                sleep 3
                echo -e  "$host \e[1;32m[Up]\e[1;37m"
                nslookup $host
        else
                echo -e "$host \e[0;31m[Down]\e[1;37m"
        fi
}

##############################################################################

for host in $(cat /tmp/ip-range.txt)
do
node_status $host & disown
sleep 0.2
done
sleep 3.5

