# Документация для Makefile

## Переменные
- `envPath` - путь к файлу окружения (`./.env`).
- `current_date` - текущее время в формате `YYYYMMDD_HHMMSS`.

## Команды

### Общие команды
- `make all` - выполняет действия, определенные в целях `build` и `start`.
- `make build` - строит Docker-образы.
- `make build_no_cache` - строит Docker-образы без использования кэша.
- `make run` - запускает контейнеры в фоновом режиме.
- `make up` - запускает контейнеры в фоновом режиме.
- `make stop` - останавливает и удаляет контейнеры.
- `make down` - останавливает и удаляет контейнеры.

### Удаление кеша
- `make ccache` - удаляет папки кэша Python и скомпилированные файлы.
  
### Установка зависимостей
- `make r` - устанавливает зависимости из файла `requirements.txt`.
- `make venv` - создает виртуальное окружение с использованием Python.

### Миграции
- `make m_add` - добавляет новую миграцию с описанием, заданным пользователем.
- `make m_migrate` - применяет миграции базы данных.
- `make m_rollback` - откатывает последнюю миграцию.

### Сидеры
- `make s_all` - выполняет все сидеры при помощи скрипта `run_seeders.py`.

## Примеры использования
```sh
make build         # постройте Docker-образы
make run           # запустите контейнеры
make m_migrate     # примените миграции
make s_all         # выполните все сидеры