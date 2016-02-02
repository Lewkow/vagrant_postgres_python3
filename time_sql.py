import os
import sys
import time
from sqlalchemy import Column, ForeignKey, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

sleep_time = 10

Base = declarative_base()

class Current_Time(Base):
  __tablename__ = 'current'
  id = Column(Integer, primary_key=True)
  time = Column(Integer)

db_name = "time"

engine = create_engine("postgresql://postgres:postgres@127.0.0.1:5432/"+db_name)

Base.metadata.create_all(engine)

Session = sessionmaker(bind=engine)
session = Session()

while True:
  now = Current_Time(time=time.time())
  session.add(now)
  session.commit()
  time.sleep(sleep_time)
