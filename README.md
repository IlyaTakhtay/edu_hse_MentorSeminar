# Project: TODO App & ShortURL Service

This project includes two applications:

1. **TODO App**: A service for managing tasks with CRUD operations.
2. **ShortURL App**: A service for shortening URLs, redirection, and tracking statistics.

Both applications are built using FastAPI and store data in an SQLite database.

---

## 🚀 Getting Started

### Docker Setup

To run both applications with Docker, use the following commands.

#### TODO App

**API Endpoints:**
- `GET /items/{item_id}/notifications` – Get notifications for an item.
- `POST /items/{item_id}/notifications` – Create a notification for an item.
- `GET /items/{item_id}/notifications/{notification_id}` – Get a specific notification.
- `DELETE /items/{item_id}/notifications` – Delete all notifications for an item.
- `DELETE /items/{item_id}/notifications/{notification_id}` – Delete a specific notification.
- `GET /items` – Get all items.
- `POST /items` – Create a new item.
- `GET /items/{item_id}` – Get information about a specific item.
- `PUT /items/{item_id}` – Update an item.
- `DELETE /items/{item_id}` – Delete an item.
## Run with Docker:
docker run --name todo_app -p 8000:80 -v todo_data:/app/data i11usi0n/todo-service:latest

# ShortURL App
## API Endpoints:

- `POST /shorten` – Shorten a URL. (Optional parameter: `modifier`)
- `GET /{short_id}` – Redirect to the original URL from the shortened one.
- `GET /stats/{short_id}` – Get usage statistics for the shortened URL.

## Run with Docker:
docker run --name shorturl -p 8000:80 -v shorturl_data:/app/data i11usi0n/shorturl_app:latest

📑 Access to API Documentation
http://localhost:8000/docs
