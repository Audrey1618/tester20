create database baithidauvao;
use baithidauvao;

create table Department (
	DepartmentID int auto_increment not null,
    DepartmentName varchar(50),
    primary key (DepartmentID)
);

create table Position (
	PositionID int auto_increment not null,
    PositionName enum ('Dev', 'Test', 'Scrum Master', 'PM'),
    primary key (PositionID)
);

create table Account (
	AccountID int auto_increment not null,
    Email varchar(50),
    Username varchar(50),
    FullName varchar(50),
    DepartmentID int,
    PositionID int,
    CreateDate timestamp default current_timestamp,
    primary key (AccountID),
    foreign key (DepartmentID) references Department (DepartmentID),
    foreign key (PositionID) references Position (PositionID)
);

create table `Group` (
	GroupID int auto_increment not null,
    GroupName varchar(50),
    CreatorID int,
    CreateDate timestamp default current_timestamp,
    primary key (GroupID)
   ); 
alter table `Group`
	add foreign key (CreatorID) references Account(AccountID);
   
create table `GroupAccount` (
	GroupID int,
    AccountID int,
    JoinDate timestamp default current_timestamp,
    foreign key (GroupID) references `Group`(GroupID),
    foreign key (AccountID) references Account(AccountID)
);

create table TypeQuestion (
	TypeID int auto_increment not null,
    TypeName enum('Essay', 'Multiple-Choice'),
    primary key (TypeID)
);

create table CategoryQuestion (
	CategoryID int auto_increment not null,
	CategoryName enum('Java', '.NET', 'SQL', 'Postman', 'Ruby', 'Other'),
    primary key (CategoryID)
);

create table Question (
	QuestionID int auto_increment not null,
    Content varchar(100),
    CategoryID int,
    TypeID int,
    CreatorID int,
	CreateDate timestamp default current_timestamp,
    primary key (QuestionID),
    foreign key (CategoryID) references CategoryQuestion (CategoryID),
    foreign key (TypeID) references TypeQuestion (TypeID),
    foreign key (CreatorID) references Account (AccountID)
);

create table Answer (
	AnswerID int auto_increment not null,
    Content varchar(100),
    QuestionID int,
    isCorrect enum('Đúng', 'Sai'),
    primary key (AnswerID),
    foreign key (QuestionID) references Question (QuestionID)
);

create table Exam (
	ExamID int auto_increment not null,
    `Code` int,
    Title varchar(50),
    CategoryID int,
    Duration int,
    CreatorID int,
    CreateDate timestamp default current_timestamp,
    primary key (ExamID),
    foreign key (CategoryID) references CategoryQuestion (CategoryID),
    foreign key (CreatorID) references `Account`(AccountID)
);

create table ExamQuestion (
	ExamID int,
    QuestionID int,
    foreign key (ExamID) references Exam (ExamID),
    foreign key (QuestionID) references Question (QuestionID)
);
    