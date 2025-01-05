# Используется сборочная линия для демо базы Otus на основе jenkins-lib
Ci на основе jenkins-lib от https://github.com/firstBitMarksistskaya/jenkins-lib 
Форк библиотеки: https://github.com/Kyrales/jenkins-lib ветка otus
Описание: https://infostart.ru/1c/articles/1681427/

# GitSync
Настроен на основе vanessa-usher https://github.com/silverbulleters/vanessa-usher.
Актуальный репозитарий для использования: https://github.com/Kyrales/vanessa-usher_mod . Ветка my_dev
Путь для подключения библиотеки с названием usher2: 
https://github.com/Kyrales/vanessa-usher_mod.git

Используемые файлы настроек:
Jenkinsfile_gitsync - основной jenkins файл для запуска функций пайплайна
/tools/gitsync.json - базовые настройки для работы с пайплайном
/tools/gitsync_conf.json - настройки хранилищ 1С (конфигурации и расширений) для работы в пакетном режиме 
