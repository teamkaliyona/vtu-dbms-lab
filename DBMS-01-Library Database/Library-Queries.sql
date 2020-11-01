--Retrieve details of all books in the library – id, title, name of publisher, authors,
--number of copies in each Programme, etc. 

SELECT B.BOOK_ID, B.TITLE, B.PUB_NAME, A.AUTHOR_NAME,C.NO_OF_COPIES,L.PROGRAMME_ID
FROM BOOK B, BOOK_AUTHORS A, BOOK_COPIES C, LIBRARY_PROGRAMME L
WHERE B.BOOK_ID=A.BOOK_ID
AND B.BOOK_ID=C.BOOK_ID
AND L.PROGRAMME_ID=C.PROGRAMME_ID;

---------------------------------------------

--Get the particulars of borrowers who have borrowed more than 3 books, but
--from Jan 2017 to Jun 2017. 

SELECT CARD_NO
FROM BOOK_LENDING
WHERE DATE_OUT BETWEEN '2017-01-01' AND '2017-06-01'
GROUP BY CARD_NO
HAVING COUNT(*)>3;

---------------------------------------------

--Delete a book in BOOK table. Update the contents of other tables to reflect this
--data manipulation operation. 

DELETE FROM BOOK
WHERE BOOK_ID=3; 

SELECT * FROM BOOK;

SELECT * FROM BOOK_AUTHORS;

---------------------------------------------

--Partition the BOOK table based on year of publication. Demonstrate its working
--with a simple query. 

CREATE VIEW V_PUBLICATION AS SELECT
PUB_YEAR
FROM BOOK; 

SELECT * FROM V_PUBLICATION;

---------------------------------------------

--Create a view of all books and its number of copies that are currently available
--in the Library.

CREATE VIEW V_BOOKS AS
SELECT B.BOOK_ID, B.TITLE, C.NO_OF_COPIES
FROM
BOOK B, BOOK_COPIES C, LIBRARY_PROGRAMME L
WHERE B.BOOK_ID=C.BOOK_ID
AND C.PROGRAMME_ID=L.PROGRAMME_ID;

SELECT * FROM V_BOOKS;