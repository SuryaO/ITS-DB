/*

Project Name: Information Technology Services database
Database: Microsoft Access Database
Author: Surya

Purpose: Creating Normalized tables

*/



-- Buildings Table
Create table Buildings
(
BuildingID int Primary Key,
BuildingName varchar(50)
)





--Classrooms Table
Create table Classrooms
(
ClassroomID int Primary Key,
CLassroomNumber varchar(50),
BuildingID int,
constraint  fk_classroomId foreign key (BuildingId) references Buildings(BuildingID)  
)






--Equipment Table
Create table Equipment
(
EquipmentID int Primary Key,
EquipmentName varchar(100),
Brand varchar(100),
Model varchar(100),
PTag varchar(100),
serialNumber varchar(100),
DatePurchased date,
ClassRoomID int,
LabID int,
Constraint  fk_LabID foreign key (LabId) references Labs(LabID1),
Constraint  fk_EQClassRoomID foreign key (ClassRoomId) references ClassRooms(ClassRoomID)

)






--Labs Table
Create Table Labs
(
LabID int Primary key,
LabNumber varchar(50),
BuildingID int,
constraint  fk_LabID foreign key (BuildingId) references Buildings(BuildingID)  
)







--Softwares Table
Create table Softwares
(
SoftwareId int primary key,
SoftwareDescription varchar(200)
)






--StandardSoftwares Table
Create table StandardSoftwares
(
SoftwareId int primary key,
SoftwareList varchar(200)

)





--Users Table
Create table Users
(
UserId autoincrement,
UserName varchar(20),
Password varchar(20),
constraint pk_UserId  Primary key(UserId)

)






--Workstation Softwares Table
Create table WKSoftwares
(
ID int primary key,
WorkstationId int,
SoftwareId int,
constraint FK_WorkstationId foreign key(workstationId) references Workstations(StationId),
constraint FK_SoftwareId foreign key(SoftwareId) references Softwares(SoftwareId)


)







-- workstations table
Create Table WorkStations
(
StationID int Primary Key,
PCName varchar(100),
PCModel varchar(100),
PCPTag varchar(100),
PCSerialNo varchar(100),
DatePurchased date,
WarrantyExpires Date,
StandardSoftwareID int,
SoftwareAddOns varchar(100),
LabID int,
ClassRoomID int,
StationType varchar(50),
Constraint  fk_WKLabID foreign key (LabID) references Labs(LabID) , 
Constraint  fk_WSClassrooomID foreign key (ClassRoomID) references Classrooms(ClassroomID),
Constraint fk_StandardSoftwareId foreign key (StandardSoftwareID) references StandardSoftwares(SoftwareId)
)





