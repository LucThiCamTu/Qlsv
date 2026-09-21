-- Chọn cơ sở dữ liệu để làm việc
USE QuanLySinhVien;

-- 1. Hiển thị tất cả các thông tin môn học (bảng Subject) có Credit lớn nhất
SELECT *
FROM Subject
WHERE Credit = (SELECT MAX(Credit) FROM Subject);

-- 2. Hiển thị các thông tin môn học có điểm thi (Mark) lớn nhất
SELECT Sub.SubID, Sub.SubName, Sub.Credit, Sub.Status, M.Mark
FROM Subject Sub
JOIN Mark M ON Sub.SubID = M.SubID
WHERE M.Mark = (SELECT MAX(Mark) FROM Mark);

-- 3. Hiển thị thông tin sinh viên và điểm trung bình của mỗi sinh viên, 
-- xếp hạng theo thứ tự điểm trung bình giảm dần
SELECT S.StudentID, S.StudentName, S.Address, S.Phone, AVG(M.Mark) AS AvgMark
FROM Student S
LEFT JOIN Mark M ON S.StudentID = M.StudentID
GROUP BY S.StudentID, S.StudentName, S.Address, S.Phone
ORDER BY AvgMark DESC;