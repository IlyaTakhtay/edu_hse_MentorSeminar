echo "Let's ping Pong server:"
read server

ping_result=$(ping -c 5 "$server" 2>&1)

if echo "$ping_result" | grep -q "100% packet loss"; then
  echo "Сервер '$server' недоступен."
else
  echo "Сервер '$server' доступен."
fi