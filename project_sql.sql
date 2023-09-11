create schema EventFinder;
use EventFinder;

create table USER(
	User_ID char(8) PRIMARY KEY not null,
	Fname VARCHAR(10),
	Lname VARCHAR(10),
	Bdate DATE,
	sex CHAR(1),
	email varchar(50) unique not null,
    Phone_number char(10) unique not null,
    constraint chk_phone check (Phone_number not like '%[^0-9]%')
);  

create table event (
event_id char(8) NOT NULL,
event_name varchar(150) ,
event_type varchar(150) ,
start_time datetime ,
end_time datetime ,
primary key(event_id),
CONSTRAINT CHK_datetime CHECK (start_time between '2022-01-01 00:00:00' AND '2022-12-31 00:00:00' AND end_time between '2022-01-01 00:00:00' AND '2022-12-31 00:00:00' )
);

create table TICKET(
 Expiry_date date,
 Ticket_price decimal(10,2),
 Ticket_ID char(8) primary key not null,
 Seat_number varchar(3),
 Eid char(8),
 Uid char(8),
 constraint chk_seat check(Seat_number>0 and Seat_number<1000),
 constraint chk_price check(Ticket_price>0 and Ticket_price<1000.00),
 foreign key(Eid) references event(event_id),
 foreign key(Uid) references USER(User_ID)
 );

CREATE TABLE ORGANIZERS(
	Organizer_ID char(8) not null,
	Fname VARCHAR(10),
    Mname VARCHAR(10),
    Lname VARCHAR(10),
    Organizer_number char(10) not null,
    PRIMARY KEY(Organizer_ID)
	);
    
create table PERFORMERS(
Performers_ID char(8) primary key not null,
Performers_name varchar(30) not null,
Performers_type varchar(150),
Oid char(8),
foreign key(Oid) references ORGANIZERS(Organizer_ID)
);

create table sponsor (
eid char(8) not null,
sponsor_name varchar(150)  ,
funding_cost double ,
FOREIGN KEY (eid) REFERENCES event(event_id));

create table ATTEND(
uid char(8),
eid char(8),
foreign key(uid) references USER(User_ID),
foreign key(eid) references event(event_id)
);

create table Organize
(
Eid char(8),
Oid char(8),
Hours DECIMAL(3,1),
foreign key(Eid) references event(event_id),
foreign key(Oid) references ORGANIZERS(Organizer_ID)
);

create table event_location(
 eid char(8) not null,
 elocation varchar(150) ,
 FOREIGN KEY (eid) REFERENCES event(event_id));
 

insert into USER values
 ('20400000',"John","Smith",'1965-01-09','M',"john_smith@email.com",'0500000000'),
 ('20400001',"Fatima","Alali",'1998-04-16','F',"Fatima_ali@email.com",'0547163881'),
 ('20400011',"Abdullah","AlShahrani",'1984-11-27','M',"Adbulla_Alsh@email.com",'0543401638'),
 ('20400111',"James","Borg",'1977-03-12','M',"james_borg@email.com",'0501284729'),
 ('20401111',"Mariam","AlSalim",'2000-02-15','F',"mariam_alsalim@email.com",'0502615373'),
 ('20411111',"Omar","AlQahatani",'1994-07-03','M',"omar_alqahtani@email.com",'0558583520'),
 ('20411112',"Ahmed","Alessa",'2001-08-21','M',"ahmed_alessa@email.com",'0501274628'),
 ('20411122',"Noora","AlOtaibi",'2002-10-31','F',"noora_alotaibi@email.com",'0561274219'),
 ('20411222',"May","Walters",'2004-12-14','F',"mat_walters@email.com",'0595123155'),
 ('20412222',"Emma","Brown",'1997-03-07','F',"emmam_brown@e3mail.com",'0567234424'),
 ('20422222',"Jill","Davis",'2001-06-20','M',"jill_davis@email.com",'0539736112'),
 ('20412223',"Jane","Smith",'1980-09-10','F',"jane_smith@email.com",'0507282363'),
 ('20412233',"Shatha","AlKhaldi",'1972-10-10','F',"shatha_alkhaldi@email.com",'0501222222'),
 ('20412333',"Hiba","AlHarbi",'2002-02-24','F',"hiba_alharbi@email.com",'0558271632'),
 ('20433333',"Mohammed","AlNaser",'2004-04-28','M',"mohammed_alnaser@email.com",'0540126715'),
 ('20433334',"Susan","Wilson",'2003-12-01','F',"susan_wilson@email.com",'0533455633'),
 ('20433344',"Fahad","AlDossary",'1998-05-22','M',"fahad_aldossary@email.com",'0556712986'),
 ('20433444',"Saad","AlShehri",'1992-10-23','M',"saad_alshehri@email.com",'0538345280'),
 ('20434444',"Cole","Anderson",'1995-11-11','M',"cole_anderson@email.com",'0507122930'),
 ('20444444',"Reem","AlShamrani",'2000-07-26','F',"reem_alshamrani@email.com",'0567882332'),
 ('20444445',"Salman","AlGhamdi",'1990-04-15','M',"salman_alghamdi@email.com",'0551238364');
  

 insert into event values
  ( '40100001' , 'the saudi cup' , 'sports' ,'2022-01-23 18:00:00' , '2022-01-25 23:00:00' ),
  ( '40100002' , 'Explore Ithra' , 'Culture & Visual Arts' ,'2022-02-01 17:00:00' , '2022-02-28 22:00:00' ),
  ( '40100003' , 'Oasis' , 'dining' , '2022-03-01 18:00:00' , '2022-03-28 00:30:00' ),
  ( '40100004' , 'Combat Field' , 'sports' ,'2022-01-01 15:00:00' , '2022-03-1 15:00:00' ),
  ( '40100005' , 'Winter Wonderland' , 'Themed Attractions' ,'2022-01-01 14:00:00' , '2022-03-31 22:00:00' ),
  ( '40100006' , 'Concert at Maraya' , 'Show & Performance Art' ,'2022-04-14 17:00:00' , '2022-04-30 23:00:00'),
  ( '40100007' , 'AlUla Skies' , 'Sightseeing' ,'2022-02-27 13:00:00' , '2022-03-13 15:00:00'),
  ( '40100008' , 'Riyadh Front' , 'Shopping' ,'2022-02-1 13:00:00' , '2022-02-28 20:00:00' ),
  ( '40100009' , 'diriyah season' , 'sports' ,'2022-10-20 15:00:00' , '2022-12-20 01:00:00'),
  ( '40100010' , 'Janadriyah Festival' , 'Culture &  Visual Arts' ,'2022-10-10 12:00:00' , '2022-10-20 20:00:00' ),
  ( '40100011' , 'Souq Okaz' , 'Culture &  Visual Arts' ,'2022-10-01 12:00:00' , '2022-10-09 20:00:00' ),
  ( '40100012' , 'Riyadh Book Fair' , 'Exhibitions' ,  '2022-07-14 17:00:00' , '2022-04-18 22:00:00' ),
  ( '40100013' , 'Biking Tour' , 'soprts' ,'2022-12-10 16:00:00' , '2022-12-10 23:00:00' ), 
  ( '40100014' , 'Farmer and Cooking Souq' , 'Dining' ,'2022-11-05 12:00:00' , '2022-12-15 17:00:00' ),
  ( '40100015' , 'Winter at Tantora' , 'Show & Performance Art' ,'2022-01-01 16:00:00' , '2022-02-12 23:00:00'),
  ( '40100016' , 'Boulevard Riyadh City' , 'Themed Attractions' ,'2022-01-1 18:00:00' , '2022-04-01 00:00:00'), 
  ( '40100017' , 'Symphony Under the Stars' , 'Show & Performance Art' ,'2022-03-11 16:00:00' , '2022-03-11 23:00:00' ),
  ( '40100018' , 'Saudi Coffee Exhibition' , 'Exhibitions' ,'2022-11-04 18:00:00' , '2022-11-08 20:00:00' ),
  ( '40100019' , 'International Cybersecurity Forum' , 'IT & Technology' ,'2022-06-05 18:00:00' , '2022-06-08 22:00:00'),
  ( '40100020' , 'The Perfume Expo' , 'Exhibition' ,'2022-10-25 18:00:00' , '2022-12-29 23:00:00' );
  
insert into TICKET values 
("2022-06-08",255.00,'30300000',"20",'40100019','20400000'),
("2022-06-08",255.00,'30300001',"57",'40100019','20400001'),
("2022-06-08",255.00,'30300002',"12",'40100019','20400011'),
("2022-12-29",488.25,'30300003',"105",'40100020','20401111'),
("2022-12-29",488.25,'30300004',"17",'40100020','20400001'),
("2022-12-29",488.25,'30300005',"33",'40100020','20411122'), 
("2022-11-08",70.00,'30300006',"10",'40100018','20433333'),
("2022-11-08",70.00,'30300007',"57",'40100018','20400000'),
("2022-11-08",70.00,'30300008',"04",'40100018','20434444'),
("2022-11-08",70.00,'30300009',"90",'40100018','20400001'),
("2022-11-08",70.00,'30300010',"45",'40100018','20444444'),
("2022-03-11",330.75,'30300011',"28",'40100017','20411222'),
("2022-03-11",330.75,'30300012',"44",'40100017','20433333'),
("2022-03-11",330.75,'30300013',"18",'40100017','20412233'),
("2022-01-25",630.00,'30300014',"06",'40100001','20412223'),
("2022-02-28",552.25,'30300015',"05",'40100002','20422222'),
("2022-03-28",200.00,'30300016',"17",'40100003','20412222'),
("2022-03-1",128.00,'30300017',"39",'40100004','20411222'),
("2022-03-31",762.25,'30300018',"24",'40100005','20411112'),
("2022-04-30",95.25,'30300019',"26",'40100006','20411111'),
("2022-03-13",266.75,'30300020',"21",'40100007','20400001'), 
("2022-02-28",66.00,'30300021',"89",'40100008','20422222'),
("2022-12-20",198.20,'30300022',"104",'40100009','20433333'),
("2022-10-20",777.90,'30300023',"290",'40100010','20400001'),
("2022-10-09",550.00,'30300024',"13",'40100011','20444445'),
("2022-04-18",330.20,'30300025',"08",'40100012','20433344'),
("2022-12-10",168.00,'30300026',"12",'40100013','20412333'),
("2022-12-15",202.78,'30300027',"356",'40100014','20411111'),
("2022-02-12",630.20,'30300028',"235",'40100015','20411122'),
("2022-04-01",60.20,'30300029',"52",'40100016','20412222'),
("2022-01-25",900.00,'30300030',"678",'40100001','20444444'),
("2022-02-28",800.00,'30300031',"123",'40100002','20411222');

    
INSERT INTO ORGANIZERS VALUES 
     ('39957968', 'Saad' , 'Zaher', 'Salama', '0565067211')
	,('39914474', 'Basher' , 'Ali', 'Ghazi', '0561114889')
	,('39959962', 'Basel' , 'Sharif', 'Alharbi', '0559255991')
    ,('39936596', 'Akram ' , 'Mohammad', 'Alrashed', '0501726511')
    ,('39946256', 'Iffah' , 'Malik', 'Alkhaldi', '0550067409')
    ,('39929346', 'Aman' , 'Othman', 'AlAsiri', '0558322779')
    ,('39915655', 'Laila' , 'Zaher', 'AlShahrani', '0509815177')
    ,('39963231', 'Razan' , 'Yazid', 'AlQahtani', '0555899844')
    ,('39985512', 'Zaniah' , 'Rashed', 'AlShehri', '0556747830')
    ,('39980856', 'Soha' , 'Khalaf', 'Mohammadi', '0528326027')
    ,('39935693', 'Fahad' , 'Tariq', 'AlQahtani', '0524668121')
    ,('39932066', 'Jack' , 'Eric', 'Elliott', '0564411340')
    ,('39941020', 'Arnold' , 'Robert', 'Gilbert', '0560030205')
    ,('39961336', 'Emily ' , 'Joey', 'Walters', '0547356008')
    ,('39961880', 'Carmen' , 'Tyler', 'Oliver', '0538903330')
    ,('39976778', 'Lara' , 'Peter', 'Brown', '0537120736')
    ,('39921761', 'Hiba' , 'Amen', 'ALDawood', '0568059240')
    ,('39982261', 'Amir' , 'Naseem', 'AlSalim', '0560139473')
    ,('39911939', 'Abdullah' , 'Husain', 'alMansour', '0565332956')
    ,('39909986', 'Rama' , 'Tariq', 'Almaliki', '0586603007');
    
INSERT INTO PERFORMERS VALUES 
	 ('31135415', 'Saad AlDossary' , 'Cultural Seminar ', '39914474')
	,('31161882', 'Nawal El-Kuwaitia' , 'singer', '39936596')
    ,('31122943', 'Mery Acevedo' , 'professional ice skating trainer', '39929346')
	,('31155532', 'Future' , 'singer', '39959962')
    ,('31194422', 'Muhammad Al-Ghazi' , 'poetry evening', '39985512')
    ,('31151021', 'BLACK HAT' , 'cybersecurity professionals group trainer', '39932066')
    ,('31150174', 'Abdul Samad Al-Qurashi' , ' seminars about producer of Arabian Perfumes', '39959962')
    ,('31101405', 'Rowel Guevarra' , 'executive chef for edafat+', '39961880')
    ,('31148610', 'Basher Abdullah' , 'tourist camping Guide', '39963231');

insert into sponsor values
  ( '40100001' ,'RIYAD BANK', 250000 ),
  ( '40100002' ,'OCCASION' , 135000 ),
  ( '40100002' ,'Aramco' , 180000 ),
  ( '40100004' ,'LIKECARD' , 100000  ),
  ( '40100005' ,'hungerstation' , 160000),
  ( '40100005' ,'ARAMEX' , 90000),
  ( '40100006' , 'SELA' , 70000 ),
  ( '40100006' , 'Saudia Airlines' , 120000 ),
  ( '40100008' , 'STC PAY' , 275000 ),
  ( '40100009' , 'Ministry of Tourism' ,140000  ),
  ( '40100013' , 'PARKYY' , '90000'),
  ( '40100016' , 'The Chefz' , 100000),
  ( '40100018' , 'COFE' , 880000 ),
  ( '40100019' ,'NETWORK INTERNATIONAL ARABIA', 200000 ),
  ( '40100020' , 'Abdulsamad Al Qurashi' , 160000);
  

insert into ATTEND values
('20411222','40100002'),
('20444444','40100001'),
('20412222','40100016'),
('20411122','40100015'),
('20411111','40100014'),
('20412333','40100013'),
('20433344','40100012'),
('20444445','40100011'),
('20400001','40100010'),
('20433333','40100009'),
('20422222','40100008'),
('20412233','40100017'),
('20433333','40100017'),
('20411222','40100017'),
('20400001','40100020'),
('20401111','40100020'),
('20400001','40100019'),
('20400000','40100019'),
('20412223','40100001'),
('20422222','40100002');

insert into Organize values 
('40100002','39909986',30.5),
('40100019','39915655',10.6),
('40100008','39963231',20.0),
('40100012','39929346',5.0),
('40100001','39982261',25.5),
('40100001','39976778',4.0),
('40100020','39976778',12.0),
('40100010','39936596',35.0);

insert into event_location values
   ('40100001' , 'Riyadh'  ),
  ( '40100002' , 'Dhahran' ),
  ( '40100003' , 'Riyadh' ),
  ( '40100004' , 'Riyadh' ),
  ( '40100005' , 'Riyadh' ),
  ( '40100006' , 'AlUla' ),
  ( '40100007' , 'AlUla ' ),
  ( '40100008' , 'Riyadh' ),
  ( '40100009' , 'Riyadh' ),
  ( '40100010' , 'Riyadh' ),
  ( '40100011' , 'Taif' ),
  ( '40100012' , 'Riyadh'  ),
  ( '40100013' , 'Jeddah'),
  ( '40100014' , 'Dhahran' ),
  ( '40100015' , 'AlUla' ),
  ( '40100016' , 'Riyadh' ),
  ( '40100017' , 'AlUla' ),
  ( '40100018' , 'Riyadh' ),
  ( '40100019' , 'Dhahran' ),
  ( '40100020' , 'Riyadh' );
  
