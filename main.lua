local pgmoon = require("pgmoon") -- Используем библиотеку luapg для подключения к PostgreSQL
local socket = require("socket") -- Используем socket для сетевого взаимодействия
local cjson = require("cjson")   -- Используем библиотеку cjson для работы с JSON

local db_host = os.getenv("DB_CONTAINER_NAME")
local db_user = os.getenv("DB_USERNAME")
local db_password = os.getenv("DB_PASSWORD")
local db_name = os.getenv("DB_DATABASE")


local function connect_to_db()
	local pg = pgmoon.new({
		host = db_host,
		user = db_user,
		password = db_password,
		database = db_name,
		port = "5432"
	})
	assert(pg:connect())
	return pg
end

local function handle_request(req)
	local db = connect_to_db()
	local result = assert(db:query("SELECT 'Hello, PostgreSQL!' AS greeting"))
	local response = {}
	for _, row in ipairs(result) do
		table.insert(response, { greeting = row.greeting })
	end
	return cjson.encode(response)
end

local function main()
	local port = os.getenv("BACKEND_PORT")
	local server = assert(socket.bind("*", port))

	print("Server listening on port " .. port)

	while true do
		local client = server:accept()
		client:send("HTTP/1.1 200 OK\r\n")
		client:send("Content-Type: application/json\r\n")
		client:send("Access-Control-Allow-Origin: *\r\n")
		client:send("\r\n")
		client:send(handle_request())
		client:close()
	end
end

main()
