ShortURL: Сервис для сокращения длинных URL, перенаправления и статистики.
TODO App: Сервис для управления задачами с CRUD-операциями.
Оба приложения на FastAPI, данные хранятся в SQLite.

🛠️ Запуск с Docker:
# TODO App
Notifications API Endpoints:
  GET /items/{item_id}/notifications
    Получить уведомления для элемента.
  POST /items/{item_id}/notifications
    Создать уведомление для элемента.
  GET /items/{item_id}/notifications/{notification_id}
    Получить конкретное уведомление.
  DELETE /items/{item_id}/notifications
    Удалить все уведомления для элемента.
  DELETE /items/{item_id}/notifications/{notification_id}
    Удалить конкретное уведомление.
  GET /items
    Получить все элементы.
  POST /items
    Создать новый элемент.
  GET /items/{item_id}
    Получить информацию о конкретном элементе.
  PUT /items/{item_id}
    Обновить информацию об элементе.
  DELETE /items/{item_id}
    Удалить элемент.
Запуск
  docker run --name todo -p 8000:80 -v todo_data:/app/data i11usi0n/todo-service:latest
# ShortURL App
ShortURL API Endpoints:
  POST /shorten
    Сокращение URL.
    Параметр: modifier (optional).
  GET /{short_id}
    Перенаправление по сокращённому URL.
  GET /stats/{short_id}
    Статистика использования сокращённой ссылки.
Запуск
  docker run --name shorturl -p 8000:80 -v shorturl_data:/app/data i11usi0n/shorturl_app:latest

📑 Доступ к API:
TODO: http://localhost:8000/docs
ShortURL: http://localhost:8001/docs
