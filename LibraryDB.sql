CREATE DATABASE Library

USE Library

CREATE TABLE Authors
(
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(20),
    Surname NVARCHAR(20)
)

CREATE TABLE Books
(
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(200),
    PageCount INT,
    AuthorId INT FOREIGN KEY REFERENCES Authors(Id)
)

ALTER TABLE Books
ADD CONSTRAINT CK_Len CHECK(LEN(Name) BETWEEN 2 AND 100)


ALTER TABLE Books
ADD CONSTRAINT CK_Min CHECK (PageCount >2 )


INSERT INTO Authors
VALUES
('Semed', 'Vurgun'),
('Memmed','Araz'),
('Cefer', 'Cabbarli')

INSERT INTO Books
VALUES
('Book1', 20, 1),
('Book2', 30, 2),
('Book3',30, 3)

SELECT * FROM Authors

SELECT * FROM Books

CREATE VIEW usp_showbook
AS
SELECT BK.Id,BK.Name ,BK.PageCount,AU.Name+' '+AU.Surname AS 'FullName' FROM Books AS BK
JOIN Authors AS AU ON BK.AuthorId = AU.Id

ALTER VIEW usp_showbook
AS
SELECT BK.Id,BK.Name AS 'BookName' ,BK.PageCount,AU.Name+' '+AU.Surname AS 'FullName' FROM Books AS BK
JOIN Authors AS AU ON BK.AuthorId = AU.Id

SELECT * FROM usp_showbook



CREATE PROCEDURE usp_filterdBooks
@value VARCHAR(25)
AS
SELECT * FROM usp_showbook AS SHBK
WHERE SHBK.FullName LIKE (@value) OR SHBK.BookName LIKE (@value)

EXEC usp_filterdBooks 'Semed Vurgun'

CREATE PROCEDURE usp_deleteauthors
@value INT
AS 
DELETE FROM Authors
WHERE Id = @value

EXEC usp_deleteauthors 7


CREATE PROCEDURE usp_insertauthors
@valuename VARCHAR(25),
@valuesurname VARCHAR(30)
AS
INSERT INTO Authors
VALUES
(@valuename,@valuesurname)

EXEC usp_insertauthors 'Xelil','Rza'

CREATE PROCEDURE usp_updateauthors
@value INT,
@valuename VARCHAR(25)
AS
UPDATE Authors
SET Authors.Name=@valuename
where Id = @value

EXEC usp_updateauthors 8 ,'Cabbarov'


SELECT BK.MAX(PageCount) FROM Authors AS AU
JOIN Books AS BK ON AU.Id = BK.AuthorId
GROUP BY(PageCount)



SELECT MAX(PageCount) AS 'MAXPAGE',AuthorId from Books GROUP BY AuthorId 



CREATE VIEW usp_showinfo
AS 
SELECT AU.Id,AU.Name+' '+AU.Surname AS 'FullName',MAXPAGE,(SELECT COUNT(Id)FROM Books WHERE Books.AuthorId=AU.Id)AS'AuthorBookCount' FROM Authors AS AU
JOIN 
(SELECT MAX(PageCount) AS 'MAXPAGE',AuthorId from Books GROUP BY AuthorId )AS PR ON
PR.AuthorId= AU.Id

SELECT * FROM usp_showinfo