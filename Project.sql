CREATE DATABASE db_librayManagement;
DROP DATABASE db_librayManagement;

--Statements to allow creation and insertion
USE db_librayManagement
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET IDENTITY_INSERT BORROWER ON

--Table creation with keys 
CREATE TABLE LIBRARY_BRANCH (
    BranchID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
    BranchName varchar(50) NOT NULL,
    BranchAddress varchar(50) NOT NULL
);


CREATE TABLE PUBLISHER (
    PublisherName varchar(50) NOT NULL PRIMARY KEY,
    PublisherAddress varchar(50) NOT NULL,
    PhoneNumber INT NOT NULL
);

SELECT * FROM PUBLISHER;


CREATE TABLE BOOKS (
    BookID INT NOT NULL PRIMARY KEY IDENTITY (10,10),
    Title varchar(50) NOT NULL, 
    PublisherName varchar(50) FOREIGN KEY REFERENCES PUBLISHER(PublisherName)
);

CREATE TABLE BOOK_AUTHORS (
    BookID INT FOREIGN KEY REFERENCES BOOKS(BookID),
    AuthorName varchar(50) NOT NULL
);

CREATE TABLE BOOK_COPIES (
    BookID INT FOREIGN KEY REFERENCES BOOKS(BookID),
    BranchID INT FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID),
    Number_of_Copies INT NOT NULL
);

CREATE TABLE BORROWER (
    CardNo INT NOT NULL PRIMARY KEY IDENTITY (1,1),
    Borrower_Name varchar(50) NOT NULL,
	Borrower_Address varchar(50) NOT NULL,
	Borrower_Phone INT NOT NULL
);

CREATE TABLE BOOK_LOANS (
	BookID INT FOREIGN KEY REFERENCES BOOKS(BookID),
	BranchID INT FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID),
    CardNo INT FOREIGN KEY REFERENCES BORROWER(CardNo),
    DateOut DATE NOT NULL,
    DateDue DATE NOT NULL
);


SELECT * FROM LIBRARY_BRANCH;
SELECT * FROM PUBLISHER;
SELECT * FROM BOOKS;
SELECT * FROM BOOK_AUTHORS;
SELECT * FROM BOOK_COPIES;
SELECT * FROM BOOK_LOANS;
SELECT * FROM BORROWER;

--Insert values into tables
INSERT INTO LIBRARY_BRANCH
		(BranchID, BranchName, BranchAddress)
		VALUES 
		(1, 'Sharpstown', '1112 Maple Drive'),
		(2, 'Central', '2738 Pine Way'),
		(3, 'Eastland', '3305 Willow Path'),
		(4, 'Freeburg', '9006 Oak Street')
	;
	SELECT * FROM LIBRARY_BRANCH;

INSERT INTO PUBLISHER 
		(PublisherName, PublisherAddress, PhoneNumber)
		VALUES 
		('Random House', 'Missouri', 1),
		('Century Hills', 'California', 2)
	;
	SELECT * FROM PUBLISHER;

INSERT INTO BOOKS
		(BookID, Title, PublisherName)
		VALUES 
		(1, 'The Shining', 'Century Hills'),
		(4, 'Pet Sematary', 'Century Hills'),
		(3, 'Looking for Alaska', 'Random House'),
		(6, 'The Hunger Games', 'Random House'),
		(2, 'Catching Fire', 'Random House'),
		(5, 'Mocking Jay', 'Random House'),
		(47, 'Divergent', 'Century Hills'),
		(92, 'Paper Towns', 'Random House'),
		(11, 'The Lost Tribe', 'Century Hills'),
		(45, 'The Great Gatsby', 'Random House'),
		(85, 'To Kill a Mockingbird', 'Random House'),
		(98, 'The Book Theif', 'Random House'),
		(22, 'Perks of being a Wallflower', 'Century Hills'),
		(34, 'The Woman in Cabin 10', 'Random House'),
		(21, 'Persepolis', 'Random House'),
		(91, 'All The Bright Places', 'Century Hills'),
		(23, 'The Glass Castle', 'Random House'),
		(24, 'A Man Called Ove', 'Century Hills'),
		(25, 'Speak', 'Century Hills'),
		(77, 'The Lightning Thief', 'Century Hills'),
		(33, 'Tweak', 'Random House')
;
SELECT * FROM BOOKS;

INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (1, 'Stephen King');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (4, 'Stephen King');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (3, 'John Green');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (6, 'Collins');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (2, 'Collins');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (5, 'Collins');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (47, 'Veronica Roth');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (92, 'John Green');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (11, 'Mark Lee');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (45, 'Fitzgerald');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (85, 'Harper Lee');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (98, 'Markus Zusak');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (22, 'Stephen Chbosky');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (34, 'Ruth Ware');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (21, 'Marjane Satrapi');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (91, 'Jennifer Niven');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (23, 'Jeannette Walls');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (24, 'Fredrik Backman');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (25, 'Laurie Halse Anderson');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (77, 'Rick Riordan');
INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES (33, 'Nic Sheff');

;
SELECT * FROM BOOK_AUTHORS;

INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (1, 2, 2);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (4, 2, 2);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (3, 4, 3);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (6, 4, 2);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (2, 4, 5);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (5, 4, 2);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (47, 1, 4);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (92, 1, 4);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (11, 1, 6);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (45, 3, 6);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (85, 3, 4);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (98, 2, 6);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (22, 2, 3);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (34, 4, 2);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (21, 1, 3);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (91, 3, 2);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (23, 3, 2);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (24, 4, 5);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (25, 2, 4);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (77, 1, 3);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (33, 1, 2);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (11, 2, 2);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (11, 3, 5);
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES (11, 4, 3);

SELECT * FROM BOOK_COPIES;
SELECT * FROM BOOK_LOANS;

INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (1, 2, 1, '2019-01-01', '2019-01-07');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (4, 2, 1, '2019-01-01', '2019-01-07');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (3, 4, 1, '2019-01-07', '2019-01-14');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (6, 4, 1, '2019-01-07', '2019-01-14');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (2, 4, 1, '2019-01-07', '2019-01-14');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (5, 4, 6, '2019-03-14', '2019-03-21');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (47, 1, 6, '2019-03-14', '2019-03-21');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (11, 4, 6, '2019-03-21', '2019-03-28');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (11, 3, 6, '2019-03-21', '2019-03-28');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (33, 1, 6, '2019-03-21', '2019-03-28');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (77, 1, 6, '2019-04-02', '2019-04-09');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (25, 2, 6, '2019-04-02', '2019-04-09');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (24, 4, 6, '2019-04-02', '2019-04-09');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (23, 3, 6, '2019-04-16', '2019-04-23');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (91, 3, 6, '2019-04-16', '2019-04-23');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (21, 1, 8, '2019-02-06', '2019-02-13');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (34, 4, 8, '2019-02-06', '2019-02-13');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (22, 2, 8, '2019-02-06', '2019-02-13');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (1, 4, 8, '2019-03-17', '2019-03-24');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (1, 2, 2, '2019-01-07', '2019-01-14');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (5, 4, 2, '2019-01-07', '2019-01-14');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (47, 4, 2, '2019-02-20', '2019-02-27');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (11, 3, 2, '2019-02-20', '2019-02-27');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (33, 1, 2, '2019-04-16', '2019-04-23');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (77, 1, 2, '2019-04-16', '2019-04-23');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (25, 2, 3, '2019-02-22', '2019-03-01');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (24, 4, 3, '2019-02-22', '2019-03-01');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (23, 3, 5, '2019-04-16', '2019-04-23');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (91, 3, 5, '2019-01-04', '2019-01-11');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (21, 1, 5, '2019-04-16', '2019-04-23');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (34, 4, 5, '2019-01-04', '2019-01-11');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (22, 2, 5, '2019-01-03', '2019-01-10');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (1, 4, 5, '2019-01-04', '2019-01-11');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (5, 4, 5, '2019-01-04', '2019-01-11');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (47, 4, 5, '2019-01-04', '2019-01-11');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (11, 3, 5, '2019-04-04', '2019-04-11');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (33, 1, 5, '2019-04-15', '2019-04-15');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (98, 2, 5, '2019-01-03', '2019-01-10');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (85, 3, 5, '2019-04-15', '2019-04-15');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (6, 4, 9, '2019-04-15', '2019-04-15');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (3, 4, 9, '2019-04-16', '2019-04-23');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (77, 1, 9, '2019-04-05', '2019-04-12');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (25, 2, 9, '2019-03-01', '2019-03-08');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (24, 4, 9, '2019-03-01', '2019-03-08');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (23, 3, 9, '2019-03-01', '2019-03-08');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (11, 4, 9, '2019-02-19', '2019-02-26');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (98, 2, 9, '2019-01-28', '2019-02-04');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (85, 3, 9, '2019-01-28', '2019-02-24');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (6, 4, 9, '2019-02-19', '2019-02-26');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (3, 4, 9, '2019-02-19', '2019-02-26');
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES (11, 4, 9, '2019-02-19', '2019-02-26');

SELECT * FROM BORROWER;

INSERT INTO BORROWER (CardNo, Borrower_Name, Borrower_Address, Borrower_Phone) VALUES (1, 'Alex', 'Main Street', '1');
INSERT INTO BORROWER (CardNo, Borrower_Name, Borrower_Address, Borrower_Phone) VALUES (2, 'Quinn', '1111 Sephora Way', '2');
INSERT INTO BORROWER (CardNo, Borrower_Name, Borrower_Address, Borrower_Phone) VALUES (3, 'Ashton', '1221 Fire Road', '3');
INSERT INTO BORROWER (CardNo, Borrower_Name, Borrower_Address, Borrower_Phone) VALUES (4, 'Meadow', '54th Street', '4');
INSERT INTO BORROWER (CardNo, Borrower_Name, Borrower_Address, Borrower_Phone) VALUES (5, 'Nadia', '23rd Street', '5');
INSERT INTO BORROWER (CardNo, Borrower_Name, Borrower_Address, Borrower_Phone) VALUES (6, 'Clover', '19th Street', '6');
INSERT INTO BORROWER (CardNo, Borrower_Name, Borrower_Address, Borrower_Phone) VALUES (7, 'Dakota', '44 States Lane', '7');
INSERT INTO BORROWER (CardNo, Borrower_Name, Borrower_Address, Borrower_Phone) VALUES (8, 'Sage', '43 Windham Corner', '8');
INSERT INTO BORROWER (CardNo, Borrower_Name, Borrower_Address, Borrower_Phone) VALUES (9, 'Hana', '4204 Right Drive', '9');


--1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

SELECT * FROM BOOK_COPIES;
SELECT * FROM BOOKS;
SELECT * FROM LIBRARY_BRANCH;

SELECT BOOK_COPIES.Number_of_Copies, BOOKS.Title, LIBRARY_BRANCH.BranchName
FROM BOOK_COPIES
INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID
INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
WHERE LIBRARY_BRANCH.BranchName = 'Sharpstown' AND BOOKS.Title = 'The Lost Tribe';

--2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?

SELECT * FROM BOOK_COPIES;
SELECT * FROM BOOKS;
SELECT * FROM LIBRARY_BRANCH;

SELECT BOOK_COPIES.Number_of_Copies, BOOKS.Title, LIBRARY_BRANCH.BranchName
FROM BOOK_COPIES
INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID
INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
WHERE BOOKS.Title = 'The Lost Tribe'; 

--3.) Retrieve the names of all borrowers who do not have any books checked out.

SELECT * FROM BORROWER;
SELECT * FROM BOOK_LOANS;

SELECT BORROWER.Borrower_Name
FROM BORROWER
WHERE NOT EXISTS(SELECT * FROM BOOK_LOANS WHERE BORROWER.CardNo = BOOK_LOANS.CardNo);

--4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.

SELECT * FROM BORROWER;
SELECT * FROM BOOKS;
SELECT * FROM BOOK_LOANS;

SELECT BOOKS.Title, BORROWER.Borrower_Name, BORROWER.Borrower_Address
FROM BOOK_LOANS
INNER JOIN BOOKS ON BOOK_LOANS.BookID = BOOKS.BookID 
INNER JOIN BORROWER ON BOOK_LOANS.CardNo = BORROWER.CardNo 
WHERE DateDue = '2019-04-23';


--5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

SELECT * FROM LIBRARY_BRANCH;
SELECT * FROM BOOK_LOANS;

SELECT LIBRARY_BRANCH.BranchName, COUNT(BOOK_LOANS.BranchID)
FROM LIBRARY_BRANCH 
INNER JOIN BOOK_LOANS ON LIBRARY_BRANCH.BranchID = BOOK_LOANS.BranchID
GROUP BY LIBRARY_BRANCH.BranchName;



--6.) Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.

SELECT * FROM BORROWER;
SELECT * FROM BOOK_LOANS;

SELECT BORROWER.Borrower_Name, BORROWER.Borrower_Address, COUNT(BOOK_LOANS.CardNo) 
FROM BORROWER
INNER JOIN BOOK_LOANS ON BORROWER.CardNo = BOOK_LOANS.CardNo
GROUP BY Borrower_Name, Borrower_Address
HAVING COUNT(BOOK_LOANS.CardNo) > 5;

--For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".

SELECT * FROM BOOKS;
SELECT * FROM BOOK_AUTHORS;
SELECT * FROM BOOK_COPIES;
SELECT * FROM LIBRARY_BRANCH;


SELECT BOOKS.Title, BOOK_COPIES.Number_of_Copies
FROM BOOKS
INNER JOIN BOOK_COPIES ON BOOKS.BookID = BOOK_COPIES.BookID
INNER JOIN BOOK_AUTHORS ON BOOKS.BookID = BOOK_AUTHORS.BookID
INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
WHERE BOOK_AUTHORS.AuthorName = 'Stephen King' AND LIBRARY_BRANCH.BranchName = 'Central' 


