#! /bin/sh
pushd `pwd`>/dev/null

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
ScriptDir=`dirname "$SCRIPT"`
# Normalize the path
ScriptDir=`cd "${ScriptDir}"; pwd`

function addexecbit {
  [ -e $1 ] && chmod +x $1 && echo Make $1 executable.
}

#Change to the root folder of the Output Generator
cd $ScriptDir/..
echo Base folder is `pwd`

# Make the changes to file in bin
addexecbit ./bin/encrypt.sh
addexecbit ./bin/outputgenerator.sh
addexecbit ./bin/wrapper-linux-x86-32
addexecbit ./bin/wrapper-linux-x86-64

#Make the changes in all DITA 1.x folders (./data/DITA-OT1*)
for i in $( find . -wholename ./data/DITA-OT1* -type d ); do
  addexecbit $i/startcmd.sh
  addexecbit $i/tools/ant/bin/ant
  addexecbit $i/tools/ant/bin/antRun
done

#Make the changes in all DITA 2.x folders (./data/dita-ot-2*)
for i in $( find . -wholename ./data/dita-ot-2* -type d ); do
  addexecbit $i/startcmd.sh
  addexecbit $i/bin/ant
  addexecbit $i/bin/dita
done

popd > /dev/null
