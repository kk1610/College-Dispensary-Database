
-- Create tables
create table bus
(id varchar(5),
name varchar(20),
primary key (id));

create table station
(stcode varchar(5),
name varchar(20),
primary key (stcode));

create table track
(stcode1 varchar(5),
stcode2 varchar(5),
distance integer,
check (distance > 0),
primary key (stcode1, stcode2));


create table bushalts
(id varchar(5),
seqno integer ,
stcode varchar(10),
timein varchar(5),
timeout varchar(5),
primary key (id, seqno),
foreign key (stcode) references station(stcode));

-- Insert data with constraints
insert into bus values ('KP11' ,'ST-KYN');
insert into bus values ('KP11L' ,'ST-KYN_LOCAL');
insert into bus values ('T129' ,'ST-TNA_LOCAL');
insert into bus values ('A63' ,'ST-DL_LOCAL');
insert into bus values ('K101' ,'ST-KYN_LOCAL');
insert into bus values ('N27' ,'ST-TNA_LOCAL');
insert into bus values ('S33' ,'ST-KGR_LOCAL');
insert into bus values ('A65' ,'ST-AMR_LOCAL');

insert into station values ('ST' ,'MUMBAI');
insert into station values ('BYC' ,'BYCULLA');
insert into station values ('DR' ,'DADAR');
insert into station values ('KRL' ,'KURLA');
insert into station values ('GPR' ,'GHATKOPAR');
insert into station values ('TNA' ,'THANE');
insert into station values ('DL' ,'DOMBIVALI');
insert into station values ('AMR' , 'AMBARNATH');
insert into station values ('KYN' ,'KALYAN');
insert into station values ('KSR' ,'KASARA');

insert into track values ('ST' ,'BYC', 5);
insert into track values ('ST' ,'DR', 9);
insert into track values ('ST' ,'KRL', 16);
insert into track values ('ST' ,'GPR', 20);
insert into track values ('ST' ,'TNA', 34);
insert into track values ('ST' ,'DL', 49);
insert into track values ('ST' ,'KYN', 54);
insert into track values ('ST' ,'KSR', 77);
insert into track values ('ST' ,'AMR', 65);
insert into track values ('BYC' ,'DR', 4);
insert into track values ('BYC' ,'KRL', 11);
insert into track values ('GPR' ,'TNA', 14);
insert into track values ('DR' ,'TNA', 25);
insert into track values ('KRL' ,'KYN', 38);
insert into track values ('TNA' ,'KYN', 20);
insert into track values ('TNA' ,'KSR', 43);

insert into bushalts values ('KP11' , 0 , 'ST' , NULL, '20.23');
insert into bushalts values ('KP11' , 1 , 'BYC' , '20.31', '20.32');
insert into bushalts values ('KP11' , 2 , 'DR' , '20.41', '20.42');
insert into bushalts values ('KP11' , 3 , 'GPR' , '20.52', '20.53');
insert into bushalts values ('KP11' , 4 , 'GPR' , '20.52', '20.53');
insert into bushalts values ('KP11' , 5 , 'DR' , '20.41', '20.42');
insert into bushalts values ('KP11' , 6 , 'GPR' , '20.58', '20.59');
insert into bushalts values ('KP11' , 7 , 'TNA' , '21.21', '21.22');
insert into bushalts values ('KP11' , 8 , 'DL' , '21.45', '21.46');
insert into bushalts values ('KP11' , 9 , 'KYN' , '21.54', NULL);
insert into bushalts values ('A65' , 0 , 'ST' , NULL , '20.52');
insert into bushalts values ('A65' , 1 , 'BYC' , '21.00' , '21.01');
insert into bushalts values ('A65' , 2 , 'DR' , '21.10' , '21.11');
insert into bushalts values ('A65' , 3 , 'KRL' , '21.22' , '21.23');
insert into bushalts values ('A65' , 4 , 'GPR' , '21.28' , '21.29');
insert into bushalts values ('A65' , 5 , 'TNA' , '21.49' , '21.50');
insert into bushalts values ('A65' , 6 , 'DL' , '22.13' , '22.14');
insert into bushalts values ('A65' , 7 , 'KYN' , '22.22' , '22.23');
insert into bushalts values ('A65' , 8 , 'AMR' , '22.36' , NULL);
SELECT t1.stcode1 AS source, t1.stcode2 AS destination, SUM(t2.distance) AS
total_distance
FROM track t1
JOIN track t2 ON t1.stcode2 = t2.stcode1
WHERE t1.stcode1 = 'ST' AND t2.stcode2 = 'TNA'
GROUP BY t1.stcode1, t1.stcode2;
select stcode1,stcode2 from track where distance>15;
SELECT stcode1, stcode2, SUM(distance) AS total_distance
FROM track
GROUP BY stcode1, stcode2;
select b.name as name
FROM bus as b 
inner JOIN bushalts as bh  ON b.id = bh.id
WHERE bh.stcode = 'TNA'
ORDER BY b.name;
select *
from bus as b  inner join bushalts as bh on b.id=bh.id where b.name='ST-DL
-LOCAL';

