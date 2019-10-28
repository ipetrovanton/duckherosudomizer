#!/usr/bin/env bash

function addduck
{
echo $1
    duckId=$1
    sed 's!</table>!<duck'$1'>  \
  <name></name> \
  <surname></surname> \
  <year></year> \
  <price></price> \
 </duck'$1'> \
 </table>!' utki.xml > 1.xml
 cat 1.xml > utki.xml
 rm 1.xml
}

function delduck
{
echo $1
xml ed -d "xml/table/duck$1" utki.xml | tee 1.xml
cat 1.xml > utki.xml
rm 1.xml
}

function set {
echo $1 $2 $3
xml ed -u "xml/table/duck$1/$2" -v $3 utki.xml | tee 1.xml
cat 1.xml > utki.xml
rm 1.xml
}

function showall {
xml el -v utki.xml | tee 1.txt
cat 1.txt | grep duck > 2.txt
cat 2.txt | sed s/[^0-9]//g | uniq | tee 3.txt
mapfile -t myArr < 3.txt
rm -f *.txt

for i in ${myArr[@]}; do
  echo $i
  show $i
  echo
done

}
function show {
echo DUCK with id $1:
xml sel -t -o " name: " -v "xml/table/duck$1/name" -n -o " surname: " -v "xml/table/duck$1/surname" \
 -n -o " city: " -v "xml/table/duck$1/city" -n -o " year: " -v "xml/table/duck$1/year" -n -o " price: " -v "xml/table/duck$1/price"  utki.xml

}

echo Hello, $USER!
echo '<?xml version="1.0" encoding="utf-8"?>
<xml>
<table>
 <duck1>
  <city>city</city>
  <name>Donald</name>
  <surname>Duck1</surname>
  <year>1927</year>
  <price>Infinity</price>
 </duck1>
 <duck2>
  <city></city>
  <name></name>
  <surname></surname>
  <year></year>
  <price></price>
 </duck2>
 <duck3>
  <city></city>
  <name></name>
  <surname></surname>
  <year></year>
  <price></price>
 </duck3>
 <duck4>
  <city></city>
  <name></name>
  <surname></surname>
  <year></year>
  <price></price>
 </duck4>
 <duck5>
  <city></city>
  <name></name>
  <surname></surname>
  <year></year>
  <price></price>
 </duck5>
</table>
</xml>'>utki.xml
cat utki.xml
echo
echo Enter for action!
    echo "  all                                          show info about all ducks"
    echo "  show <id>                                        show info about 1 dug by id"
    echo "  add <id>                                     add new dug"
    echo "  del <id>                                         delete by id "
    echo "  set <id> <field> <value>                         modify by id and field"

while [ 1 ]; do
    read action
    if [[ "$action" == *"all"* ]]; then
    showall
    elif [[ "$action" == *"show"* ]]; then
    a=`echo $action | awk '{print $2}'`
    show $a
    elif [[ "$action" == *"del"* ]]; then
    a=`echo $action | awk '{print $2}'`
    delduck $a
    elif [[ "$action" == *"add"* ]]; then
    a=`echo $action | awk '{print $2}'`
    addduck $a
    elif [[ "$action" == *"set"* ]]; then
    a=`echo $action | awk '{print $2}'`
    b=`echo $action | awk '{print $3}'`
    c=`echo $action | awk '{print $4}'`
    set $a $b $c
    fi

done


#delduck 3
#set 2 name utka
#show 1
#showall
#addduck 9