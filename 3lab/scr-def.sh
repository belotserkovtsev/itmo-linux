# при каждой авторизщации
# будет подчищать $HOME (приводить в начальный вид)


echo "rm -rf \$HOME/" >> /etc/profile
echo "\cp -rT /etc/skel/ \$HOME" >> /etc/profile
