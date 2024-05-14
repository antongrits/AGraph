USE MASTER
GO
DROP DATABASE IF EXISTS AGraph
GO
CREATE DATABASE AGraph
GO
USE AGraph
GO
-- �������� ������� ���������� (Character)
CREATE TABLE Character (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Level INT,
    Class VARCHAR(50)
) AS NODE;

-- �������� ������� ������� (Guild)
CREATE TABLE Guild (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
	Description VARCHAR(250)
) AS NODE;

-- �������� ������� ������� (Event)
CREATE TABLE Event (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Date DATE,
    Description TEXT
) AS NODE;

-- ���������� ������� Character �������
INSERT INTO Character (ID, Name, Level, Class) VALUES
(1, '�������', 50, '�������'),
(2, '����', 30, '���'),
(3, '�����', 40, '�������'),
(4, '�����', 35, '������'),
(5, '�������', 45, '�����������'),
(6, '����', 25, '����������'),
(7, '������', 38, '������'),
(8, '��������', 42, '��������'),
(9, '��������', 55, '���'),
(10, '�������', 48, '�������');

-- ���������� ������� Guild �������
INSERT INTO Guild (ID, Name, Description) VALUES
(1, '����� ������� ������', '������ ������� ������ � ���������'),
(2, '���� ����', '������� �����, ������������������ �� ������ ����������'),
(3, '������ ����', '������� ������ ������� � ��������'),
(4, '����� ������������', '������� ��������� �� �������'),
(5, '�������� ����������', '������� �����-��������'),
(6, '������ ����', '������� ����� � �������'),
(7, '��������� ��������', '������� ������� � ������� �����������'),
(8, '��������� �����', '������� ����������� � ���������'),
(9, '�������� ���������', '������� ���������� � ���������'),
(10, '����� ������� �������', '������� ���������������� � ��������������');

-- ���������� ������� Event �������
INSERT INTO Event (ID, Name, Date, Description) VALUES
(1, '����� ������� �����', '2024-05-20', '����� � �������������� ������� � ��� ������ ��������'),
(2, '������ ���������', '2024-06-10', '������������ ����� ������� ������� � ������'),
(3, '������������ ������� ����', '2024-07-02', '���������� � ������� ����� � ������� ��������'),
(4, '�������� ������� �������������', '2024-08-15', '��������� �������� ������������ � �������'),
(5, '�������� �� ���������� ���', '2024-09-05', '������ ���� �� ��������� ������ ���'),
(6, '�������� �������', '2024-10-20', '������� ��� �������� � ������ ������� ����������'),
(7, '����� � ���� �����', '2024-11-08', '������� ����������� � �����, ������ ��������'),
(8, '������ ����������', '2024-12-01', '����������� ��� �������� ����� ���������� ����������'),
(9, '�������� �� ������� ��������', '2025-01-15', '��������� ����� � �������� ���������� � ��������� ������'),
(10, '��������� ��������', '2025-02-28', '�������� � ����� ���������� �������� � ������� �������');


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
	AND C1.name = '����';

SELECT C.name, e.name
FROM [Character] AS C
	, Participating AS p
	, [Event] as e
WHERE MATCH(C-(p)->e)
AND C.name = '�������';

SELECT C.name, G.name
FROM [Character] AS C
	, Including AS I
	, Guild as G
WHERE MATCH(G-(I)->C)
AND G.name = '����� ������� ������';

SELECT C.name, e.name
FROM [Character] AS C
	, Participating AS p
	, [Event] as e
WHERE MATCH(C-(p)->e)
AND e.name = '�������� �� ������� ��������';

SELECT C.name, G.name
FROM [Character] AS C
	, Including AS I
	, Guild as G
WHERE MATCH(G-(I)->C)
AND C.name = '�������';

SELECT C1.name
	, STRING_AGG(C2.name, '->') WITHIN GROUP (GRAPH PATH)
FROM [Character] AS C1
	, Friending FOR PATH AS F
	, [Character] FOR PATH AS C2
WHERE MATCH(SHORTEST_PATH(C1(-(F)->C2)+))
	AND C1.name = '�����';

SELECT C1.name
	, STRING_AGG(C2.name, '->') WITHIN GROUP (GRAPH PATH)
FROM [Character] AS C1
	, Friending FOR PATH AS F
	, [Character] FOR PATH AS C2
WHERE MATCH(SHORTEST_PATH(C1(-(F)->C2){1,3}))
	AND C1.name = '����';

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