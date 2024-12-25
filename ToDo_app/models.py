from sqlalchemy import Column, Integer, String, Boolean, DateTime, ForeignKey
from database import Base


class TodoItem(Base):
    __tablename__ = "todo_items"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    title = Column(String, index=True)
    description = Column(String, nullable=True)
    completed = Column(Boolean, default=False)


class ItemNotification(Base):
    __tablename__ = "item_notions"
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    todo_item_id = Column(Integer, ForeignKey("todo_items.id"), index=True)
    notion_description = Column(String, nullable=True)
    expiration_time = Column(DateTime)
    autocomplete = Column(Boolean, default=False)
