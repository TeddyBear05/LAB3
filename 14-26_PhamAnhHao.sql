--Câu 14--
Use FUH_COMPANY
SELECT Depsex, COUNT(*) as SoLuong
FROM tblDependent
GROUP BY depSex;
--Câu 15--
SELECT depRelationship, COUNT(*) as SoLuong
FROM tblDependent
GROUP BY depRelationship;
--Câu 16--
SELECT dp.depNum, dp.depName, COUNT(*) as SoLuong
FROM tblDependent d
JOIN tblEmployee e ON d.empSSN = e.empSSN
JOIN tblDepartment dp ON e.depNum = dp.depNum
GROUP BY dp.depNum, dp.depName;
--Câu 17--
SELECT TOP 1 dp.depnum, dp.depName, COUNT(*) as SoLuong
FROM tblDependent d
JOIN tblEmployee e ON d.empSSN = e.empSSN
JOIN tblDepartment dp ON e.depnum = dp.depnum
GROUP BY dp.depnum, dp.depName
ORDER BY SoLuong ASC

--Câu 18--
SELECT TOP 1 with ties dp.depnum, dp.depName, COUNT(*) as SoLuong
FROM tblDependent d
JOIN tblEmployee e ON d.empSSN = e.empSSN
JOIN tblDepartment dp ON e.depnum = dp.depnum
GROUP BY dp.depnum, dp.depName
ORDER BY SoLuong DESC

--Câu 19--
SELECT e.empSSN, e.empName, dp.DepName, SUM(pa.workHours) as TongSoGio
FROM tblWorksOn pa
JOIN tblemployee e ON pa.empSSN = e.empSSN
JOIN tblDepartment dp ON e.depNum = dp.depNum
GROUP BY e.empSSN, e.empName, dp.depName;
--Câu 20--
SELECT dp.depNum, dp.depName, SUM(pa.workHours) as TongSoGio
FROM tblWorksOn pa
JOIN tblEmployee e ON pa.empSSN = e.empSSN
JOIN tblDepartment dp ON e.depNum = dp.depNum
GROUP BY dp.depNum, dp.depName;
--Câu 21--
SELECT TOP 1 e.empSSN, e.empName, SUM(pa.workHours) as TongSoGio
FROM tblWorksOn pa
JOIN tblEmployee e ON pa.empSSN = e.empSSN
GROUP BY e.empSSN, e.empName
ORDER BY TongSoGio ASC
--Câu 22--
SELECT TOP 1 e.empSSN, e.empName, SUM(pa.workHours) as TongSoGio
FROM tblWorksOn pa
JOIN tblEmployee e ON pa.empSSN = e.empSSN
GROUP BY e.empSSN, e.empName
ORDER BY TongSoGio DESC
--Câu 23--
SELECT e.empSSN, e.empName, dp.depName
FROM tblWorksOn pa
JOIN tblEmployee e ON pa.empSSN = e.empSSN
JOIN tblDepartment dp ON e.depNum = dp.depNum
GROUP BY e.empSSN, e.empName, dp.depName
HAVING COUNT(pa.proNum) = 1;
--Câu 24--
SELECT e.empSSN, e.empName, dp.depName
FROM tblWorksOn pa
JOIN tblEmployee e ON pa.empSSN = e.empSSN
JOIN tblDepartment dp ON e.depNum = dp.depNum
GROUP BY e.empSSN, e.empName, dp.depName
HAVING COUNT(pa.proNum) = 2;
--Câu 25--
SELECT e.empSSN, e.empName, dp.depName
FROM tblWorksOn pa
JOIN tblEmployee e ON pa.empSSN = e.empSSN
JOIN tblDepartment dp ON e.depNum = dp.depNum
GROUP BY e.empSSN, e.empName, dp.depName
HAVING COUNT(pa.proNum) >= 2;
--Câu 26--
SELECT p.proNum, p.proName, COUNT(pa.empSSN) as SoLuongThanhVien
FROM tblProject p
JOIN tblWorksOn pa ON p.proNum = pa.proNum
GROUP BY p.proNum, p.proName;
