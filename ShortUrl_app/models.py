from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from database import Base

class URLItem(Base):
    __tablename__ = "short_urls"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    short_id = Column(String, unique=True, index=True)
    full_url = Column(String)

class URLStatistics(Base):
    __tablename__ = "url_statistics"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    url_item_id = Column(Integer, ForeignKey("short_urls.id"), nullable=False)
    user_agent = Column(String)
    user_ip = Column(String)
    
    # Связь с таблицей URLItem
    url_item = relationship("URLItem")
