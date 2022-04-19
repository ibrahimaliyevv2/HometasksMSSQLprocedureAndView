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
    Name NVARCHAR(200) CHECK(LEN(Name) BETWEEN 2 AND 100),
    PageCount INT CHECK (PageCount >2 ),
    AuthorId INT FOREIGN KEY REFERENCES Authors(Id)
)


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


--1
CREATE VIEW showbooks
AS
SELECT Books.Id, Books.Name, Books.PageCount, Authors.Name + ' ' + Authors.Surname AS 'AuthorFullName' FROM Books
JOIN Authors ON Books.AuthorId = Authors.Id


--2
CREATE PROCEDURE usp_showbooks
@searched NVARCHAR(20)
AS
SELECT Books.Id, Books.Name, Books.PageCount, Authors.Name + ' ' + Authors.Surname AS 'AuthorFullName' FROM Books
JOIN Authors ON Books.AuthorId = Authors.Id
WHERE Books.Name LIKE @searched OR  Authors.Name + ' ' + Authors.Surname LIKE @searched


--3
CREATE PROCEDURE usp_insert
@name NVARCHAR(20), @surname NVARCHAR(20)
AS
INSERT INTO Authors
VALUES
(@name, @surname)


--4
CREATE PROCEDURE usp_update
@Id INT, @name NVARCHAR(20), @surname NVARCHAR(20)
AS
UPDATE Authors
SET Name = @name, Surname = @surname
WHERE Id = @id


--5
CREATE PROCEDURE usp_delete
@id INT
AS
DELETE FROM Authors
WHERE Id = @id


--6
CREATE VIEW showauthorinfo
AS
SELECT Authors.Id, Authors.Name + ' ' + Authors.Surname AS 'FullName', 
(SELECT COUNT(Id) FROM Books) AS 'BooksCount', 
(SELECT MAX(PageCount) FROM Books) AS 'MaxPageCount' FROM Authors
