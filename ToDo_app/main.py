from datetime import datetime
from typing import List
from fastapi import FastAPI, HTTPException, Depends
from pydantic import BaseModel
from sqlalchemy.orm import Session
from database import SessionLocal, engine, Base
from models import TodoItem as TodoItemModel
from models import ItemNotification as ItemNotificationModel

Base.metadata.create_all(bind=engine)

app = FastAPI()

class TodoCreate(BaseModel):
    title: str
    description: str | None = None
    completed: bool = False

class TodoItem(TodoCreate):
    class Config:
        orm_mode = True

class ItemNotificationCreate(BaseModel):
    notion_description: str | None = None
    expiration_time: datetime = datetime.now()
    autocomplete: bool = False

class ItemNotification(ItemNotificationCreate):
    todo_item_id: int

    class Config:
        orm_mode = True

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/items/{item_id}/notifications", response_model=list[ItemNotification] | ItemNotification)
def get_notifications(item_id: int, db: Session = Depends(get_db)):
    notifications = db.query(ItemNotificationModel).filter(ItemNotificationModel.todo_item_id == item_id)
    if (notifications.count()):
        return notifications.all()
    else:
        raise HTTPException(status_code=404, detail="Item not found")

@app.get("/items/{item_id}/notifications/{notification_id}", response_model=ItemNotification)
def get_notification(item_id: int, notification_id: int, db: Session = Depends(get_db)):
    notifications = db.query(ItemNotificationModel).filter(ItemNotificationModel.todo_item_id == item_id)
    print(notifications.count())
    if (notifications.count()):
        notification = notifications.filter(ItemNotificationModel.id == notification_id).first()
    else:
        raise HTTPException(status_code=404, detail="Item not found")
    if not notification:
        raise HTTPException(status_code=404, detail="Notification not found")
    return notification

@app.post("/items/{item_id}/notifications", response_model=ItemNotification)
def create_notification(item_id: int, notion: ItemNotificationCreate, db: Session = Depends(get_db)):
    if (db.query(TodoItemModel).filter(TodoItemModel.id == item_id).first()):
        print("smth")
        new_notion = ItemNotificationModel(
            todo_item_id=item_id,
            notion_description=notion.notion_description,
            expiration_time=notion.expiration_time,
            autocomplete=notion.autocomplete
        )
        db.add(new_notion)
        db.commit()
        db.refresh(new_notion)
    else:
        raise HTTPException(status_code=404, detail="Item not dound")
    return new_notion

@app.delete("/items/{item_id}/notifications")
def delete_notifications(item_id: int, db: Session = Depends(get_db)):
    if (db.query(TodoItemModel).filter(TodoItemModel.id == item_id).first()):
        db.query(ItemNotificationModel).filter(ItemNotificationModel.todo_item_id == item_id).delete()
        db.commit()
        return {"message": "Notification deleted"}
    else:
        raise HTTPException(status_code=404, detail="Item not found")

@app.delete("/items/{item_id}/notifications/{notification_id}")
def delete_notification(item_id: int, notification_id: int, db: Session = Depends(get_db)):
    if (db.query(TodoItemModel).filter(TodoItemModel.id == item_id).first()):
        notification = db.query(ItemNotificationModel).filter(ItemNotificationModel.id == notification_id)
        if (notification.count()):
            notification.delete()
        db.commit()
        return {"message": "Notification deleted"}
    else:
        raise HTTPException(status_code=404, detail="Item not found")


@app.get("/items", response_model=List[TodoItem])
def get_items(db: Session = Depends(get_db)):
    items = db.query(TodoItemModel).all()
    return items

@app.get("/items/{item_id}", response_model=TodoItem)
def get_item(item_id: int, db: Session = Depends(get_db)):
    item = db.query(TodoItemModel).filter(TodoItemModel.id == item_id).first()
    if not item:
        raise HTTPException(status_code=404, detail="Item not found")
    return item

@app.post("/items", response_model=TodoItem)
def create_item(item: TodoCreate, db: Session = Depends(get_db)):
    new_item = TodoItemModel(
        title=item.title,
        description=item.description,
        completed=item.completed
    )
    db.add(new_item)
    db.commit()
    db.refresh(new_item)
    return new_item

@app.put("/items/{item_id}", response_model=TodoItem)
def update_item(item_id: int, item: TodoCreate, db: Session = Depends(get_db)):
    db_item = db.query(TodoItemModel).filter(TodoItemModel.id == item_id).first()
    if not db_item:
        raise HTTPException(status_code=404, detail="Item not found")
    db_item.title = item.title
    db_item.description = item.description
    db_item.completed = item.completed
    db.commit()
    db.refresh(db_item)
    return db_item

@app.delete("/items/{item_id}")
def delete_item(item_id: int, db: Session = Depends(get_db)):
    db_item = db.query(TodoItemModel).filter(TodoItemModel.id == item_id).first()
    if not db_item:
        raise HTTPException(status_code=404, detail="Item not found")
    db.delete(db_item)
    db.commit()
    return {"message": "Item deleted"}

