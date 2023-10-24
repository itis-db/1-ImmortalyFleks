-- Удаление существующих таблиц (если они существуют)
DROP TABLE IF EXISTS point, contract, project, area, subprogram, program, activity, activitytype;

CREATE TABLE activitytype (
    id INT PRIMARY KEY,
    name VARCHAR NOT NULL,
    sysname VARCHAR NOT NULL
);

CREATE TABLE activity (
    id INT PRIMARY KEY,
    activitytype_id INT NOT NULL REFERENCES activitytype (id),
    code VARCHAR NOT NULL,
    name VARCHAR NOT NULL,
    activity_id INT NOT NULL,
    parent_id INT REFERENCES activity (id)
);

CREATE TABLE program (
    id INT PRIMARY KEY REFERENCES activity (id),
    indexnum INT,
    yearstart INT,
    yearfinish INT
);

CREATE TABLE subprogram (
    id INT PRIMARY KEY REFERENCES activity (id),
    indexnum INT
);

CREATE TABLE area (
    id INT PRIMARY KEY,
    name VARCHAR NOT NULL DEFAULT 'Unknown'
);

CREATE TABLE project (
    id INT PRIMARY KEY REFERENCES activity (id),
    targetdescr VARCHAR
);

CREATE TABLE contract (
    id INT PRIMARY KEY REFERENCES activity (id),
    area_id INT REFERENCES area (id)
);

CREATE TABLE point (
    id INT PRIMARY KEY REFERENCES activity (id),
    plandate DATE NOT NULL,
    factdate DATE
);
