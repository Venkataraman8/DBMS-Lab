USE MYSAMPLDB;
drop table Movie;
drop table Reviewer;
drop table rating;

 -- 1
 create table Movie(mID int, title varchar(100), year int, director varchar(100));
create table Reviewer(rID int, name varchar(100));
create table Rating(rID int, mID int, stars int, ratingDate date);
alter table Movie add primary key (mID);
-- alter table Movie drop primary key;
alter table Movie add primary key (title,year);
alter table Reviewer add primary key (rID);
alter table Rating change stars stars int NOT NULL;
alter table Rating change stars stars int NOT NULL check(stars in (1, 2, 3, 4, 5));
alter table Rating change ratingDate ratingDate date check(ratingData >=
"00-00-2000");
alter table Movie add constraint CHECK(YEAR>1900 AND CASE WHEN
DIRECTOR="STEVEN SPIELBERG" THEN YEAR<1990 WHEN
DIRECTOR="JAMES CAMERON" THEN YEAR>1990 END);
alter table Rating add constraint foreign key(rID) references Reviewer(rID);
alter table Rating add constraint foreign key(mID) references Movie(mID);
desc Movie;
desc Rating;
desc Reviewer;

-- 2
insert into Movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into Movie values(102, 'Star Wars', 1977, 'George Lucas');
insert into Movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into Movie values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into Movie values(105, 'Titanic', 1997, 'James Cameron');
insert into Movie values(106, 'Snow White', 1937, null);
insert into Movie values(107, 'Avatar', 2009, 'James Cameron');
insert into Movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');
insert into Reviewer values(201, 'Sarah Martinez');
insert into Reviewer values(202, 'Daniel Lewis');
insert into Reviewer values(203, 'Brittany Harris');
insert into Reviewer values(204, 'Mike Anderson');
insert into Reviewer values(205, 'Chris Jackson');
insert into Reviewer values(206, 'Elizabeth Thomas');
insert into Reviewer values(207, 'James Cameron');
insert into Reviewer values(208, 'Ashley White');
insert into Rating values(201, 101, 2, '2011-01-22');
insert into Rating values(201, 101, 4, '2011-01-27');
insert into Rating values(202, 106, 4, null);
insert into Rating values(203, 103, 2, '2011-01-20');
insert into Rating values(203, 108, 4, '2011-01-12');
insert into Rating values(203, 108, 2, '2011-01-30');
insert into Rating values(204, 101, 3, '2011-01-09');
insert into Rating values(205, 103, 3, '2011-01-27');
insert into Rating values(205, 104, 2, '2011-01-22');
insert into Rating values(205, 108, 4, null);
insert into Rating values(206, 107, 3, '2011-01-15');
insert into Rating values(206, 106, 5, '2011-01-19');
insert into Rating values(207, 107, 5, '2011-01-20');
insert into Rating values(208, 104, 3, '2011-01-02');
select * from Movie;
select * from Reviewer;
select * from Rating;


-- 3
insert into Reviewer values(209, null);


-- 4
insert into Rating values(201, 101, null, '2011-01-22');


-- 5
insert into Rating values(201, 101, 7, '2011-01-22');


-- 6
 insert into Rating values(201, 101, 7, '1999-01-22');


-- 7
insert into Movie values(1000, 'Titanic', 1889, 'James Cameron');


-- 8
insert into Rating values(226, 107, 3, '2011-01-15');


-- 9
insert into Rating values(206, 157, 3, '2011-01-15');


-- 10
alter table Rating drop foreign key rating_IBFK_1;