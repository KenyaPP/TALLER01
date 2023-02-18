create database Museometropolitano

use MuseoMetropolitano

create table pieza(
codigo_pieza varchar(5) primary key not null,
nombre_piezas char(50)
)

create table exposicion(
codigo_pieza varchar(5) primary key not null,
id_pintor varchar(5),
precio decimal(7,2),
)

create table pintores(
id_pintor varchar(5) primary key not null,
nombre_pintor char(50)
)

ALTER TABLE exposicion add constraint fk_pieza_exposicion
foreign key (codigo_pieza) references pieza(codigo_pieza)

ALTER TABLE exposicion add constraint fk_pieza_pintores
foreign key (id_pintor) references pintores(id_pintor)

insert into pieza values ('PA001', 'La Ultima Cena')
select* from pieza
insert into pieza values ('PA002', 'La Gioconda')
select* from pieza
insert into pieza values ('PA003', 'La Noche Estrellada')
select* from pieza
insert into pieza values ('PA004', 'Las tres Gracias')
select* from pieza
insert into pieza values ('PA005', 'El Grito')
select* from pieza
insert into pieza values ('PA006', 'El Guernica')
select* from pieza
insert into pieza values ('PA007', 'La Creacion de Adan')
select* from pieza
insert into pieza values ('PA008', 'Los Gorasoles')
select* from pieza
insert into pieza values ('PA009', 'La Tentacion de San Antonio')
select* from pieza
insert into pieza values ('PA010', 'Los Fusilamientos del 3 de mayo')
select* from pieza
insert into pieza values ('PA011', 'El Taller de BD')
select* from pieza


insert into exposicion values ('PA001', 'NA007', '12000.80')
select* from exposicion
insert into exposicion values ('PA002', 'NA007', '13500.70')
select* from exposicion
insert into exposicion values ('PA003', 'NA003', '18000.13')
select* from exposicion
insert into exposicion values ('PA004', 'NA006', '25000.00')
select* from exposicion
insert into exposicion values ('PA005', 'NA003', '30879.00')
select* from exposicion
insert into exposicion values ('PA006', 'NA005', '25000.25')
select* from exposicion
insert into exposicion values ('PA007', 'NA004', '50000.75')
select* from exposicion
insert into exposicion values ('PA008', 'NA003', '10000.80')
select* from exposicion
insert into exposicion values ('PA009', 'NA002', '13000.10') 
select* from exposicion
insert into exposicion values ('PA010', 'NA001', '9000.05')
select* from exposicion
insert into exposicion values ('PA011', 'NA008', '9000.05')
select* from exposicion

insert into pintores values ('NA001', 'GOYA')
select* from pintores
insert into pintores values ('NA002', 'Dali')
select* from pintores
insert into pintores values ('NA003', 'Van Gogh')
select* from pintores
insert into pintores values ('NA004', 'Miguel Angel')
select* from pintores
insert into pintores values ('NA005', 'Pablo Picasso')
select* from pintores
insert into pintores values ('NA006', 'Rubens')
select* from pintores
insert into pintores values ('NA007', 'Da Vinci')
select* from pintores
insert into pintores values ('NA008', 'Kevin')
select* from pintores



----1. Obtener los nombres de todas las piezas de arte----

select nombre_piezas as [Nombre de las piezas] from Pieza

----2. Obtener todos los datos de todos los pintores.---

select * from pintores

----3. Obtener el precio medio de los cuadros expuestos (dos decimales) ----

select ROUND( (SUM(precio)/11), 2) as [Promedio de los precios] from exposicion

----4. Obtener el nombre del pintor que hizo la pieza “El grito”---

select nombre_pintor as [Autor de El Grito] from pintores where id_pintor = (select id_pintor from exposicion where codigo_pieza = 'PA005')

----5. Obtener los nombres de las piezas expuestas del pintor Van Gogh----

select codigo_pieza from exposicion where id_pintor = 'NA003'
select top 2 nombre_piezas [De Vangho]from Pieza where codigo_pieza in ('PA003','PA005', 'PA008')

----6. Obtener el nombre de la pieza más cara de toda la exposición.----

select MAX(precio) as [Obra mas cara] from exposicion

---7. Obtener el nombre de los 3 pintores que suministran las piezas más caras, indicando el nombre de la pieza y el precio de la obra de arte.---

select nombre_pintor from pintores where id_pintor in (select top 3 id_pintor from exposicion order by precio DESC)

---8. Nombre de los pintores en exposición y su cantidad de cuadros respectivos. ---

----9. Nombre de los cuadros de los pintores Van Gogh y Da Vinci.---

----10. Aumentar los precios de las piezas en una unidad.-------11. Sustituir los datos del pintor Van Gogh por el nombre “Vincent Van Gogh”.---

----12. Sustituir los datos del pintor Da Vinci por el nombre “Leonardo Da Vinci”.---


----13. Hacer constar en la base de datos que el artista Kevin ya no va a exponer ningún
--cuadro en nuestro Museo. (Aunque el pintor en si va a seguir en nuestra base de datos).---


-----14. Eliminar el documento del pintor con menos cantidad de obras expuestas.---
