# coding: utf-8
from sqlalchemy import Column, Date, Integer, Text, Time
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()
metadata = Base.metadata


class Constructor(Base):
    __tablename__ = 'Constructor'

    constructorId = Column(Integer, primary_key=True)
    constructorRef = Column(Text(200))
    name = Column(Text(200))
    nationality = Column(Text(200))
    url = Column(Text(2000))


class ConstructorResult(Base):
    __tablename__ = 'ConstructorResults'

    constructorResultsId = Column(Integer, primary_key=True)
    raceId = Column(Integer, nullable=False)
    constructorId = Column(Integer, nullable=False)
    points = Column(Integer, nullable=False)
    status = Column(Text(50), nullable=False)


class ConstructorStanding(Base):
    __tablename__ = 'ConstructorStandings'

    constructorStandingsId = Column(Integer, primary_key=True)
    constructorId = Column(Integer, nullable=False)
    raceID = Column(Integer, nullable=False)
    points = Column(Integer, nullable=False)
    position = Column(Integer, nullable=False)
    positionText = Column(Text(200), nullable=False)
    wins = Column(Integer, nullable=False)


class Race(Base):
    __tablename__ = 'Race'

    raceID = Column(Integer, primary_key=True)
    year = Column(Integer, nullable=False)
    round = Column(Integer, nullable=False)
    circuitId = Column(Integer, nullable=False)
    name = Column(Text(200), nullable=False)
    date = Column(Date, nullable=False)
    time = Column(Time, nullable=False)
    url = Column(Text(2000), nullable=False)
