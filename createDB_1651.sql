create table members1(
member_id  int not null,
f_name varchar(20) not null,
l_name varchar(20) not null,
DOB date not null,
type varchar(20) not null,
personal_phone number(10) not null,
work_phone number(10),
building number(4),
street varchar(10),
city varchar(15) not null,
constraint member_id_pk primary key(member_id));

alter table members1
add   brranch_number number REFERENCES branchee(  brranch_number);

alter table members1
add Finee_number int references finee ( Finee_number);

create table branchee (
        brranch_number number NOT NULL,
        branch_name VARCHAR(20) NOT NULL,
        location VARCHAR(20) NOT NULL,
    personall_phone number(10),
       work_phonee number(10),
        constraint brranch_number_pk PRIMARY KEY (brranch_number));

alter table branchee
add R_number number(5) references Room ( R_number);

 CREATE TABLE finee(
amount_fine INT not null,
status VARCHAR(20),
due_date date not null,
finee_number INT not null,
dascripionn VARCHAR(50) not null ,
constraint finee_number_pk PRIMARY KEY (finee_number));

 CREATE TABLE classificationss (
        cla_id int NOT NULL,
        cla_name VARCHAR(20) NOT NULL,
        constraint cla_id_pk PRIMARY KEY (cla_id) );
        
          alter table classificationss
        add items_number char(10) references items(items_number);
        
        create table items(
        items_number char(10) not null,
        type varchar(20) not null,
        publisher varchar (20) not null,
        description varchar(50),
        constraint items_number_pk primary key (items_number));
        
         create table journals(
        id_num int not null,
        status varchar(15) not null,
        location varchar (50) not null,
        title varchar(15),
        constraint id_num_pk primary key (id_num));
        
         alter table journals 
     add r_id int references source (r_id);
     
         create table source(
    r_id int not null,
    type  varchar(20) not null,
    name varchar(20) not null,
    status varchar(15) not null,
    constraint r_id_pk primary key (r_id));
    
    alter table source
add      brranch_number number  REFERENCES branchee ( brranch_number);
    
    create table book(
book_id number not null,
publisher_id char(9) not null,
status varchar(20) not null,
note varchar(30) not null,
author_id char(10) not null,
type varchar(15) not null,
resource_id int not null,
name varchar(11) not null,
constraint book_id_fk primary key (book_id));

alter table book
add   cla_id int  references classificationss(cla_id);

alter table book
add r_id int references source (r_id);

create table privilege(
p_number int not null,
p_name varchar(20) not null,
loan_period varchar(20),
borrow_max int,
renewal_max int,
constraint p_number_pk  primary key(p_number));
 
 
CREATE TABLE staff (
id_staff int  ,
name_staff varchar(10),
salary number(5),
personal_phone number(10) not null,
work_phone number(10),
email varchar(20),
CONSTRAINT id_staff_pk primary key(id_staff)
); 
ALTER table staff 
add  p_number INT  REFERENCES  privilege (p_number);

alter table staff 
add  brranch_number number REFERENCES  branchee ( brranch_number ); 

create table Room(
R_number number(5),
R_location varchar(50),
 brach_number NUMBER NOT NULL,
R_type varchar(40),
statuse varchar(30),
d_start VARCHAR(10),
d_end VARCHAR(10),
CONSTRAINT Rnu PRIMARY key (R_number)
);
   
  CREATE TABLE shortLoan(
Record_R INT ,
time_R VARCHAR(20) ,
status VARCHAR(30),
CONSTRAINT Record_R_pk PRIMARY KEY (Record_R));

  alter table Room 
     add Record_R INT references shortLoan(Record_R);

CREATE TABLE newLoan1(
Number_loan INT not null,
dueDate date ,
Start_loan DATE not null,
end_loan Date not null,
typeLoan varchar(30)  ,
CONSTRAINT Number_loane_pk primary key (Number_loan));

alter table newLoan1 
     add  brranch_number  number references branchee (brranch_number);
     
     CREATE TABLE circulation_service(
order_num number(10),
order_detalis varchar(30),
CONSTRAINT order_num_pk PRIMARY key (order_num));

alter table circulation_service
add Number_loan INT references newLoan1 (Number_loan);

alter table circulation_service
add p_number int references  privilege (p_number);
