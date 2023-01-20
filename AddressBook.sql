--UC1 Create Database
create Database AddressBook;
use AddressBook;

--UC2 Create Table Address_Book
create table BookAddress(ID int identity(1,1) primary key,FirstName varchar(50), LastName varchar(50), Address varchar(100), City varchar(50), State varchar(30), ZipCode int, PhoneNumber bigint, Email varchar(50) )

--UC3 Insert New Contacts in Address_Book
insert into BookAddress values
('Prabhu', 'Goyal', 'C-185', 'Moradabad', 'UP', 244001, 9876543212, 'prabhugoyal@gmail.com'),
('Sunil', 'Kumar', 'Q23', 'Kanpur', 'UP', 84521, 8765432123, 'sunil23@gmail.com'),
('Hemant', 'Multani', 'A12', 'Moradabad', 'UP', 234567, 7654321234, 'hemant.multabi@gmail.com'),
('Semma', 'Goyal', '22QW', 'Gurgao', 'Haryana', 234123, 6543212345, 'seema12goyal@gmail.com'),
('Mansi', 'Singh', 'PO12', 'Delhi', 'Delhi', 211011, 9878987654, 'mansi233@gmail.com'),
('Vinesh', 'Kumar', 'A/12', 'Dehradun', 'Uttrakhand', 212234, 9753124680, 'vinesh.kumar126@gmail.com')
select * from BookAddress

--UC4 Edit Person Details using Name
update BookAddress set Email = 'hemant007@gmail.com' where FirstName = 'Hemant'

--UC5 Delete record using Name
delete from BookAddress where FirstName = 'Sunil'

--UC6 Revtive person details using state or city name 
select * from BookAddress where City='Moradabad' or State = 'Uttrakhand'

--UC7 Size of Address Book
select Count(*) as SizeOfAddressBook from BookAddress

--UC8 retrive data 
select * from BookAddress where state = 'UP' Order By FirstName

--UC9 Ability to identify each Address Book with name and Type
alter table BookAddress add Type varchar(15)
update BookAddress set Type = 'Family' where FirstName='Prabhu'
update BookAddress set Type = 'Profession' where FirstName='Sunil'
update BookAddress set Type = 'Friend' where FirstName='Hemant'
update BookAddress set Type = 'Family' where FirstName='Semma'
update BookAddress set Type = 'Profession' where FirstName='Mansi'
update BookAddress set Type = 'Friend' where FirstName='Vinesh'
select * from BookAddress

--UC10 Ability to get number of contact persons i.e. count by type
select Count(Type) as NoOfContacts from BookAddress where type = 'Profession'
select Count(Type) as NoOfContacts from BookAddress where type = 'Family'
select Count(Type) as NoOfContacts from BookAddress where type = 'Friend'

--UC11 Ability to add person to both Friend and Family
insert into BookAddress values('Nitin','Rathod','HouseNo 234','Mumbai','Maharashtra',400011,'9632105478','nint@yahoo.com','Profession'),('Samridhi','Goyal','213A','Bangalore','Karnataka',230011,'9872105478','sam23ridhi@yahoo.com','Friend');

create table Book(BookName varchar(50),BookType varchar(50),ID int foreign key references BookAddress(ID))
insert into Book values('Book1','Family',1),('Book2','Profession',2),('Book3','Friend',3),('Book1','Family',4),('Book2','Profession',5),('Book3','Friend',6),('Book2','Profession',7),('Book3','Friend',8)
select * from Book

--UC13 Ensure all retrieve queries done especially in UC 6, UC 7, UC 8 and UC 10 are working with new table structure
select * from BookAddress ba inner join Book b on ba.ID=b.ID where City='Moradabad' or State = 'Uttrakhand'
select Count(*) as SizeOfAddressBook from BookAddress ba inner join Book b on ba.ID=b.ID 
select * from BookAddress ba inner join Book b on ba.ID=b.ID where state = 'UP' Order By FirstName

select Count(Type) as NoOfContacts from BookAddress ba inner join Book b on ba.ID=b.ID where type = 'Profession'
select Count(Type) as NoOfContacts from BookAddress ba inner join Book b on ba.ID=b.ID where type = 'Family'
select Count(Type) as NoOfContacts from BookAddress ba inner join Book b on ba.ID=b.ID where type = 'Friend'
