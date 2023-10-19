USE Master;

--DROP DATABASE IF EXISTS dcouch;
--go

--CREATE DATABASE DCouch;
--go

USE DCouch;

CREATE TABLE Users (
	UserID INT IDENTITY(1, 1) PRIMARY KEY,
	FirstName NVARCHAR(MAX),
	LastName NVARCHAR(MAX),
	BirthDate DATETIME2
);
go

CREATE TABLE BlogPost (
	BlogPostID INT IDENTITY(1, 1) PRIMARY KEY,
	Title NVARCHAR(MAX),
	Category NVARCHAR(MAX),
	Body NVARCHAR(MAX),
	PostedDate DATETIME2,
	AuthorID INT FOREIGN KEY REFERENCES Users(UserID)
);
go

CREATE TABLE Comment (
	AuthorID  INT FOREIGN KEY REFERENCES Users(UserID),
	CommentID INT IDENTITY(1, 1) PRIMARY KEY,
	Comment NVARCHAR(MAX),
	CommentDate DATETIME2 NOT NULL,
	BlogPostID INT FOREIGN KEY REFERENCES BlogPost(BlogPostID) 
);
go

INSERT INTO Users (FirstName, LastName, BirthDate)
VALUES (
	'Devan',
	'Couch',
	'1995-11-24'
);

INSERT INTO BlogPost (title, category, body, PostedDate, AuthorID)
VALUES (
	'FirstPost',
	'Tech',
	'First Post!!!',
	GETDATE(),
	1
);

INSERT INTO Comment (Comment, CommentDate, BlogPostID, AuthorID)
VALUES (
	'Hi',
	GETDATE(),
	1,
	1
);

ALTER TABLE Comment
ADD Rating INT 