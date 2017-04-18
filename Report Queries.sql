/*
Project Name: Information Technology Services database
Database: Microsoft Access Database (2007-2016)
Author: Surya

SQL Queries to retrieve the data in reports based on parameters
*/


---Classrooms in Buildings View
SELECT	BuildingName,
		CLassroomNumber, 
		Description
FROM	classrooms AS C 
		INNER JOIN Buildings AS B ON C.buildingid=B.buildingid
WHERE	B.buildingname=[BuildingName:];






--Cls Equipment details in a building View
SELECT	Buildingname, 
		CLassroomNumber, 
		EquipmentName, 
		Brand, 
		Model, 
		PTag, 
		DatePurchased
FROM	(Equipment AS E 
		INNER JOIN Classrooms AS C ON C.ClassroomId=E.ClassroomId) 
		INNER JOIN Buildings AS B ON B.BuildingId=C.BuildingId
WHERE	B.buildingname=[Buildingname:];






--Equipment details based on classroom view
SELECT	EquipmentName, 
		Brand, 
		Model, 
		PTag, 
		DatePurchased, 
		CLassroomNumber, 
		Description
FROM	Equipment AS E 
		INNER JOIN Classrooms AS C ON C.ClassroomId=E.ClassRoomID
WHERE	C.ClassroomNumber=[ClassroomNumber:];






--Equipment details based on labnumber view
SELECT	LabNumber, 
		Description, 
		EquipmentName, 
		Brand, 
		Model, 
		PTag, 
		DatePurchased
FROM	Equipment AS E 
		INNER JOIN Labs AS L ON L.Labid1=E.LabId
WHERE	L.Labnumber=[LabNumber:];







---Equipment details view
SELECT	EquipmentName, 
		Brand, 
		Model, 
		PTag, 
		DatePurchased
FROM	Equipment AS E
WHERE	equipmentname=[EquipmentName:];






--Lab Equipment details in buildg view
SELECT	BuildingName, 
		LabNumber, 
		Description, 
		EquipmentName, 
		Brand, 
		Model, 
		PTag, 
		DatePurchased
FROM	(Equipment AS E 
		INNER JOIN Labs AS L ON L.Labid1=E.LabId) 
		INNER JOIN Buildings AS B ON B.buildingId=L.BuildingId
WHERE	B.buildingName=[BuildingName:];





--Labs In Building View
SELECT  BuildingName, 
		LabNumber, 
		Description AS LabName
FROM	Labs AS L INNER JOIN Buildings AS B ON B.BuildingID=L.BuildingID
WHERE	B.Buildingname=[BuildingName :];






--PC,Building,Classroom details based on Software
SELECT	S.SoftwareDescription, 
		W.PCName, 
		C.CLassroomNumber, 
		C.Description, 
		B.BuildingName
FROM	(((Softwares AS S 
		INNER JOIN WKSoftwares AS WK ON Wk.SoftwareId=S.SoftwareId) 
		INNER JOIN Workstations AS W ON W.StationId=Wk.WorkstationId) 
		INNER JOIN Classrooms AS C ON C.ClassroomID= W.ClassRoomID) 
		INNER JOIN Buildings AS B ON B.BuildingId=C.BuildingID
WHERE	S.SoftwareDescription=[SoftwareDescription:];






--PC,Building,Labs details based on Software
SELECT	S.SoftwareDescription, 
		W.PCName, 
		L.LabNumber, 
		L.Description, 
		B.BuildingName
FROM	(((Softwares AS S 
		INNER JOIN WKSoftwares AS WK ON Wk.SoftwareId=S.SoftwareId) 
		INNER JOIN Workstations AS W ON W.StationId=Wk.WorkstationId) 
		INNER JOIN Labs AS L ON L.LabId1= W.LabId) 
		INNER JOIN Buildings AS B ON B.BuildingId=L.BuildingID
WHERE	S.SoftwareDescription=[SoftwareDescription:];







--Worksations details based on ClassroomNumb View
SELECT	C.Classroomnumber, 
		PCName, 
		PCModel, 
		PCPTag, 
		PCSerialNo, 
		DatePurchased, 
		WarrantyExpires, 
		StationType, 
		OperatingSystem, 
		S.SoftwareList, 
		SoftwareAddOns
FROM	(Workstations AS W 
		INNER JOIN Classrooms AS C ON c.classroomId=W.ClassroomId) 
		INNER JOIN StandardSoftwares AS S ON W.StandardSoftwareID=S.SoftwareId
WHERE	ClassRoomnumber=[ClassroomNumber:];






--workstations details based on LabNumber view
SELECT	LabNumber, 
		Description, 
		PCName, 
		PCModel, 
		PCPTag, 
		PCSerialNo, 
		DatePurchased, 
		WarrantyExpires, 
		StationType, 
		OperatingSystem, 
		S.SoftwareList, 
		SoftwareAddOns
FROM	(Workstations AS W 
		INNER JOIN Labs AS L ON L.LabId1=W.LabId) 
		INNER JOIN StandardSoftwares AS S ON S.Softwareid=W.StandardSoftwareID
WHERE	L.Labnumber=[LabNumber:];




