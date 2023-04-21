create schema company character set utf8mb4 collate utf8mb4_polish_ci;
-- 1 
create table pracownik (
id int primary key auto_increment,
imię varchar(30) not null,
nazwisko varchar(30) not null,
wypłata double not null,
data_urodzenia date not null,
stanowisko varchar(30) not null
);
-- 2 
insert into pracownik
 (imię, nazwisko, wypłata, data_urodzenia, stanowisko)
 values
 ('Anna', 'Burnopka', 5000, '1990-06-03', 'specjalista ds. ubezpieczeń'),
 ('Łukasz', 'Kieł', 4000, '1988-10-18', 'analityk danych'),
 ('Bartłomiej', 'Mlecz', 4500, '1999-09-03', 'specjalista ds. HR'),
 ('Jolanta', 'Drzewo', 6250, '1966-05-20', 'Lekarz'),
 ('Sylwester', 'Dzwig', 5750, '1967-08-23', 'Księgowy'),
 ('Adam', 'Koprusin', 4200, '1992-12-26', 'Inżynier oprogramowania');
-- 3 
select * from pracownik order by nazwisko;
-- 4  
select * from pracownik where stanowisko = 'Lekarz';
-- 5 
SELECT * FROM pracownik
WHERE (YEAR(CURDATE()) - EXTRACT(YEAR FROM data_urodzenia)) >= 30;
-- 6
update pracownik set wypłata = wypłata * 1.1 where stanowisko = 'Księgowy';
-- 7
select * from pracownik where data_urodzenia = (select max(data_urodzenia) from pracownik);
-- 8 
 drop table pracownik;
 -- 9 
 create table stanowisko (
 stan_id int primary key auto_increment,
 nazwa varchar(30) not null,
 opis varchar(100) not null,
 wypłata double not null
 );
-- 10
 create table adres (
 ad_id int primary key auto_increment,
 ulica_nr_domu varchar(30) not null,
 kod_pocztowy varchar(10) not null,
 miejscowość varchar(30) not null
 ); 
 -- 11
  create table pracownik (
 id int primary key auto_increment,
 imię varchar(30) not null,
 nazwisko varchar(30) not null,
 stan_id int,
 ad_id int,
 foreign key (stan_id) references stanowisko(stan_id),
 foreign key (ad_id) references adres(ad_id)
 );
-- 12
 insert into adres
 (ulica_nr_domu, kod_pocztowy, miejscowość)
 values
 ('Kościuszki 45', '40-850', 'Katowice'),
 ('Mickiewicza 13', '40-400', 'Wrocław'),
 ('Butelkowa 7', '30-150', 'Gdańsk'
 );
 insert into stanowisko
 (nazwa, opis, wypłata)
 values
 ('analityk danych', 'analiza biznesowa danych dotyczacych firmy', 5000),
 ('specjalista ds. ubezpieczeń', 'odpowiedzialność za ubezpieczenie pracowników', 6000),
 ('lekarz', 'odpowiedzialność za stan zdrowia pracowników', 10000
 );
 select*from stanowisko;
  insert into pracownik
 (imię, nazwisko, stan_id, ad_id)
 values
 ('Anna', 'Burnopka', 10, 2),
 ('Łukasz', 'Kieł', 12, 1),
 ('Bartłomiej', 'Kalosz', 11, 3
 );
 -- 13 
 select id, imię, nazwisko, ulica_nr_domu, kod_pocztowy, miejscowość, nazwa, opis, wypłata from pracownik 
 join stanowisko on pracownik.stan_id = stanowisko.stan_id
 join adres on pracownik.ad_id = adres.ad_id;
 -- 14
 select sum(wypłata) from pracownik
 join stanowisko on pracownik.stan_id = stanowisko.stan_id;
 -- 15
 select * from pracownik
 join adres on pracownik.ad_id = adres.ad_id
 where kod_pocztowy = '40-850';

 