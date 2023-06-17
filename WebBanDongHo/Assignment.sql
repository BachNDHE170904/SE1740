CREATE DATABASE WatchDb
USE WatchDb
CREATE TABLE Watches (
   id   INT    NOT NULL identity(1,1),
   name NVARCHAR (50)     NOT NULL,
   sku NVARCHAR (50)     NOT NULL,
   price float	NOT NULL,
   PRIMARY KEY (id),
);
drop table Account
SET IDENTITY_INSERT Watches OFF
insert into Watches(name,sku,price) values ('Inverness - Walnut & Black Leather','f4fc9661',124.00);
insert into Watches(name,sku,price) values ('Inverness SS - Walnut','a21ad935#1',148.00);
insert into Watches(name,sku,price) values ('Inverness - Walnut & Brown Leather','02cd1266',124.00);
insert into Watches(name,sku,price) values ('Inverness - Zebrawood & Black Leather','39f52fe4',124.00);
insert into Watches(name,sku,price) values ('Inverness - Multi Bamboo & Brown Leather','409b3473',100.00);
insert into Watches(name,sku,price) values ('Inverness - Multi Bamboo Limited Edition','ac20a290',148.00);
insert into Watches(name,sku,price) values ('Kylemore - Bamboo Black Leather','f73fcfca',86.75);
insert into Watches(name,sku,price) values ('Inverness SS - Walnut','a21ad935',148.00);
CREATE TABLE Accounts (
   id   INT    NOT NULL identity(1,1),
   name NVARCHAR (50)     NOT NULL,
   pass NVARCHAR (50)     NOT NULL,
   PRIMARY KEY (id),
);
