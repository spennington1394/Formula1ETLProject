﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
CREATE TABLE public."Constructor"
(
    "constructorId" integer,
    "constructorRef" character varying(200),
    name character varying(200),
    nationality character varying(200),
    url character varying(2000),
    PRIMARY KEY ("constructorId")
);


CREATE TABLE "ConstructorStandings" (
    "constructorStandingsId" int   NOT NULL,
    "constructorId" int   NOT NULL,
    "raceID" int   NOT NULL,
    "points" int   NOT NULL,
    "position" int   NOT NULL,
    "positionText" character varying(200)   NOT NULL,
    "wins" int   NOT NULL,
    CONSTRAINT "pk_ConstructorStandings" PRIMARY KEY (
        "constructorStandingsId"
     )
);

CREATE TABLE "ConstructorResults" (
    "constructorResultsId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "constructorId" int   NOT NULL,
    "points" int   NOT NULL,
    "status" character varying(50)   NOT NULL,
    CONSTRAINT "pk_ConstructorResults" PRIMARY KEY (
        "constructorResultsId"
     )
);

-- Table documentation comment 1 (try the PDF/RTF export)
-- Table documentation comment 2
CREATE TABLE "Race" (
    "raceID" int   NOT NULL,
    "year" int   NOT NULL,
    "round" int   NOT NULL,
    "circuitId" int   NOT NULL,
    "name" character varying(200)    NOT NULL,
    "date" Date   NOT NULL,
    "time" time   NOT NULL,
    "url" character varying(2000)   NOT NULL,
    CONSTRAINT "pk_Race" PRIMARY KEY (
        "raceID"
     )
);

ALTER TABLE "ConstructorStandings" ADD CONSTRAINT "fk_ConstructorStandings_constructorId" FOREIGN KEY("constructorId")
REFERENCES "Constructor" ("constructorId");

ALTER TABLE "ConstructorResults" ADD CONSTRAINT "fk_ConstructorResults_raceId" FOREIGN KEY("raceId")
REFERENCES "Race" ("raceID");

ALTER TABLE "ConstructorResults" ADD CONSTRAINT "fk_ConstructorResults_constructorId" FOREIGN KEY("constructorId")
REFERENCES "Constructor" ("constructorId");

CREATE INDEX "idx_Constructor_constructorRef"
ON "Constructor" ("constructorRef");
