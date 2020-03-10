-- A. 각 일자별 빠진 교육생 자료 출력 요청
select attendance.attendance_date, student.student_name from student join attendance on(student.student_id = attendance.attendance_student_id) where attendance = '0';

-- B. 각 기수별, 지역별, 팀별 상위 알고리즘(A+이상) 인원 수
-- 기수별
select student_curriculum,count(*) from student join algorithm on(student.student_id = algorithm.algorithm_student_id) where grade = 'A+' group by student.student_curriculum;

-- 지역별
select student_region,count(*) from student join algorithm on(student.student_id = algorithm.algorithm_student_id) where grade = 'A+' group by student.student_region;

-- 팀별
select student_group,count(*) from student join algorithm on(student.student_id = algorithm.algorithm_student_id) where grade = 'A+' group by student.student_group;


-- C.2 학기 프로젝트 과정에 따른 팀 분배.(5 명 기준) (더미 데이터가 적어 팀 분배가 힘들면 지역과 기수를 신경쓰지 말고 말고 팀 분배해보도록 합시다.)
