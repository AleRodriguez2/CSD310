
CREATE TABLE user (
    user_id     INT             NOT NULL        AUTO_INCREMENT,
    first_name   VARCHAR(75)     NOT NULL,
    last_name     VARCHAR(75)     NOT NULL,
    PRIMARY KEY(user_id)
); 

CREATE TABLE wishlist (
    wishlist_id   INT    NOT NULL        AUTO_INCREMENT,
    user_id 	  INT    NOT NULL,
    book_id   	  INT    NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    foreign key (book_id)
        REFERENCES book(book_id),
	CONSTRAINT fk_user
	FOREIGN KEY (user_id)
        REFERENCES user(user_id) 
);

CREATE TABLE book (
    book_id     INT              NOT NULL        AUTO_INCREMENT,
    book_name   VARCHAR(200)     NOT NULL,
    author     VARCHAR(200)     NOT NULL,
    details    VARCHAR(400)     NOT NULL,
    PRIMARY KEY(book_id)
);
    
    CREATE TABLE store (
    store_id     INT             NOT NULL        AUTO_INCREMENT,
    locale   VARCHAR(500)     NOT NULL,
    PRIMARY KEY(store_id)
    );
    
    INSERT INTO store(locale)
    VALUES('1000 Boston post road, west haven, ct 06516');

/*
    insert book records 
*/
INSERT INTO book(book_name, author, details)
    VALUES('IT', 'Steven King', 'a sadistic clown comes to attack children');

INSERT INTO book(book_name, author, details)
    VALUES('The Fellowship of the Ring', 'J.R.Tolkien', 'The first part of The Lord of the Rings');

INSERT INTO book(book_name, author, details)
    VALUES('The Two Towers', 'J.R.Tolkien', "The second part of The Lord of The Rings");

INSERT INTO book(book_name, author, details)
    VALUES('The Hobbit or There and Back Again', 'J.R.Tolkien', 'yet another installment of loard of the rings');

INSERT INTO book(book_name, author, details)
    VALUES('Dune: Deluxe Edition', 'Frank Herbert', 'im not sure what this is');

INSERT INTO book(book_name, author, details)
    VALUES("Charlotee's Web", 'E.B. White', 'just a little pig');

INSERT INTO book(book_name, author, details)
    VALUES('The Great Gatsby', 'F. Scott Fitzgerald', 'jothing like the roaring 20s');

INSERT INTO book(book_name, author, details)
    VALUES('The Lion, the Witch, and the Wardrobe', 'C.S. Lewis', 'i think youll like it');

INSERT INTO book(book_name, author, details)
    VALUES('The Catcher and the Rye', 'J.D. Salinger', 'who knows');

/*
    insert user
*/ 
INSERT INTO user(first_name, last_name) 
    VALUES('Mark', 'Wahlburg');

INSERT INTO user(first_name, last_name)
    VALUES('Bilbo', 'Baggins');

INSERT INTO user(first_name, last_name)
    VALUES('Frodo', 'Baggins');

/*
    insert wishlist records 
*/
INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Mark'), 
        (SELECT book_id FROM book WHERE book_name = 'The Hobbit or There and Back Again')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Bilbo'),
        (SELECT book_id FROM book WHERE book_name = 'The Fellowship of the Ring')
    );

    INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Bilbo'), 
        (SELECT book_id FROM book WHERE book_name = 'The Two Towers')
    );