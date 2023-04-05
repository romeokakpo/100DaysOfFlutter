DROP TABLE lists;
DROP TABLE tasks;

CREATE TABLE lists(
  list_id INTEGER NOT NULL PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  l_date DATE NOT NULL,
  color BIGINT NOT NULL,
  status VARCHAR(30) DEFAULT 'PENDING'
);


CREATE TABLE tasks(
  task_id INTEGER NOT NULL PRIMARY KEY,
  list_id INTEGER,
  title VARCHAR(150) NOT NULL,
  status VARCHAR(30) DEFAULT 'DONE',
  FOREIGN KEY (list_id)
    REFERENCES lists (list_id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION
);

INSERT INTO lists (title, l_date,color,status)
VALUES ('Faire le ménage','2023-04-04',123456789,'PENDING');


INSERT INTO lists (title, l_date,color,status)
VALUES ('Apprendre Dart','2023-04-04',123456789,'PENDING');


INSERT INTO lists (title, l_date,color,status)
VALUES ('Faire des exercices','2023-04-04',123456789,'PENDING');


INSERT INTO lists (title, l_date,color,status)
VALUES ('Apprendre GetX','2023-04-03',123456789,'DONE');


INSERT INTO lists (title, l_date,color,status)
VALUES ('Faire le ravitillement','2023-04-02',123456789,'ARCHIVED');

--Insertions des tâches 

INSERT INTO tasks (list_id, title,status)
VALUES (1,'Ranger la table','PENDING');

INSERT INTO tasks (list_id, title,status)
VALUES (1,'Repasser les habits','PENDING');

INSERT INTO tasks (list_id, title,status)
VALUES (1,'Mettre de côté les habits sales','PENDING');

INSERT INTO tasks (list_id, title,status)
VALUES (2,'Les variables','PENDING');

INSERT INTO tasks (list_id, title,status)
VALUES (2,'Les instructions de contrôles','PENDING');

-- Affichage des tâches

SELECT * from lists;

SELECT * from tasks
WHERE list_id = 1;

