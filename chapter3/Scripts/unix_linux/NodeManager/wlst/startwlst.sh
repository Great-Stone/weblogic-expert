WL_HOME=/app/wls/wls1212/wlserver
DOMAIN_HOME=/app/wls/wls1212/domains/v1212domain

if [ "$1" = "" ] ; then
    echo "Script Error"
    echo "ex) ./startwlst.sh [py_file]"
    exit
fi

$WL_HOME/common/bin/wlst.sh -loadProperties $DOMAIN_HOME/wlst/env.properties $DOMAIN_HOME/wlst/$1