#!/bin/sh
mkdir $HOME/test
cd $HOME/test
ls -la /etc > list
ls -la /etc | egrep -c ^d >> list
ls -a /etc | egrep -c "^\." >> list
mkdir links
cd links
ln ../list list_hlink
ln -s ../list list_slink
#7
ls -l list_hlink | egrep -o  "[0-9]+" | head -1
ls -l list_slink | egrep -o  "[0-9]+" | head -1
ls -l ../list | egrep -o  "[0-9]+" | head -1
# 8
wc -l list_slink >> list_hlink
# 9
if [[ $(diff list_slink list_hlink | wc -l) -eq 0 ]]; then
  echo "YES"
fi
# 10
mv ../list ../list1
# 11
if [[ $(diff list_slink list_hlink | wc -l) -eq 0 ]]; then
  echo "YES"
fi
# 12
ln list_hlink $HOME/list1
# 13
ls -R /etc | egrep ".*\.conf$" >> $HOME/list_conf
# 14
ls -R /etc | egrep ".*\.d$" >> $HOME/list_d
# 15
cat $HOME/list_conf > $HOME/list_conf_d &&
cat $HOME/list_d >> $HOME/list_conf_d
# 16
mkdir $HOME/test/.sub
# 17
cp $HOME/list_conf_d $HOME/test/.sub
# 18
cp -b $HOME/list_conf_d $HOME/test/.sub
# 19
ls -Ra $HOME/test
# 20
man --help > $HOME/man.txt
# 21
split -b 1K $HOME/man.txt $HOME/man.txt.
# 22
mkdir $HOME/man.dir
# 23
cp $HOME/man.txt.* $HOME/man.dir
# 24
cd $HOME/man.dir
cat man.txt.?? > man.txt
# 25
if [[ $(diff man.txt ../man.txt | wc -l) -eq 0 ]]; then
  echo "YES"
fi
# 26
sed -i '1s/^/random text\n/' man.txt
echo random text >> man.txt
# 27
diff -u man.txt ../man.txt > diffmanpatch
# 28
cp diffmanpatch $HOME/man.dir
# 29
cd $HOME/man.dir
patch man.txt < diffmanpatch
# 30
if [[ $(diff man.txt man.dir/man.txt | wc -l) -eq 0 ]]; then
  echo "YES"
fi
