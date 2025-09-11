package util;

public class Sql {
	
	/* 
	 * 날짜 : 2025/09/08
	 * 이름 : 한탁원
	 * 내용 : 대학/대학원 SQL 작성
	 */
	// 대학
	public static final String INSERT_COLLEGE =
	    "INSERT INTO TB_College (name_kor, name_eng, title, content, image) VALUES (?, ?, ?, ?, ?)";

	// [FIX] WHERE_COLLEGE가 애매했음(컬럼 COLLEGE 없음) -> col_id 기준으로 교체
	public static final String WHERE_COLLEGE = " WHERE col_id = ?";

	public static final String SELECT_COLLEGE_ALL = "SELECT * FROM TB_College";

	public static final String SELECT_DEPARTMENT_ALL = "SELECT * FROM TB_Department";
	// [FIX] TB_Professor_Role에는 col_id 컬럼이 없음 → dp.col_id 조건 제거
	public static final String SELECT_DEPARTMENT_ALL_HEAD_WHERE_COLLEGE =
		    "SELECT d.name_kor AS dept_name, " +
		    "       p.name_kor AS prof_name, " +
		    "       d.tel      AS dept_tel " +
		    "FROM TB_Department d " +
		    "JOIN TB_Professor_Role dp " +
		    "  ON dp.dept_id = d.dept_id " +
		    "JOIN TB_Professor p " +
		    "  ON p.pro_id   = dp.pro_id " +
		    "WHERE dp.role = ? AND d.col_id = ?";

	public static final String SELECT_DEPARTMENT_WITH_INFO =
		    "SELECT \n" +
		    "  d.dept_no,\n" +
		    "  c.name_kor AS college_name,\n" +
		    "  d.name_kor AS department_name,\n" +
		    "  head.prof_name AS head_professor_name,\n" +
		    "  d.tel AS dept_tel,\n" +
		    "  COALESCE(pc.prof_count, 0)   AS professor_count,\n" +
		    "  COALESCE(sc.student_count, 0) AS student_count,\n" +
		    "  COALESCE(lc.lecture_count, 0) AS lecture_count\n" +
		    "FROM TB_Department d\n" +
		    "JOIN TB_College c ON d.col_id = c.col_id\n" +
		    "LEFT JOIN (\n" +
		    "  SELECT pr.dept_id, MIN(p.name_kor) AS prof_name\n" +
		    "  FROM TB_Professor_Role pr\n" +
		    "  JOIN TB_Professor p ON p.pro_id = pr.pro_id\n" +
		    "  WHERE pr.role = '학과장'\n" +
		    "  GROUP BY pr.dept_id\n" +
		    ") head ON head.dept_id = d.dept_id\n" +
		    "LEFT JOIN (\n" +
		    "  SELECT dept_id, COUNT(DISTINCT pro_id) AS prof_count\n" +
		    "  FROM TB_Professor_Role\n" +
		    "  GROUP BY dept_id\n" +
		    ") pc ON pc.dept_id = d.dept_id\n" +
		    "LEFT JOIN (\n" +
		    "  SELECT dept_id, COUNT(*) AS student_count\n" +
		    "  FROM TB_Student\n" +
		    "  GROUP BY dept_id\n" +
		    ") sc ON sc.dept_id = d.dept_id\n" +
		    "LEFT JOIN (\n" +
		    "  SELECT dept_id, COUNT(*) AS lecture_count\n" +
		    "  FROM TB_Lecture\n" +
		    "  GROUP BY dept_id\n" +
		    ") lc ON lc.dept_id = d.dept_id\n" +
		    "ORDER BY c.col_id, d.dept_no";


	public static final String INSERT_DEPARTMENT =
		    "INSERT INTO TB_Department (col_id, dept_no, name_kor, name_eng, founded_date, tel, office)\r\n" +
		    "SELECT \r\n" +
		    "  p.col_id,\r\n" +
		    "  LPAD(\r\n" +
		    "    CASE p.col_id\r\n" +
		    "      WHEN 1 THEN LEAST(19, GREATEST( 1, COALESCE(MAX(CAST(d.dept_no AS UNSIGNED)),  0) + 1))\r\n" +
		    "      WHEN 2 THEN LEAST(39, GREATEST(21, COALESCE(MAX(CAST(d.dept_no AS UNSIGNED)), 20) + 1))\r\n" +
		    "      WHEN 3 THEN LEAST(59, GREATEST(41, COALESCE(MAX(CAST(d.dept_no AS UNSIGNED)), 40) + 1))\r\n" +
		    "      WHEN 4 THEN LEAST(79, GREATEST(61, COALESCE(MAX(CAST(d.dept_no AS UNSIGNED)), 60) + 1))\r\n" +
		    "      WHEN 5 THEN LEAST(99, GREATEST(81, COALESCE(MAX(CAST(d.dept_no AS UNSIGNED)), 80) + 1))\r\n" +
		    "      ELSE NULL\r\n" +   
		    "    END\r\n" +
		    "  , 2, '0') AS dept_no,\r\n" +
		    "  ?, ?, ?, ?, ?\r\n" +
		    "FROM (SELECT ? AS col_id) p\r\n" +
		    "LEFT JOIN TB_Department d ON d.col_id = p.col_id";

	/*
	 * 날짜 : 2025/09/11
	 * 이름 : 한탁원
	 * 내용 : 관리 - index
	 */
	
	public static final String SELECT_MANAGE_INDEX_OPERATE =
		    "SELECT " +
		    " (SELECT COUNT(*) FROM TB_Department) AS opened_departments, " +
		    " (SELECT COUNT(*) FROM TB_Lecture) AS opened_lectures, " +
		    " (SELECT COUNT(*) FROM TB_Professor) AS total_professors, " +
		    " (SELECT COUNT(*) FROM TB_Employ) AS total_employees, " +
		    " (SELECT COUNT(*) FROM TB_Student) AS total_students, " +
		    " (SELECT COUNT(*) FROM TB_Student WHERE statement IN ('휴학','휴학중')) AS leave_students, " +
		    " (SELECT COUNT(*) FROM TB_Student WHERE statement IN ('대학원','대학원생')) AS grad_students, " +
		    " (SELECT COUNT(*) FROM TB_Student WHERE statement IN 	('졸업','졸업생')) AS graduates";

	public static final String SELECT_MANAGE_INDEX_GRADE_STUDENT_SUMMARY =
		    "SELECT " +
		    "  CASE WHEN grade_num IS NULL THEN '총합' ELSE CONCAT(grade_num, '학년') END AS grade, " +
		    "  SUM(CASE WHEN statement IN ('재학','재학중') THEN 1 ELSE 0 END) AS sumEnrolledCnt, " +
		    "  SUM(CASE WHEN statement IN ('휴학','휴학중') THEN 1 ELSE 0 END) AS sumLeaveCnt, " +
		    "  SUM(CASE WHEN statement IN ('재학','재학중','휴학','휴학중') THEN 1 ELSE 0 END) AS sumTotalCnt " +
		    "FROM ( " +
		    "  SELECT CAST(grade AS UNSIGNED) AS grade_num, statement " +
		    "  FROM TB_Student " +
		    "  WHERE CAST(grade AS UNSIGNED) BETWEEN 1 AND 4 " +
		    ") s " +
		    "GROUP BY grade_num WITH ROLLUP " +
		    "ORDER BY (grade_num IS NULL), grade_num";

	public static final String SELECT_MANAGE_INDEX_DEPT_STUDENT_SUMMARY =
		    "SELECT "
		  + "  CASE WHEN d.dept_id IS NULL THEN '총합' ELSE MAX(d.name_kor) END AS dept_name, "
		  + "  SUM(CASE WHEN s.`statement` IN ('재학','재학중') THEN 1 ELSE 0 END) AS sumEnrolledCnt, "
		  + "  SUM(CASE WHEN s.`statement` IN ('휴학','휴학중') THEN 1 ELSE 0 END) AS sumLeaveCnt, "
		  + "  SUM(CASE WHEN s.`statement` IN ('재학','재학중','휴학','휴학중') THEN 1 ELSE 0 END) AS sumTotalCnt "
		  + "FROM TB_Department d "
		  + "LEFT JOIN TB_Student s ON s.dept_id = d.dept_id "
		  + "GROUP BY d.dept_id WITH ROLLUP "
		  + "ORDER BY (d.dept_id IS NULL), dept_name " 
		  + "LIMIT 5 OFFSET 0";


	/*
	 * 날짜 : 2025/09/09
	 * 이름 : 한탁원
	 * 내용 : 교수 DB
	 */
	public static final String INSERT_PROFESSOR =
		    "INSERT INTO TB_Professor ("
		  + "  pro_no, rrn, name_kor, name_eng, gender, nationality, "
		  + "  tel, email, zip_code, address_basic, address_detail, statement, position"
		  + ") "
		  + "SELECT "
		  + "  CONCAT("
		  + "    YEAR(?), d.dept_no, "
		  + "    LPAD(COALESCE(MAX(CAST(SUBSTRING(p.pro_no, 7) AS UNSIGNED)), 0) + 1, 3, '0')"
		  + "  ) AS pro_no, "
		  + "  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? "
		  + "FROM TB_Department d "
		  + "LEFT JOIN TB_Professor p "
		  + "  ON p.pro_no LIKE CONCAT(YEAR(?), d.dept_no, '%') "
		  + "WHERE d.dept_id = ?";

	public static final String SELECT_PROFESSOR_ALL = "SELECT * FROM TB_Professor";
	public static final String INSERT_PROFESSOR_ACADEMIC =
		    "INSERT INTO TB_Professor_Academic (pro_id, school, major, graduation_at, degree, appointment_date) " +
		    "VALUES (?, ?, ?, ?, ?, ?)";

	public static final String INSERT_PROFESSOR_ROLE =
		    "INSERT INTO TB_Professor_Role (pro_id, dept_id, role) VALUES (?, ?, ?)";

	public static final String SELECT_PROFESSOR_COUNT = "SELECT COUNT(*) FROM TB_Professor";
	public static final String SELECT_PROFESSOR_COUNT_SEARCH = 
			"SELECT COUNT(*) " +
			"FROM TB_Professor p " +
			"join TB_Professor_Role dp on p.pro_id = dp.pro_id " +
			"join TB_Department d on dp.dept_id = d.dept_id ";

	// [FIX] 교수-학과 연결 테이블을 TB_Professor_Role로 통일, dp.col_id 조인 제거
	public static final String SELECT_PROFESSOR_INFO_ALL =
		    "SELECT " +
		    "    p.pro_no, " +
		    "    p.name_kor AS professor_name, " +
		    "    p.rrn, " +
		    "    p.tel, " +
		    "    p.email, " +
		    "    d.name_kor AS department_name, " +
		    "    p.position, " +
		    "    p.statement, " +
		    "    a.appointment_date " +
		    "FROM TB_Professor p " +
		    "JOIN TB_Professor_Role dp ON p.pro_id = dp.pro_id " +
		    "JOIN TB_Department d ON dp.dept_id = d.dept_id " +
		    "LEFT JOIN TB_Professor_Academic a ON p.pro_id = a.pro_id " +   
		    "ORDER BY p.pro_id DESC " +                                     
		    "LIMIT 5 OFFSET ?"; 

	/*
	 * 날짜 : 2025/09/09
	 * 이름 : 한탁원
	 * 내용 : 학생 DB
	 */
	public static final String INSERT_STUDENT =
		    "INSERT INTO TB_Student ( " +
		    "  std_no, rrn, name_kor, name_eng, gender, nationality, " +
		    "  tel, email, zip_code, address_basic, address_detail, " +
		    "  entrance_date, graduate_date, category, grade, semester, statement, dept_id, pro_id, statement " +
		    ") " +
		    "SELECT " +
		    "  CONCAT( " +
		    "    YEAR(?), d.dept_no, " +
		    "    LPAD( " +
		    "      COALESCE( " +
		    "        (SELECT MAX(CAST(SUBSTRING(s2.std_no, 7) AS UNSIGNED)) " +
		    "           FROM TB_Student s2 " +
		    "          WHERE s2.std_no LIKE CONCAT(YEAR(?), d.dept_no, '%') " +
		    "        ), 0 " +
		    "      ) + 1, 3, '0' " +
		    "    ) " +
		    "  ) AS std_no, " +
		    "  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, d.dept_id, ?, '재학중' " +
		    "FROM TB_Department d " +
		    "WHERE d.dept_id = ?";

	public static final String SELECT_STUDENT_ALL = "SELECT * FROM TB_Student";
	
	public static final String SELECT_STUDENT_INFO_ALL = 
		    "SELECT " +
		    "    s.std_no, " +
		    "    s.name_kor, " +
		    "    s.rrn, " +
		    "    s.tel, " +
		    "    s.email, " +
		    "    d.name_kor AS dept_name, " +
		    "    s.grade, " +
		    "    s.semester, " +
		    "    s.statement " +
		    "FROM TB_Student s " +
		    "LEFT JOIN TB_Department d ON s.dept_id = d.dept_id " +
		    "ORDER BY s.std_id DESC " +
		    "LIMIT 5 OFFSET ?";

	public static final String SELECT_STUDENT_COUNT = "SELECT COUNT(*) FROM TB_Student";
	public static final String SELECT_STUDENT_COUNT_SEARCH = "SELECT COUNT(*) FROM TB_Student ";
	
	/*
	 * 날짜 : 2025/09/11
	 * 이름 : 한탁원
	 * 내용 : 강의 DB 
	 */
	public static final String INSERT_LECTURE =
	        "INSERT INTO TB_Lecture " +
	        "( pro_id, dept_id, lec_no, grade, semester, credit, category, lec_name, " +
	        "  description, start_date, end_date, start_time, end_time, day_of_week, " +
	        "  evaluation, textbook, classroom, max_enrollment ) " +
	        "SELECT " +
	        "  ? AS pro_id, " +
	        "  d.dept_id AS dept_id, " +
	        "  CONCAT( " +
	        "    d.dept_no, " +
	        "    YEAR(?), " +
	        "    ?, " +
	        "    COALESCE( " +
	        "      ( " +
	        "        SELECT MAX(CAST(SUBSTRING(l.lec_no, CHAR_LENGTH(d.dept_no) + 5) AS UNSIGNED)) " +
	        "        FROM TB_Lecture l " +
	        "        WHERE l.lec_no LIKE CONCAT(d.dept_no, YEAR(?), ?, '%') " +
	        "      ), 0 " +
	        "    ) + 1 " +
	        "  ) AS lec_no, " +
	        "  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? " +
	        "FROM TB_Department d " +
	        "WHERE d.dept_id = ?;";

	public static final String SELECT_LECTURE_INFO_ALL =
		    "SELECT " +
		    "  L.lec_no, " +
		    "  D.name_kor AS dept_name, " +
		    "  L.grade, " +
		    "  L.category, " +
		    "  L.lec_name, " +
		    "  P.name_kor AS professor_name, " +
		    "  L.credit, " +
		    "  CONCAT( " +
		    "    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( " +
		    "      L.day_of_week, " +
		    "      'MON','월'),'TUE','화'),'WED','수'),'THU','목'),'FRI','금'),'SAT','토'),'SUN','일'), " +
		    "    ' ', " +
		    "    DATE_FORMAT(L.start_time, '%H:%i'), " +
		    "    ' ~ ', " +
		    "    DATE_FORMAT(L.end_time,   '%H:%i') " +
		    "  ) AS schedule, " +
		    "  L.classroom, " +
		    "  L.max_enrollment " +
		    "FROM TB_Lecture L " +
		    "JOIN TB_Department D ON D.dept_id = L.dept_id " +
		    "JOIN TB_Professor  P ON P.pro_id  = L.pro_id " +
		    "ORDER BY L.lec_no ";


	/*
	 * 
	 */
	
	public static final String SELECT_ENROLLMENT_INFO_ALL =
		    "SELECT " +
		    "  YEAR(L.start_date) AS year, " +
		    "  L.semester AS semester, " +
		    "  S.std_no AS student_no, " +
		    "  S.name_kor AS student_name, " +
		    "  S.grade AS grade, " +
		    "  D.name_kor AS dept_name, " +
		    "  L.lec_no AS lecture_no, " +
		    "  L.lec_name AS lecture_name, " +
		    "  L.category AS category, " +
		    "  P.name_kor AS professor_name, " +
		    "  L.credit AS credit, " +
		    "  E.enrolled_at AS enrolled_at " +
		    "FROM TB_Enrollment E " +
		    "JOIN TB_Student S ON E.std_id = S.std_id " +
		    "JOIN TB_Lecture L ON E.lec_id = L.lec_id " +
		    "JOIN TB_Department D ON S.dept_id = D.dept_id " +
		    "JOIN TB_Professor P ON L.pro_id = P.pro_id " +
		    "ORDER BY year DESC, semester, S.std_no, L.lec_no " +
		    "LIMIT 5 OFFSET ?";

	public static final String SELECT_LECTURE_COUNT = "SELECT COUNT(*) FROM TB_Lecture";
	public static final String SELECT_LECTURE_COUNT_SEARCH = "SELECT COUNT(*) FROM TB_Lecture ";
	
	/*
	 * 날짜 : 2025/09/11
	 * 이름 : 한탁원
	 * 내용 : 교육운영현황 DB 
	 */
	public static final String SELECT_OPERATE_INFO_ALL =
		    "SELECT " +
		    "  D.name_kor AS dept_name, " +
		    "  L.lec_no AS lecture_no, " +
		    "  L.lec_name AS lecture_name, " +
		    "  L.grade AS grade, " +
		    "  P.name_kor AS professor_name, " +
		    "  L.category AS category, " +
		    "  L.credit AS credit, " +
		    "  L.classroom AS classroom, " +
		    "  CONCAT(COALESCE(COUNT(E.enr_id),0), '/', COALESCE(L.max_enrollment,0)) AS enrollment_text, " +
		    "  CONCAT( CASE WHEN COALESCE(L.max_enrollment,0) > 0 " +
		    "         THEN ROUND(100.0 * COUNT(E.enr_id) / L.max_enrollment, 1) ELSE 0 END, '%' ) AS enrollment_rate " +
		    "FROM TB_Lecture L " +
		    "JOIN TB_Department D ON D.dept_id = L.dept_id " +
		    "JOIN TB_Professor  P ON P.pro_id  = L.pro_id " +
		    "LEFT JOIN TB_Enrollment E ON E.lec_id = L.lec_id " +
		    "GROUP BY L.lec_id, D.name_kor, L.lec_no, L.lec_name, L.grade, " +
		    "         P.name_kor, L.category, L.credit, L.classroom, L.max_enrollment " +
		    "ORDER BY D.name_kor, L.lec_no " +
		    "LIMIT 5 OFFSET ?";
	
	public static final String WHERE_PROFESSOR_NAME   = " WHERE p.name_kor LIKE ? ";
	public static final String WHERE_DEPARTMENT_NAME  = " WHERE dp.dept_id LIKE ? ";

	/* 
	 * 날짜 : 2025/09/04
	 * 이름 : 한탁원
	 * 내용 : Admission (입학안내) SQL 작성
	 */
	public static final String SELECT_ADMISSION_NOTICE_MAX_ID = "SELECT MAX(ID) FROM TB_ADMISSION_NOTICE";
	public static final String INSERT_ADMISSION_NOTICE = "INSERT INTO TB_ADMISSION_NOTICE (TITLE, CONTENT, WRITER, CREATED_AT, VIEWS) VALUES (?, ?, ?, CURDATE(), 0)";
	public static final String SELECT_ADMISSION_NOTICE_ALL =
		    "SELECT * FROM TB_ADMISSION_NOTICE ORDER BY ID DESC LIMIT 5 OFFSET ?;";
	public static final String SELECT_ADMISSION_NOTICE_COUNT_TOTAL = "SELECT COUNT(*) FROM TB_ADMISSION_NOTICE";
	public static final String SELECT_ADMISSION_NOTICE_SEARCH = "SELECT * FROM TB_ADMISSION_NOTICE ";
	public static final String SELECT_ADMISSION_NOTICE_COUNT_SEARCH = "SELECT COUNT(*) FROM TB_ADMISSION_NOTICE ";	

	/* 
	 * 날짜 : 2025/09/04
	 * 이름 : 한탁원
	 * 내용 : Academic (학사안내) SQL 작성
	 */
	public static final String SELECT_ACADEMIC_NOTICE_MAX_ID = "SELECT MAX(ID) FROM TB_ACADEMIC_NOTICE";
	public static final String INSERT_ACADEMIC_NOTICE = "INSERT INTO TB_ACADEMIC_NOTICE (TITLE, CONTENT, WRITER, CREATED_AT, VIEWS) VALUES (?, ?, ?, CURDATE(), 0)";
	public static final String SELECT_ACADEMIC_NOTICE_ALL =
		    "SELECT * FROM TB_ACADEMIC_NOTICE ORDER BY ID DESC LIMIT 5 OFFSET ?;";
	public static final String SELECT_ACADEMIC_NOTICE_COUNT_TOTAL = "SELECT COUNT(*) FROM TB_ACADEMIC_NOTICE";
	public static final String SELECT_ACADEMIC_NOTICE_SEARCH = "SELECT * FROM TB_ACADEMIC_NOTICE ";
	public static final String SELECT_ACADEMIC_NOTICE_COUNT_SEARCH = "SELECT COUNT(*) FROM TB_ACADEMIC_NOTICE ";
	public static final String SEARCH_WHERE_TITLE  = "WHERE TITLE LIKE ? ";
	public static final String SEARCH_WHERE_CONTENT = "WHERE CONTENT LIKE ? ";
	public static final String SEARCH_WHERE_WRITER = "WHERE WRITER LIKE ? ";
	public static final String SEARCH_ORDER_ID     = "ORDER BY ID DESC ";
	public static final String SEARCH_OFFSET_ROW   = "LIMIT 5 OFFSET ?";

	/* 
	 * 날짜 : 2025/09/08
	 * 이름 : 박효빈
	 * 내용 : Academic (학사안내) FAQ SQL 작성
	 */
	public final static String SELECT_FAQ_ALL = 
	    "SELECT id, category, question, answer, DATE_FORMAT(created_at, '%Y-%m-%d') AS created_at " +
	    "FROM TB_Faq ORDER BY id";
	public final static String SELECT_CALANDER_ALL = "SELECT * FROM TB_Academic_Calendar";
	public final static String SELECT_GALLERY_ALL = "SELECT * FROM TB_Collegelife_Gallery";
	 //public static final String SELECT_GALLERY_COUNT_TOTAL_GALLERY = "SELECT COUNT(*) FROM tb_collegelife_gallery";
	 //public static final String SELECT_GALLERY_LIST_PAGING = "SELECT gno, title, image_path, rdcnt, reg_date, content, writer FROM tb_collegelife_gallery ORDER BY reg_date DESC LIMIT ?, ?";
	 // 대학 생활 - 식단 페이징 SQL
	public static final String SELECT_MEAL_ALL = "SELECT * FROM tb_collegelife_meal";
	public static final String SELECT_GALLERY_COUNT_TOTAL_GALLERY = "SELECT COUNT(*) FROM TB_Collegelife_Gallery";
	public static final String SELECT_GALLERY_LIST_PAGING =
	    "SELECT gno, title, image_path, rdcnt, reg_date, content, writer FROM TB_Collegelife_Gallery ORDER BY reg_date DESC LIMIT ?, ?";

	/* 
	 * 날짜 : 2025/09/11
	 * 이름 : 정순권
	 * 내용 : 약관 sql 작성
	 */
	public static final String SELECT_TERMS = "SELECT * FROM TB_Terms where NO=?";
	
	public static final String SELECT_COUNT = "SELECT COUNT(*) FROM TB_GENERAL_USER ";
	public static final String WHERE_USER_ID = "WHERE USER_ID=?";
	public static final String WHERE_HP   = "WHERE USER_HP=?";
	public static final String WHERE_EMAIL = "WHERE USER_EMAIL=?";
	
	public static final String INSERT_USER =
	    "INSERT INTO TB_GENERAL_USER (USER_ID, USER_PASS, USER_NAME, USER_HP, USER_EMAIL, POSTAL_CODE, BASIC_ADDR, DETAIL_ADDR) "
	  + "VALUES (?,SHA2(?, 256),?,?,?,?,?,?)";
	
	/* 
	 * 날짜 : 2025/09/08
	 * 이름 : 정순권
	 * 내용 : 학생 교수 로그인 sql 작성
	 */

	// 로그인
	// user db명 수정 완료
	public static final String SELECT_USER_BY_PASS = "SELECT * FROM TB_GENERAL_USER WHERE USER_ID=? AND USER_PASS=SHA2(?, 256)";
	

	public static final String SELECT_STUDENT_BY_RRN = "SELECT * FROM TB_STUDENT WHERE STD_ID=? AND REPLACE(`RRN`, '-', '')=?";
	public static final String SELECT_PROFESSOR_BY_RRN = "SELECT * FROM TB_PROFESSOR WHERE PRO_ID=? AND REPLACE(`RRN`, '-', '')=?";


	
	/*
	 * 날짜 : 2025/09/08
	 * 이름 : 우지희
	 * 내용 : manage SQL 작성
	 */
	
	// manage - lecture register 
	public static final String REGISTER_LECTURE =
		    "INSERT INTO TB_Lecture " +
		    "(lec_no, lec_name, category, department, grade, semester, credit, professor, description, " +
		    "start_date, end_date, start_time, end_time, day_of_week, evaluation, textbook, classroom, max_enrollment) " +
		    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	//manageDAO - getnextsequence
	public static final String GET_NEXT_SEQUENCE = "SELECT COUNT(*) + 1 FROM TB_Lecture WHERE lec_no LIKE ? ";
	
	
	//managedao - list sql
	public static final String SELECT_ALL_TB_LECTURE =
		    "SELECT lec_no, department, grade, category, lec_name, professor, credit, " +
		    "CONCAT(day_of_week, ' ', start_time, ' ~ ', end_time) AS class_time, " +
		    "classroom, max_enrollment " +
		    "FROM TB_Lecture";
	
	//managedao - opelist Sql
	public static final String SELECT_ALL_LECTURE_WITH_ENROLLMENT = "SELECT lec_no, lec_name, category, professor, day_of_week, start_time, end_time, classroom, max_enrollment, enrollment " +
            "FROM TB_Lecture " ;
	
	//페이지네이션
	//기존 count 전용
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(*) FROM TB_Lecture ";
	public final static String SELECT_COUNT_SEARCH ="select count(*) from TB_Lecture ";
	//목록조회용
	public final static String SELECT_SEARCH_BASE = "SELECT * FROM TB_Lecture ";
	
	public final static String SEARCH_WHERE_LECNO = "where lecNo like ?";
	public final static String SEARCH_WHERE_DEPARTMENT = "where department like ?";
	public final static String SEARCH_WHERE_LECNAME = "where lecName like ?";
	public final static String SEARCH_WHERE_PROFESSOR = "where professor like ?";
	
	public final static String SEARCH_ORDER_LECNO = "ORDER BY lecNo DESC ";   
	public final static String SEARCH_OFFSET_ROW1 = "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";



}