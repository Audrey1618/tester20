create database tester20;
use tester20; 

create table customer (
	customer_name varchar(100),
    phone varchar(11),
    age int,
    address varchar(500)
	)
    
create table Trainee ( -- tạo table
	TraineeID int primary key auto_increment, -- khai báo primary key: độc nhất:, auto_increment: tự tăng
    FullName varchar (100),
    BirthDate date,
    Gender enum('male','female','unknown'), -- chọn 1 trong 3 option
    EtIQ int,
    EtGmath int,
    EtEnglish int,
    TrainingClass varchar(100),
    EvaluationNotes varchar(100),
    constraint CHECK_EtIQ CHECK (EtIQ > 0 AND EtIQ < 20),  -- điều kiện
    constraint CHECK_EtGmath CHECK (EtGmath > 0 and EtGmath < 50),
	constraint CHECK_EtEnglish CHECK (EtEnglish > 0 and EtEnglish < 50)
)

insert into Trainee(FullName, BirthDate, Gender, EtIQ, EtGmath, EtEnglish, TrainingClass, EvaluationNotes)
value ('Nguyen Van A', '1999-10-20', 'male', 10, 10, 10, 'TESTER20', 'TEST');

create table logtransaction (
logId int primary key auto_increment,
logDate timestamp current_timestamp();
);

insert into logtransaction () values ();

ALTER TABLE 'tester20'. 'trainee'

