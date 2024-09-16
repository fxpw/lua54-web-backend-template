FROM nickblah/lua:5.4-luarocks

# Установка необходимых библиотек
RUN apt-get update && apt-get install -y build-essential
RUN apt-get update && apt-get install -y \
    gcc \
    make \
    libssl-dev \
    libreadline-dev \
    && rm -rf /var/lib/apt/lists/*

RUN luarocks install luasocket
RUN luarocks install lua-cjson
RUN luarocks install luaossl
RUN luarocks install pgmoon

# Копируем файлы приложения
COPY main.lua /app/main.lua

# Устанавливаем рабочую директорию
WORKDIR /app

# Запуск приложения
CMD ["lua", "main.lua"]
