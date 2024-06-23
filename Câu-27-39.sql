Use FUH_COMPANY;
--C�u 27:
SELECT 
    p.proNum, 
    p.proName, 
    SUM(w.workHours) AS TotalHours
FROM 
    tblProject p
JOIN 
    tblWorksOn w ON p.proNum = w.proNum
GROUP BY 
    p.proNum, 
    p.proName;
--C�u 28:
WITH ProjectMemberCount AS (
    SELECT 
        w.proNum, 
        p.proName, 
        COUNT(DISTINCT w.empSSN) AS MemberCount
    FROM 
        tblWorksOn w
    JOIN 
        tblProject p ON w.proNum = p.proNum
    GROUP BY 
        w.proNum, 
        p.proName
)
SELECT 
    proNum, 
    proName, 
    MemberCount
FROM 
    ProjectMemberCount
WHERE 
    MemberCount = (
        SELECT MIN(MemberCount)
        FROM ProjectMemberCount
    );
--C�u 29:
WITH ProjectMemberCount AS (
    SELECT 
        w.proNum, 
        p.proName, 
        COUNT(DISTINCT w.empSSN) AS MemberCount
    FROM 
        tblWorksOn w
    JOIN 
        tblProject p ON w.proNum = p.proNum
    GROUP BY 
        w.proNum, 
        p.proName
)
SELECT 
    proNum, 
    proName, 
    MemberCount
FROM 
    ProjectMemberCount
WHERE 
    MemberCount = (
        SELECT MAX(MemberCount)
        FROM ProjectMemberCount
    );
--C�u 30:
WITH ProjectTotalHours AS (
    SELECT 
        w.proNum, 
        p.proName, 
        SUM(w.workHours) AS TotalHours
    FROM 
        tblWorksOn w
    JOIN 
        tblProject p ON w.proNum = p.proNum
    GROUP BY 
        w.proNum, 
        p.proName
)
SELECT 
    proNum, 
    proName, 
    TotalHours
FROM 
    ProjectTotalHours
WHERE 
    TotalHours = (
        SELECT MIN(TotalHours)
        FROM ProjectTotalHours
    );
--C�u 31:
WITH ProjectTotalHours AS (
    SELECT 
        w.proNum, 
        p.proName, 
        SUM(w.workHours) AS TotalHours
    FROM 
        tblWorksOn w
    JOIN 
        tblProject p ON w.proNum = p.proNum
    GROUP BY 
        w.proNum, 
        p.proName
)
SELECT 
    proNum, 
    proName, 
    TotalHours
FROM 
    ProjectTotalHours
WHERE 
    TotalHours = (
        SELECT MAX(TotalHours)
        FROM ProjectTotalHours
    );
--C�u 32:
SELECT
    l.locName,
    COUNT(DISTINCT p.depNum) AS NumberOfDepartments
FROM
    tblLocation l
LEFT JOIN
    tblProject p ON l.locNum = p.locNum
GROUP BY
    l.locName;
--C�u 33:
SELECT 
    d.depNum, 
    d.depName, 
    COUNT(p.locNum) AS NumberOfWorkspaces
FROM 
    tblDepartment d
LEFT JOIN 
    tblProject p ON d.depNum = p.depNum
GROUP BY 
    d.depNum, d.depName;
--C�u 34:
SELECT TOP 1
    d.depNum,
    d.depName,
    COUNT(p.locNum) AS NumberOfWorkspaces
FROM
    tblDepartment d
LEFT JOIN
    tblProject p ON d.depNum = p.depNum
GROUP BY
    d.depNum, d.depName
ORDER BY
    COUNT(p.locNum) DESC;
--C�u 35:
SELECT TOP 1
    d.depNum,
    d.depName,
    COUNT(p.locNum) AS NumberOfWorkspaces
FROM
    tblDepartment d
LEFT JOIN
    tblProject p ON d.depNum = p.depNum
GROUP BY
    d.depNum, d.depName
ORDER BY
    COUNT(p.locNum) ASC;
--C�u 36:
SELECT TOP 1
    l.locName,
    COUNT(d.depNum) AS NumberOfDepartments
FROM
    tblLocation l
LEFT JOIN
    tblProject p ON l.locNum = p.locNum
LEFT JOIN
    tblDepartment d ON p.depNum = d.depNum
GROUP BY
    l.locName
ORDER BY
    COUNT(d.depNum) DESC;
--C�u 37:
SELECT TOP 1
    l.locName,
    COUNT(d.depNum) AS NumberOfDepartments
FROM
    tblLocation l
LEFT JOIN
    tblProject p ON l.locNum = p.locNum
LEFT JOIN
    tblDepartment d ON p.depNum = d.depNum
GROUP BY
    l.locName
ORDER BY
    COUNT(d.depNum) ASC;
--C�u 38:
SELECT TOP 1
    e.empSSN,
    e.empName,
    COUNT(d.empSSN) AS NumberOfDependents
FROM
    tblEmployee e
LEFT JOIN
    tblDependent d ON e.empSSN = d.empSSN
GROUP BY
    e.empSSN, e.empName
ORDER BY
    COUNT(d.empSSN) DESC;
--C�u 39:
SELECT TOP 1
    e.empSSN,
    e.empName,
    COUNT(d.empSSN) AS NumberOfDependents
FROM
    tblEmployee e
LEFT JOIN
    tblDependent d ON e.empSSN = d.empSSN
GROUP BY
    e.empSSN, e.empName
ORDER BY
    COUNT(d.empSSN) ASC;

