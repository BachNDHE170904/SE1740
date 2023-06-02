CREATE DATABASE WatchDb
USE WatchDb
CREATE TABLE Watches (
   id   INT    NOT NULL identity(1,1),
   name NVARCHAR (50)     NOT NULL,
   price INT	NOT NULL,
   PRIMARY KEY (id),
);
drop table Watches
SET IDENTITY_INSERT Watches OFF
insert into Watches(name,price) values ('Inverness - Walnut & Black Leather',124);
insert into Watches(name,price) values ('Inverness SS - Walnut',148);
insert into Watches(name,price) values ('Inverness - Walnut & Brown Leather',124);
insert into Watches(name,price) values ('Inverness - Zebrawood & Black Leather',124);
insert into Watches(name,price) values ('Inverness - Multi Bamboo & Brown Leather',100);
select *from Watches