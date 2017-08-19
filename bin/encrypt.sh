#! /bin/sh

# Get the fully qualified path to the script
case $0 in
    /*)
        SCRIPT="$0"
        ;;
    *)
        PWD=`pwd`
        SCRIPT="$PWD/$0"
        ;;
esac
# Get the location of the script.
REALDIR=`dirname "$REALPATH"`
# Normalize the path
REALDIR=`cd "${REALDIR}"; pwd`
cd $REALDIR

# find where java is install base on the wrapper.conf
if [ -f ../conf/wrapper.conf ]
	then
		javacmd=`awk ' { FS = "="} /^wrapper.java.command/ { print $2 }' ../conf/wrapper.conf|tr -d "\n\r"`
	else
		echo Cannot find wrapper.conf
		exit 1
fi
if [ -z $javacmd ]
	then
		echo Cannot find where java is install in the wrapper.conf
		exit 1
fi

# Check if a password was pass has a parameter
if [ -z $1 ]
	then
		read -e -p "Enter the password: "  param
		makepause=true
	else
	param=$1
fi

#
# Encrypts the provided string using the IXIASOFT Utils crypto helper class.
#

$javacmd -classpath ../libs/ixiasoft-utils.jar:../libs/common/log4j-1.2.12.jar com.ixiasoft.utils.crypto.CryptoHelper "$param"

if [ -n "$makepause" ]
	then
		read -n1 -r -p "Press any key to continue..." key
		echo ""
fi
