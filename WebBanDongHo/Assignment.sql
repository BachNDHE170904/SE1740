CREATE DATABASE WatchDb
USE WatchDb
CREATE TABLE Watches (
   id   INT    NOT NULL identity(1,1),
   name NVARCHAR (50)     NOT NULL,
   sku NVARCHAR (50)     NOT NULL,
   price float	NOT NULL,
   PRIMARY KEY (id),
);

SET IDENTITY_INSERT Watches OFF
insert into Watches(name,sku,price) values ('Inverness - Walnut & Black Leather','f4fc9661',124.00);
insert into Watches(name,sku,price) values ('Inverness SS - Walnut','a21ad935#1',148.00);
insert into Watches(name,sku,price) values ('Inverness - Walnut & Brown Leather','02cd1266',124.00);
insert into Watches(name,sku,price) values ('Inverness - Zebrawood & Black Leather','39f52fe4',124.00);
insert into Watches(name,sku,price) values ('Inverness - Multi Bamboo & Brown Leather','409b3473',100.00);
insert into Watches(name,sku,price) values ('Inverness - Multi Bamboo Limited Edition','ac20a290',148.00);
insert into Watches(name,sku,price) values ('Kylemore - Bamboo Black Leather','f73fcfca',86.75);
insert into Watches(name,sku,price) values ('Inverness SS - Walnut','a21ad935',148.00);
insert into Watches(name,sku,price) values ('Inverness - Multi Bamboo & Black Leather','b78cb90f',124.00);
insert into Watches(name,sku,price) values ('Inverness - Zebrawood & Brown Leather','e30fed33',124.00);
insert into Watches(name,sku,price) values ('Auburn','23c94900',46.00);
insert into Watches(name,sku,price) values ('Women Lev','99369b79#3',479.00);
CREATE TABLE Accounts (
   username NVARCHAR (50)     NOT NULL,
   password NVARCHAR (50)     NOT NULL,
   PRIMARY KEY (username),
);
CREATE TABLE Orders (
   id   INT    NOT NULL identity(1,1),
   username NVARCHAR (50)     NOT NULL,
   paid bit,
   watchid   INT    NOT NULL,
   quantity   INT    NOT NULL
   PRIMARY KEY (id),
   FOREIGN KEY (username) REFERENCES Accounts(username),
   FOREIGN KEY (watchid) REFERENCES Watches(id),
);

CREATE TABLE WatchSpecs (
   id   INT    NOT NULL identity(1,1),
   bezel NVARCHAR (80)     NOT NULL,
   movement NVARCHAR (80)     NOT NULL,
   dial NVARCHAR (80)     NOT NULL,
   watchCase NVARCHAR (80)     NOT NULL,
   glass NVARCHAR (80)     NOT NULL,
   strap NVARCHAR (80)     NOT NULL,
   PRIMARY KEY (id),
   FOREIGN KEY (id) REFERENCES Watches(id),
);

insert into WatchSpecs(bezel,movement,dial,watchCase,glass,strap)values('Walnut','Miyota Japanese Quartz 3 hand with date',
'Features applied indices, printed seconds track, and custom molded hands',
'45mm, 50 meter water resistant 316L stainless steel case, and caseback',
'Hardened Mineral Crystal','quick release leather adjustable strap with memory lock stainless steel clasp');
insert into WatchSpecs(bezel,movement,dial,watchCase,glass,strap)values('Walnut','Miyota Japanese Quartz 3 hand with date',
'Features applied indices, printed seconds track, and custom molded hands',
'45mm, 50 meter water resistant 316L stainless steel case, and caseback',
'Hardened Mineral Crystal','Stainless steel adjustable strap with stainless steel clasp');
insert into WatchSpecs(bezel,movement,dial,watchCase,glass,strap)values('Walnut','Miyota Japanese Quartz 3 hand with date',
'Features applied indices, printed seconds track, and custom molded hands',
'45mm, 50 meter water resistant 316L stainless steel case, and caseback',
'Hardened Mineral Crystal','quick release leather adjustable strap with memory lock stainless steel clasp');
insert into WatchSpecs(bezel,movement,dial,watchCase,glass,strap)values('Zebrawood','Miyota Japanese Quartz 3 hand with date',
'Features applied indices, printed seconds track, and custom molded hands',
'45mm, 50 meter water resistant 316L stainless steel case, and caseback',
'Hardened Mineral Crystal','quick release leather adjustable strap with memory lock stainless steel clasp');
insert into WatchSpecs(bezel,movement,dial,watchCase,glass,strap)values('Multi Colored Bamboo',
'Miyota Japanese Quartz 3 hand with date',
'Features applied indices, printed seconds track, and custom molded hands',
'45mm, 50 meter water resistant 316L stainless steel case, and caseback',
'Hardened Mineral Crystal','quick release leather adjustable strap with memory lock stainless steel clasp');
insert into WatchSpecs(bezel,movement,dial,watchCase,glass,strap)values('Multi Colored Bamboo','Miyota Japanese Quartz 3 hand with date',
'Features applied indices, printed seconds track, and custom molded hands',
'45mm, 50 meter water resistant 316L stainless steel case, and caseback',
'Hardened Mineral Crystal','24 mm wide custom bamboo 3 link bracelet with stainless steel clasp.');
insert into WatchSpecs(bezel,movement,dial,watchCase,glass,strap)values('Multi Colored Bamboo','Miyota Japanese Quartz 3 hand with date',
'Features applied indices, printed seconds track, and custom molded hands',
'45mm, 50 meter water resistant 316L stainless steel case, and caseback',
'Hardened Mineral Crystal','quick release leather adjustable strap with memory lock stainless steel clasp');
insert into WatchSpecs(bezel,movement,dial,watchCase,glass,strap)values('Walnut','Miyota Japanese Quartz 3 hand with date',
'Features applied indices, printed seconds track, and custom molded hands',
'45mm, 50 meter water resistant 316L stainless steel case, and caseback',
'Hardened Mineral Crystal','Stainless steel adjustable strap with stainless steel clasp');
insert into WatchSpecs(bezel,movement,dial,watchCase,glass,strap)values(' Multi Colored Bamboo','Miyota Japanese Quartz 3 hand with date',
'Features applied indices, printed seconds track, and custom molded hands',
'45mm, 50 meter water resistant 316L stainless steel case, and caseback',
'Hardened Mineral Crystal','quick release leather adjustable strap with memory lock stainless steel clasp');
insert into WatchSpecs(bezel,movement,dial,watchCase,glass,strap)values(' Zebrawood','Miyota Japanese Quartz 3 hand with date',
'Features applied indices, printed seconds track, and custom molded hands',
'45mm, 50 meter water resistant 316L stainless steel case, and caseback',
'Hardened Mineral Crystal','quick release leather adjustable strap with memory lock stainless steel clasp');
insert into WatchSpecs(bezel,movement,dial,watchCase,glass,strap)values(' Zebrawood','Miyota Japanese Quartz 3 hand with date',
'Features applied indices, printed seconds track, and custom molded hands',
'45mm, 50 meter water resistant 316L stainless steel case, and caseback',
'Hardened Mineral Crystal','quick release leather adjustable strap with memory lock stainless steel clasp');
insert into WatchSpecs(bezel,movement,dial,watchCase,glass,strap)values(' Zebrawood','Miyota Japanese Quartz 3 hand with date',
'Features applied indices, printed seconds track, and custom molded hands',
'45mm, 50 meter water resistant 316L stainless steel case, and caseback',
'Hardened Mineral Crystal','quick release leather adjustable strap with memory lock stainless steel clasp');

CREATE TABLE Address (
   id   INT    NOT NULL identity(1,1),
   username NVARCHAR (50)     NOT NULL,
   firstName NVARCHAR (50)     NOT NULL,
   lastName NVARCHAR (50)     NOT NULL,
   phone NVARCHAR (50)     NOT NULL,
   customerAddress NVARCHAR (80)     NOT NULL,
   PRIMARY KEY (id),
   FOREIGN KEY (username) REFERENCES Accounts(username),
);
select * from Orders