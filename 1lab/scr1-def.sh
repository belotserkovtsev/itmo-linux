# Скрипт который при запуске смотрит на директорию.
# Если директория сущ - бэкап. Если удалена, то восстан
# по бэкапу

#!/bin/sh
if [[ $(ls | grep -c target) -eq 1 ]]; then
  \cp -r target/ backup/
elif [[ $(ls | grep -c target) -eq 0 ]]; then
  mkdir target
  cp -r backup/* target/
fi
