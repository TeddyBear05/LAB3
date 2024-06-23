--Câu 39
SELECT e.empSSN, e.empName, COUNT(d.depName) AS NumDependents
FROM tblEmployee e
LEFT JOIN tblDependent d ON e.empSSN = d.empSSN
GROUP BY e.empSSN, e.empName
ORDER BY NumDependents ASC
OFFSET 0 ROWS FETCH NEXT 1 ROW ONLY;
--Câu 40
SELECT e.empSSN, e.empName, dep.depName
FROM tblEmployee e
JOIN tblDepartment dep ON e.depNum = dep.depNum
LEFT JOIN tblDependent d ON e.empSSN = d.empSSN
WHERE d.empSSN IS NULL;
--Câu 41:
SELECT dep.depNum, dep.depName
FROM tblDepartment dep
LEFT JOIN tblEmployee e ON dep.depNum = e.depNum
LEFT JOIN tblDependent d ON e.empSSN = d.empSSN
WHERE d.empSSN IS NULL;
--Câu 42:
SELECT e.empSSN, e.empName, dep.depName
FROM tblEmployee e
JOIN tblDepartment dep ON e.depNum = dep.depNum
LEFT JOIN tblWorksOn w ON e.empSSN = w.empSSN
WHERE w.proNum IS NULL;
--Câu 43:
SELECT dep.depNum, dep.depName
FROM tblDepartment dep
LEFT JOIN tblEmployee e ON dep.depNum = e.depNum
LEFT JOIN tblWorksOn w ON e.empSSN = w.empSSN
WHERE w.proNum IS NULL;
--Câu 44:
SELECT dep.depNum, dep.depName
FROM tblDepartment dep
LEFT JOIN tblEmployee e ON dep.depNum = e.depNum
LEFT JOIN tblWorksOn w ON e.empSSN = w.empSSN
LEFT JOIN tblProject p ON w.proNum = p.proNum
WHERE p.proName = N'ProjectA' AND w.proNum IS NULL;

--Câu 45:
SELECT dep.depNum, dep.depName, COUNT(p.proNum) AS NumProjects
FROM tblDepartment dep
LEFT JOIN tblProject p ON dep.depNum = p.depNum
GROUP BY dep.depNum, dep.depName;

--Câu 46:
SELECT TOP 1 dep.depNum, dep.depName, COUNT(p.proNum) AS NumProjects
FROM tblDepartment dep
LEFT JOIN tblProject p ON dep.depNum = p.depNum
GROUP BY dep.depNum, dep.depName
ORDER BY NumProjects ASC;

--Câu 47:
SELECT TOP 1 dep.depNum, dep.depName, COUNT(p.proNum) AS NumProjects
FROM tblDepartment dep
LEFT JOIN tblProject p ON dep.depNum = p.depNum
GROUP BY dep.depNum, dep.depName
ORDER BY NumProjects DESC;

--Caau 48:
SELECT dep.depNum, dep.depName, COUNT(DISTINCT e.empSSN) AS NumEmployees, p.proName
FROM tblDepartment dep
JOIN tblEmployee e ON dep.depNum = e.depNum
JOIN tblWorksOn w ON e.empSSN = w.empSSN
JOIN tblProject p ON w.proNum = p.proNum
GROUP BY dep.depNum, dep.depName, p.proName
HAVING COUNT(DISTINCT e.empSSN) > 5;
--Cau 49:
SELECT e.empSSN, e.empName
FROM tblEmployee e
JOIN tblDepartment dep ON e.depNum = dep.depNum
LEFT JOIN tblDependent d ON e.empSSN = d.empSSN
WHERE dep.depName = N'Phòng nghiên cứu' AND d.empSSN IS NULL;

--Cau 50 :
SELECT e.empSSN, e.empName, SUM(w.workHours) AS TotalHours
FROM tblEmployee e
LEFT JOIN tblWorksOn w ON e.empSSN = w.empSSN
LEFT JOIN tblDependent d ON e.empSSN = d.empSSN
WHERE d.empSSN IS NULL
GROUP BY e.empSSN, e.empName;

-- Caau 51:
SELECT e.empSSN, e.empName, COUNT(d.empSSN) AS NumDependents, SUM(w.workHours) AS TotalHours
FROM tblEmployee e
LEFT JOIN tblWorksOn w ON e.empSSN = w.empSSN
LEFT JOIN tblDependent d ON e.empSSN = d.empSSN
GROUP BY e.empSSN, e.empName
HAVING COUNT(d.empSSN) > 3;

-- Caau 52:
SELECT e.empSSN, e.empName, SUM(w.workHours) AS TotalHours
FROM tblEmployee e
JOIN tblEmployee m ON e.supervisorSSN = m.empSSN
LEFT JOIN tblWorksOn w ON e.empSSN = w.empSSN
WHERE m.empName = N'Mai Duy An'
GROUP BY e.empSSN, e.empName;






