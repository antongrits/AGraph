USE MASTER
GO
DROP DATABASE IF EXISTS AGraph
GO
CREATE DATABASE AGraph
GO
USE AGraph
GO
-- Создание таблицы персонажей (Character)
CREATE TABLE Character (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Level INT,
    Class VARCHAR(50)
) AS NODE;

-- Создание таблицы гильдий (Guild)
CREATE TABLE Guild (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
	Description VARCHAR(250)
) AS NODE;

-- Создание таблицы событий (Event)
CREATE TABLE Event (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Date DATE,
    Description TEXT
) AS NODE;

-- Заполнение таблицы Character данными
INSERT INTO Character (ID, Name, Level, Class) VALUES
(1, 'Геральт', 50, 'Ведьмак'),
(2, 'Элли', 30, 'Маг'),
(3, 'Артас', 40, 'Паладин'),
(4, 'Леона', 35, 'Лучник'),
(5, 'Иллидан', 45, 'Демонхантер'),
(6, 'Сара', 25, 'Волшебница'),
(7, 'Тирион', 38, 'Рыцарь'),
(8, 'Сильвана', 42, 'Ловкачка'),
(9, 'Йеннифер', 55, 'Маг'),
(10, 'Артемис', 48, 'Охотник');

-- Заполнение таблицы Guild данными
INSERT INTO Guild (ID, Name, Description) VALUES
(1, 'Орден Святого Гриаля', 'Мощная гильдия воинов и паладинов'),
(2, 'Тень Луны', 'Гильдия магов, специализирующихся на темных искусствах'),
(3, 'Стражи Леса', 'Гильдия лесных стражей и лучников'),
(4, 'Пламя Испепеляющее', 'Гильдия охотников на демонов'),
(5, 'Академия Волшебства', 'Гильдия магов-учеников'),
(6, 'Клинок Тени', 'Гильдия убийц и шпионов'),
(7, 'Свободные Плавники', 'Гильдия пиратов и морских разбойников'),
(8, 'Хранители Света', 'Гильдия священников и целителей'),
(9, 'Коллегия Алхимиков', 'Гильдия зельеваров и алхимиков'),
(10, 'Орден Стражей Портала', 'Гильдия путешественников и исследователей');

-- Заполнение таблицы Event данными
INSERT INTO Event (ID, Name, Date, Description) VALUES
(1, 'Осада Темного Замка', '2024-05-20', 'Битва с могущественным демоном в его темной крепости'),
(2, 'Турнир Чемпионов', '2024-06-10', 'Соревнование между лучшими воинами и магами'),
(3, 'Исследование Забытых Руин', '2024-07-02', 'Экспедиция в древние руины в поисках сокровищ'),
(4, 'Праздник Летнего Солнцестояния', '2024-08-15', 'Ежегодный праздник соревнований и гуляний'),
(5, 'Сражение за Эльфийский Лес', '2024-09-05', 'Защита леса от вторжения темных сил'),
(6, 'Торговая ярмарка', '2024-10-20', 'Ярмарка для торговли и обмена редкими предметами'),
(7, 'Поход в Горы Хаоса', '2024-11-08', 'Опасное приключение в горах, полных монстров'),
(8, 'Тайные Заклинания', '2024-12-01', 'Мероприятие для изучения новых магических заклинаний'),
(9, 'Сражение за Ледяную Крепость', '2025-01-15', 'Эпическая битва с ледяными чудовищами и владыками холода'),
(10, 'Фестиваль Колоссов', '2025-02-28', 'Праздник в честь гигантских созданий и древних титанов');


CREATE TABLE Including AS EDGE;

CREATE TABLE Participating AS EDGE;

CREATE TABLE Friending AS EDGE;


	INSERT INTO Friending ($from_id, $to_id)
VALUES ((SELECT $node_id FROM [Character] WHERE id = 1),
 (SELECT $node_id FROM [Character] WHERE id = 2)),
 ((SELECT $node_id FROM [Character] WHERE id = 10),
 (SELECT $node_id FROM [Character] WHERE id = 5)),
 ((SELECT $node_id FROM [Character] WHERE id = 2),
 (SELECT $node_id FROM [Character] WHERE id = 9)),
 ((SELECT $node_id FROM [Character] WHERE id = 3),
 (SELECT $node_id FROM [Character] WHERE id = 1)),
 ((SELECT $node_id FROM [Character] WHERE id = 3),
 (SELECT $node_id FROM [Character] WHERE id = 6)),
 ((SELECT $node_id FROM [Character] WHERE id = 4),
 (SELECT $node_id FROM [Character] WHERE id = 2)),
 ((SELECT $node_id FROM [Character] WHERE id = 5),
 (SELECT $node_id FROM [Character] WHERE id = 4)),
 ((SELECT $node_id FROM [Character] WHERE id = 6),
 (SELECT $node_id FROM [Character] WHERE id = 7)),
 ((SELECT $node_id FROM [Character] WHERE id = 6),
 (SELECT $node_id FROM [Character] WHERE id = 8)),
 ((SELECT $node_id FROM [Character] WHERE id = 8),
 (SELECT $node_id FROM [Character] WHERE id = 3));

INSERT INTO Including ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Guild WHERE ID = 1),
 (SELECT $node_id FROM [Character] WHERE ID = 1)),
 ((SELECT $node_id FROM Guild WHERE ID = 5),
 (SELECT $node_id FROM [Character] WHERE ID = 1)),
 ((SELECT $node_id FROM Guild WHERE ID = 8),
 (SELECT $node_id FROM [Character] WHERE ID = 1)),
 ((SELECT $node_id FROM Guild WHERE ID = 2),
 (SELECT $node_id FROM [Character] WHERE ID = 2)),
 ((SELECT $node_id FROM Guild WHERE ID = 3),
 (SELECT $node_id FROM [Character] WHERE ID = 3)),
 ((SELECT $node_id FROM Guild WHERE ID = 4),
 (SELECT $node_id FROM [Character] WHERE ID = 3)),
 ((SELECT $node_id FROM Guild WHERE ID = 6),
 (SELECT $node_id FROM [Character] WHERE ID = 4)),
 ((SELECT $node_id FROM Guild WHERE ID = 7),
 (SELECT $node_id FROM [Character] WHERE ID = 4)),
 ((SELECT $node_id FROM Guild WHERE ID = 1),
 (SELECT $node_id FROM [Character] WHERE ID = 9)),
 ((SELECT $node_id FROM Guild WHERE ID = 9),
 (SELECT $node_id FROM [Character] WHERE ID = 4)),
 ((SELECT $node_id FROM Guild WHERE ID = 10),
 (SELECT $node_id FROM [Character] WHERE ID = 9));

INSERT INTO Participating ($from_id, $to_id)
VALUES ((SELECT $node_id FROM [Character] WHERE ID = 1),
 (SELECT $node_id FROM Event WHERE ID = 6)),
 ((SELECT $node_id FROM [Character] WHERE ID = 5),
 (SELECT $node_id FROM Event WHERE ID = 1)),
 ((SELECT $node_id FROM [Character] WHERE ID = 8),
 (SELECT $node_id FROM Event WHERE ID = 7)),
 ((SELECT $node_id FROM [Character] WHERE ID = 2),
 (SELECT $node_id FROM Event WHERE ID = 2)),
 ((SELECT $node_id FROM [Character] WHERE ID = 3),
 (SELECT $node_id FROM Event WHERE ID = 5)),
 ((SELECT $node_id FROM [Character] WHERE ID = 4),
 (SELECT $node_id FROM Event WHERE ID = 3)),
 ((SELECT $node_id FROM [Character] WHERE ID = 6),
 (SELECT $node_id FROM Event WHERE ID = 4)),
 ((SELECT $node_id FROM [Character] WHERE ID = 7),
 (SELECT $node_id FROM Event WHERE ID = 2)),
 ((SELECT $node_id FROM [Character] WHERE ID = 1),
 (SELECT $node_id FROM Event WHERE ID = 9)),
 ((SELECT $node_id FROM [Character] WHERE ID = 9),
 (SELECT $node_id FROM Event WHERE ID = 8)),
 ((SELECT $node_id FROM [Character] WHERE ID = 10),
 (SELECT $node_id FROM Event WHERE ID = 9));

SELECT C1.name, C2.name
FROM [Character] AS C1
	, Friending AS F
	, [Character] AS C2
WHERE MATCH(C1-(F)->C2)
	AND C1.name = 'Сара';

SELECT C.name, e.name
FROM [Character] AS C
	, Participating AS p
	, [Event] as e
WHERE MATCH(C-(p)->e)
AND C.name = 'Геральт';

SELECT C.name, G.name
FROM [Character] AS C
	, Including AS I
	, Guild as G
WHERE MATCH(G-(I)->C)
AND G.name = 'Орден Святого Гриаля';

SELECT C.name, e.name
FROM [Character] AS C
	, Participating AS p
	, [Event] as e
WHERE MATCH(C-(p)->e)
AND e.name = 'Сражение за Ледяную Крепость';

SELECT C.name, G.name
FROM [Character] AS C
	, Including AS I
	, Guild as G
WHERE MATCH(G-(I)->C)
AND C.name = 'Геральт';

SELECT C1.name
	, STRING_AGG(C2.name, '->') WITHIN GROUP (GRAPH PATH)
FROM [Character] AS C1
	, Friending FOR PATH AS F
	, [Character] FOR PATH AS C2
WHERE MATCH(SHORTEST_PATH(C1(-(F)->C2)+))
	AND C1.name = 'Артас';

SELECT C1.name
	, STRING_AGG(C2.name, '->') WITHIN GROUP (GRAPH PATH)
FROM [Character] AS C1
	, Friending FOR PATH AS F
	, [Character] FOR PATH AS C2
WHERE MATCH(SHORTEST_PATH(C1(-(F)->C2){1,3}))
	AND C1.name = 'Сара';

SELECT C1.ID AS IdFirst
	, C1.name AS First
	, CONCAT(N'character (', C1.id, ')') AS [First image name]
	, C2.ID AS IdSecond
	, C2.name AS Second
	, CONCAT(N'character (', C2.id, ')') AS [Second image name]
FROM [Character] AS C1
	, Friending AS F
	, [Character] AS C2
WHERE MATCH(C1-(F)->C2)

SELECT C.ID AS IdFirst
	, C.name AS First
	, CONCAT(N'character (', C.id, ')') AS [First image name]
	, G.ID AS IdSecond
	, G.name AS Second
	, CONCAT(N'guild (', G.id, ')') AS [Second image name]
FROM [Character] AS C
	, Including AS I
	, Guild as G
WHERE MATCH(G-(I)->C)

SELECT C.ID AS IdFirst
	, C.name AS First
	, CONCAT(N'character (', C.id, ')') AS [First image name]
	, e.ID AS IdSecond
	, e.name AS Second
	, CONCAT(N'event (', e.id, ')') AS [Second image name]
FROM [Character] AS C
	, Participating AS p
	, [Event] as e
WHERE MATCH(C-(p)->e)

select @@servername