--1
SELECT e.empSSN, e.empNAME, d.depNum 
FROM tblEmployee e
JOIN tblDepartment d ON e.depNum = d.depNum
WHERE d.depName = N'Phòng Nghiên cứu và phát triển';
--2
SELECT p.proNum, p.proNAME ,d.depName
FROM tblProject p
JOIN tblDepartment d ON p.depNum = d.depNum
WHERE d.depName = N'Phòng Nghiên cứu và phát triển';
--3 
SELECT p.proNum, p.proNAME, d.depName
FROM tblDepartment d
JOIN tblProject p ON p.depNum = d.depNum
WHERE p.proNAME = N'ProjectB';
--4
SELECT e.empSSN, e.empNAME
FROM tblEmployee e
JOIN tblEmployee s ON  s.empSSN = e.supervisorSSN
WHERE s.empNAME = N'Mai Duy An';
--5
SELECT s.empSSN, s.empNAME
FROM tblEmployee e
JOIN tblEmployee s ON  s.empSSN = e.supervisorSSN
WHERE e.empNAME = N'Mai Duy An'
--6
SELECT l.locNum ,l.locName
FROM tblLocation l
JOIN tblProject p ON l.locNum = p.locNum
WHERE p.proName = N'ProjectA';
--7 
SELECT p.proNum, p.proName
FROM tblProject p
JOIN tblLocation l On l.locNum = p.locNum
WHERE l.locname = N'TP Hồ Chí Minh';
--8
SELECT d.depName, d.depBirthdate, e.empName
FROM tblDependent d
JOIN tblEmployee e ON d.empSSN = e.empSSN
WHERE DATEDIFF(year, d.depBirthdate,GETDATE()) > 18 ;
--9
SELECT d.depName, d.depBirthdate, e.empName
FROM tblDependent d
JOIN tblEmployee e ON d.empSSN = e.empSSN
WHERE d.depSex = N'M'
--10
SELECT dp.depNum, dp.depName, l.locName
FROM tblDepartment dp
JOIN tblDepLocation d ON d.depNum = dp.depNum
JOIN tblLocation l ON l.locNum = d.locNum
WHERE dp.depName = N'Phòng Nghiên cứu và phát triển';
--11
SELECT p.proNum, p.proName, dp.depName
FROM tblProject p 
JOIN tblLocation l ON l.locNum = p.locNum
JOIN tblDepartment dp ON dp.depNum = p.depNum
WHERE l.locName = N'TP Hồ Chí Minh';
--12
SELECT e.empName, d.depName, d.depRelationship
FROM tblDependent d
JOIN tblEmployee e ON e.empSSN = d.empSSN
JOIN tblDepartment dp ON dp.depNum = e.depNum
WHERE d.depSex = N'F' and dp.depName = N'Phòng Nghiên cứu và phát triển';
--13
SELECT e.empName, d.depRelationship
FROM tblDependent d
JOIN tblEmployee e ON e.empSSN = d.empSSN
JOIN tblDepartment dp ON dp.depNum = e.depNum
WHERE DATEDIFF(year, d.depBirthdate,GETDATE()) > 18 and dp.depName = N'Phòng Nghiên cứu và phát triển';










