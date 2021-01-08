# Library_management
Library_System
Note
I run my SQL server on different port number. If anyone is running this project, do not forget to change the port number in dbconfig.php file.

Abstract
Library Management System is a system which maintains the informationabout the books present in the library, their authors, the members of library to whom books are issued, library staff and all. This is very difficult to organizemanually. Maintenance of all this information manually is a very complex task.Owing to the advancement of technology, organization of an Online Library becomes much simple. The Online Library Management has been designed tocomputerize and automate the operations performed over the information about themembers, book issues and returns and all other operations. This computerization oflibrary helps in many instances of its maintenances. It reduces the workload of management as most of the manual work done is reduced.

Introduction
ENVIRONMENT USED
PHP
MySQL
BootStrap
JavaScript (Only few lines)
HTML
CSS
Development Tools
● Server: XAAMP(apache) ○ apache encourages clean, practical way of designing highly customizable applications. ○ It is a very reliable, efficient, architecturally sound and secure when building web apps. ● Sublime ○ It provides smart code completion, code inspections, on-the-fly error highlighting and quick-fixes with automated code refactorings and rich navigation capabilities. ● Github ○ Helps developers to collaborate over the code easily and for version controlling the source code.

Project Aims and Objectives
The project aims and objectives that will be achieved after completion of this project are discussed in this subchapter. The aims and objectives are as follows: • A search column to search availability of books. • An Admin login page where admin can add books, magazines, students, staff. • System is mainly to provide automation to the library. • To make easy and fast allocation of the book. • To maintain the records of books and fines in proper manner. • To avoid the use of paper.

Actors
People who interact with database: ● Admin ● User Different actors have different access to the database: ●Admin can: ○ Check and edit the list of Student, Staff, Magazine, Book. ○ Obtain and edit/add Books ○ View and also edit the tickets of any user. ○ Change/view the schedule for a train ○ Generate chart for a specific train for a given journey ● User can ○ Get list of ticket that he/she has booked ○ Book multiple tickets. ○ Cancel the ticket he/she has booked

SYSTEM DESIGN
NORMALIZATION TECHNIQUES
Every candidate key in a table determines all other attributes and no non-key attributesdetermine any attributes in the tables. Hence all tables are already in 3rd NF.4 th NF is not required since there are no repeated values in any of the tables.

GLOBAL SCHEMA
-- -- Database: lms
-- -- Table structure for table book
CREATE TABLE book ( id int(11) NOT NULL, name varchar(11) NOT NULL, author varchar(11) NOT NULL, dateadd datetime NOT NULL DEFAULT current_timestamp(), addedby varchar(1000) NOT NULL, isbn longtext NOT NULL ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -- Table structure for table bookcopy
CREATE TABLE bookcopy ( sr int(11) NOT NULL, bookid int(11) NOT NULL, copyid varchar(11) NOT NULL, status int(11) NOT NULL, prn int(11) NOT NULL ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -- Table structure for table magazine
CREATE TABLE magazine ( id int(11) NOT NULL, name varchar(11) NOT NULL, author varchar(11) NOT NULL, dateadd datetime NOT NULL DEFAULT current_timestamp(), addedby varchar(1000) NOT NULL, isbn longtext NOT NULL ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -- Table structure for table magazinecopy
CREATE TABLE magazinecopy ( sr int(11) NOT NULL, bookid int(11) NOT NULL, copyid varchar(11) NOT NULL, status int(11) NOT NULL DEFAULT 1, prn int(11) NOT NULL ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -- Table structure for table removeddata
CREATE TABLE removeddata ( id int(11) NOT NULL, removedby varchar(1000) NOT NULL, removedon datetime NOT NULL DEFAULT current_timestamp(), removeditem varchar(1000) NOT NULL, removedcount varchar(1000) NOT NULL ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -- Table structure for table staff
CREATE TABLE staff ( sid int(11) UNSIGNED NOT NULL, Name varchar(30) NOT NULL, mobile varchar(10) NOT NULL, Email varchar(50) NOT NULL, password varchar(256) NOT NULL, branch varchar(40) NOT NULL, image varchar(256) NOT NULL, Date date NOT NULL DEFAULT current_timestamp(), last_login timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(), Login_ip varchar(30) NOT NULL, Category int(11) NOT NULL DEFAULT 1 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -- Table structure for table student
CREATE TABLE student ( stid int(11) UNSIGNED NOT NULL, prn varchar(11) NOT NULL, Name varchar(30) NOT NULL, Email varchar(256) NOT NULL, mobile bigint(255) NOT NULL, branch varchar(30) NOT NULL, admi_year date NOT NULL, status varchar(30) NOT NULL DEFAULT '0', Gender text NOT NULL, Address longtext NOT NULL, image longtext NOT NULL ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -- Table structure for table student_book
CREATE TABLE student_book ( sr_no int(11) UNSIGNED NOT NULL, prn varchar(30) NOT NULL, book_name varchar(30) NOT NULL, took datetime NOT NULL, renew datetime NOT NULL, fine bigint(20) NOT NULL DEFAULT 0, category text NOT NULL ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -- Indexes for table book
ALTER TABLE book ADD PRIMARY KEY (id);

-- -- Indexes for table bookcopy
ALTER TABLE bookcopy ADD PRIMARY KEY (sr), ADD KEY bookid (bookid);

-- -- Indexes for table magazine
ALTER TABLE magazine ADD PRIMARY KEY (id);

-- -- Indexes for table magazinecopy
ALTER TABLE magazinecopy ADD PRIMARY KEY (sr), ADD KEY bookid (bookid);

-- -- Indexes for table removeddata
ALTER TABLE removeddata ADD PRIMARY KEY (id), ADD KEY removedby_2 (removedby(768)); ALTER TABLE removeddata ADD FULLTEXT KEY removedby (removedby);

-- -- Indexes for table staff
ALTER TABLE staff ADD PRIMARY KEY (sid), ADD KEY Name_2 (Name); ALTER TABLE staff ADD FULLTEXT KEY Name (Name);

-- -- Indexes for table student
ALTER TABLE student ADD PRIMARY KEY (stid), ADD UNIQUE KEY prn (prn), ADD KEY prn_2 (prn);

-- -- Indexes for table student_book
ALTER TABLE student_book ADD PRIMARY KEY (sr_no), ADD KEY prn (prn), ADD KEY prn_2 (prn);

-- -- AUTO_INCREMENT for dumped tables
-- -- AUTO_INCREMENT for table book
ALTER TABLE book MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

-- -- AUTO_INCREMENT for table bookcopy
ALTER TABLE bookcopy MODIFY sr int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

-- -- AUTO_INCREMENT for table magazine
ALTER TABLE magazine MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

-- -- AUTO_INCREMENT for table magazinecopy
ALTER TABLE magazinecopy MODIFY sr int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

-- -- AUTO_INCREMENT for table removeddata
ALTER TABLE removeddata MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

-- -- AUTO_INCREMENT for table staff
ALTER TABLE staff MODIFY sid int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

-- -- AUTO_INCREMENT for table student
ALTER TABLE student MODIFY stid int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=818;

-- -- AUTO_INCREMENT for table student_book
ALTER TABLE student_book MODIFY sr_no int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

-- -- Constraints for dumped tables
-- -- Constraints for table bookcopy
ALTER TABLE bookcopy ADD CONSTRAINT bookcopy_ibfk_1 FOREIGN KEY (bookid) REFERENCES book (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- -- Constraints for table magazinecopy
ALTER TABLE magazinecopy ADD CONSTRAINT magazinecopy_ibfk_1 FOREIGN KEY (bookid) REFERENCES magazine (id);

-- -- Constraints for table student_book
ALTER TABLE student_book ADD CONSTRAINT student_book_ibfk_1 FOREIGN KEY (prn) REFERENCES student (prn); COMMIT;

CONCLUSION
This website provides a computerized version of library management system which will benefit the students as well as the staff of the library.It makes entire process online where student can search books, staff can generate reports anddo book transactions. It also has a facility for student login where student can login and can seestatus of books issued as well request for book or give some suggestions. It has a facility ofteacher’s login where teachers can add lectures notes and also give necessary suggestion tolibrary and also add info about workshops or events happening in our college or nearby collegein the online notice board.
