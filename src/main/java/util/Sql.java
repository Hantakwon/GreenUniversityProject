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
	public static final String SELECT_PROFESSOR_COUNT_SEARCH = "SELECT COUNT(*) FROM TB_Professor ";

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

	
	public static final String WHERE_PROFESSOR_NAME   = " WHERE p.name_kor LIKE ? ";
	public static final String WHERE_DEPARTMENT_NAME  = " WHERE d.name_kor LIKE ? ";

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
	 * 날짜 : 2025/09/08
	 * 이름 : 정순권
	 * 내용 : Signup sql 작성
	 */
	public static final String SELECT_COUNT = "SELECT COUNT(*) FROM Users ";
	public static final String WHERE_USER_ID = "WHERE USER_ID=?";
	public static final String WHERE_HP   = "WHERE USER_HP=?";
	public static final String WHERE_EMAIL = "WHERE USER_EMAIL=?";
	
	public static final String INSERT_USER =
	    "INSERT INTO TB_GENERAL_USERS (USER_ID, USER_PASS, USER_NAME, USER_HP, USER_EMAIL, POSTAL_CODE, BASIC_ADDR, DETAIL_ADDR) "
	  + "VALUES (?,SHA2(?, 256),?,?,?,?,?,?)";
	
	/* 
	 * 날짜 : 2025/09/08
	 * 이름 : 정순권
	 * 내용 : 학생 교수 로그인 sql 작성
	 */

	// 로그인
	// user db명 수정 완료
	public static final String SELECT_USER_BY_PASS = "SELECT * FROM TB_GENERAL_USERS WHERE USER_ID=? AND USER_PASS=SHA2(?, 256)";
	

	public static final String SELECT_STUDENT_BY_RRN = "SELECT * FROM TB_STUDENT WHERE STD_ID=? AND REPLACE(`RRN`, '-', '')=?";
	public static final String SELECT_PROFESSOR_BY_RRN = "SELECT * FROM TB_PROFESSOR WHERE PRO_ID=? AND REPLACE(`RRN`, '-', '')=?";


	
	/*
	 * 날짜 : 2025/09/08
	 * 이름 : 우지희
	 * 내용 : manage SQL 작성
	 */
	
	// manage - lecture register 
	public static final String REGISTER_LECTURE =
		    "INSERT INTO tb_lecture " +
		    "(lecNo, lenName, category, department, grade, semester, credit, professor, description, " +
		    "start_date, end_date, start_time, end_time, day_of_week, evaluation, textbook, classroom, max_enrollment) " +
		    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	//manageDAO - getnextsequence
	public static final String GET_NEXT_SEQUENCE = "SELECT COUNT(*) + 1 FROM tb_lecture WHERE lecNo LIKE ? ";
	
	
	//managedao - list sql
	public static final String SELECT_ALL_TB_LECTURE =
		    "SELECT lecNo, department, grade, category, lenName, professor, credit, " +
		    "CONCAT(day_of_week, ' ', start_time, ' ~ ', end_time) AS class_time, " +
		    "classroom, max_enrollment " +
		    "FROM tb_lecture";
	
	//managedao - opelist Sql
	public static final String SELECT_ALL_LECTURE_WITH_ENROLLMENT = "SELECT lecNo, lenName, category, professor, day_of_week, start_time, end_time, classroom, max_enrollment, enrollment " +
            "FROM tb_lecture " ;
	
	//페이지네이션
	//기존 count 전용
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(*) FROM tb_lecture ";
	public final static String SELECT_COUNT_SEARCH ="select count(*) from tb_lecture ";
	//목록조회용
	public final static String SELECT_SEARCH_BASE = "SELECT * FROM tb_lecture ";
	
	public final static String SEARCH_WHERE_LECNO = "where lecNo like ?";
	public final static String SEARCH_WHERE_DEPARTMENT = "where department like ?";
	public final static String SEARCH_WHERE_LENNAME = "where lenName like ?";
	public final static String SEARCH_WHERE_PROFESSOR = "where professor like ?";
	
	public final static String SEARCH_ORDER_LECNO = "ORDER BY lecNo DESC ";   
	public final static String SEARCH_OFFSET_ROW1 = "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";



}