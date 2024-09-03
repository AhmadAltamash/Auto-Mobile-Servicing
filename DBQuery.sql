create table plans(
	Pid serial primary key,
	Plan_name varchar(100) not null,
	Plan_charge int not null,
	Valid_From_Date date,
	Valid_To_Date date,
	Discount int,
	Total int);

create table Admin_Rgstr(
	Admin_id serial primary key,
	Full_Name varchar(30) not null,
	email varchar(30),
	Address varchar(100),
	Pincode int not null,
	mobile varchar(13),
	password varchar(20)
);
insert into Admin_Rgstr(Full_Name,email,Address,Pincode,mobile,password) values('Altamash','altamash@gmail.com','Patna','800010','7488438343','123');
select * from register;
select * from services_history;
select * from Admin_Rgstr; 
select * from plans where  1 limit;
insert into services values('Denting','1200.00','948834211','Patna');
