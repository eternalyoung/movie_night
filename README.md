# Фильм на вечер

Программа, предлагающая фильмы к просмотру исходя из топа кинопоиска и выбранного пользователем режиссёра, написанная на `Ruby`

[Топ кинопоиска](https://www.kinopoisk.ru/lists/movies/top250/)

## Установка и запуск

Перед запуском программы необходимо выполнить установку необходимых программе гемов.

```
bundle install
```

Для запуска программы необходимо запустить файл `main.rb`.


```
bundle exec ruby main.rb
```

## How it works

Программа скачивает страницу топа фильмов в папку `data` и, с помощью гема `nokogiri`, извлекает из неё фильмы и информацию о них.

## Ошибки

Приложение может сломаться из-за того, что сайт может потребовать выполнить капчу. В таком случае нужно удалить файл с расширением `.xml` из папки `data` и повторить запуск программы через пару минут или скачать [страницу топа](https://www.kinopoisk.ru/lists/movies/top250/) вручную в папку `data`. Обратите внимание, что во втором случае название файла нужно поменять на `kinopoisk.xml`.
