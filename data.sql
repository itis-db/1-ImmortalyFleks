-- ВСТАВКА ДАННЫХ В ТАБЛИЦУ ACTIVITYTYPE
INSERT INTO activitytype
SELECT d.* FROM (VALUES 
	(1, 'Программа', 'program'),
   	(2, 'Подпрограмма', 'subprogram'),
	(3, 'Проект', 'project'),
	(4, 'Контракт', 'contract'),
	(5, 'КТ', 'point')
) AS d(id, name, sysname)
WHERE NOT EXISTS (
    SELECT 1 FROM activitytype AS t
    WHERE t.id = d.id
);

-- ВСТАВКА ДАННЫХ В ТАБЛИЦУ ACTIVITY
INSERT INTO activity 
VALUES (1, 1, 'code_dev1', 'activity1', 1, NULL),
	(2, 2, 'code_dev2', 'activity2', 1, 1),
	(3, 3, 'code_test1', 'activity3', 1, 2),
	(4, 4, 'code_test2', 'activity4', 1, 3),
	(5, 5, 'code_mgmt1', 'activity5', 1, 4)
ON CONFLICT DO NOTHING;

-- ВСТАВКА ДАННЫХ В ТАБЛИЦУ PROGRAM
INSERT INTO program 
VALUES (1, 123, 2000, 2001),
	(2, 234, 2000, 2001),
	(3, 345, 2000, 2001)
ON CONFLICT (id) DO NOTHING;

-- ВСТАВКА ДАННЫХ В ТАБЛИЦУ SUBPROGRAM
INSERT INTO subprogram 
VALUES (1, 1231),
	(2, 1232),
	(3, 1233)
ON CONFLICT (id) DO NOTHING;

-- ВСТАВКА ДАННЫХ В ТАБЛИЦУ AREA
INSERT INTO area 
VALUES (1, 'Zone 1'),
	(2, 'Zone 2'),
	(3, 'Zone 3')
ON CONFLICT (id) DO NOTHING;

-- ВСТАВКА ДАННЫХ В ТАБЛИЦУ PROJECT
INSERT INTO project
VALUES (1, 'Project 1'),
	(2, 'Project 2'),
	(3, 'Project 3')
ON CONFLICT (id) DO NOTHING;

-- ВСТАВКА ДАННЫХ В ТАБЛИЦУ CONTRACT
INSERT INTO contract 
VALUES (1, 1),
	(2, 2),
	(3, 3)
ON CONFLICT (id) DO NOTHING;

-- ВСТАВКА ДАННЫХ В ТАБЛИЦУ POINT
INSERT INTO point
VALUES (1, DATE '2000-12-11', DATE '2000-12-21'),
	(2, DATE '2000-12-12', DATE '2000-12-22'),
	(3, DATE '2000-12-13', DATE '2000-12-23')
ON CONFLICT (id) DO NOTHING;
