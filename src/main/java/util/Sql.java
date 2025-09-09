package util;

public class Sql {
	
	/* 
	 * 날짜 : 2025/09/08
	 * 이름 : 한탁원
	 * 내용 : 대학대학원 SQL 작성
	 */
	public static final String SELECT_DEPARTMENT_ALL = "SELECT * FROM DEPARTMENT";
	public static final String WHERE_COLLEGE = " WHERE COLLEGE = ?";
	public static final String SELECT_DEPARTMENT_ALL_HEAD_WHERE_COLLEGE ="SELECT d.name_kor AS dept_name, " +
																	    "       p.name_kor AS prof_name, " +
																	    "       d.tel      AS dept_tel " +
																	    "FROM TB_Department d " +
																	    "JOIN Department_Professor dp " +
																	    "  ON dp.dept_id = d.dept_id " +
																	    " AND dp.col_id  = d.col_id " +
																	    "JOIN TB_Professor p " +
																	    "  ON p.pro_id   = dp.pro_id " +
																	    "WHERE dp.role = ? AND d.col_id = ?";
	
	/* 
	 * 날짜 : 2025/09/04
	 * 이름 : 한탁원
	 * 내용 : Admission (입학안내) SQL 작성
	 */
	// ID MAX 구하기
	public static final String SELECT_ADMISSION_NOTICE_MAX_ID = "SELECT MAX(ID) FROM TB_ADMISSION_NOTICE";
	// 글 삽입
	public static final String INSERT_ADMISSION_NOTICE = "INSERT INTO TB_ADMISSION_NOTICE (TITLE, CONTENT, WRITER, CREATED_AT, VIEWS) VALUES (?, ?, ?, CURDATE(), 0)";
	// 모든 글 가져오기
	public static final String SELECT_ADMISSION_NOTICE_ALL = "SELECT * FROM TB_ADMISSION_NOTICE "
															+ "ORDER BY ID DESC "
															+ "LIMIT 5 OFFSET ?;";
	// 글 개수 구하기
	public static final String SELECT_ADMISSION_NOTICE_COUNT_TOTAL = "SELECT COUNT(*) FROM TB_ADMISSION_NOTICE";
	
	// 검색
	public final static String SELECT_ADMISSION_NOTICE_SEARCH = "SELECT * FROM TB_ADMISSION_NOTICE ";
	public final static String SELECT_ADMISSION_NOTICE_COUNT_SEARCH = "SELECT COUNT(*) FROM TB_ADMISSION_NOTICE ";	

	
	/* 
	 * 날짜 : 2025/09/04
	 * 이름 : 한탁원
	 * 내용 : Academic (학사안내) SQL 작성
	 */
	// ID MAX 구하기
	public static final String SELECT_ACADEMIC_NOTICE_MAX_ID = "SELECT MAX(ID) FROM TB_ACADEMIC_NOTICE";
	// 글 삽입
	public static final String INSERT_ACADEMIC_NOTICE = "INSERT INTO TB_ACADEMIC_NOTICE (TITLE, CONTENT, WRITER, CREATED_AT, VIEWS) VALUES (?, ?, ?, CURDATE(), 0)";
	// 모든 글 가져오기
	public static final String SELECT_ACADEMIC_NOTICE_ALL = "SELECT * FROM TB_ACADEMIC_NOTICE "
															+ "ORDER BY ID DESC "
															+ "LIMIT 5 OFFSET ?;";
	// 글 개수 구하기
	public static final String SELECT_ACADEMIC_NOTICE_COUNT_TOTAL = "SELECT COUNT(*) FROM TB_ACADEMIC_NOTICE";
	
	// 검색
	public final static String SELECT_ACADEMIC_NOTICE_SEARCH = "SELECT * FROM TB_ACADEMIC_NOTICE ";
	public final static String SELECT_ACADEMIC_NOTICE_COUNT_SEARCH = "SELECT COUNT(*) FROM TB_ACADEMIC_NOTICE ";
	
	// 검색 도구
	public final static String SEARCH_WHERE_TITLE = "WHERE TITLE LIKE ? ";
	public final static String SEARCH_WHERE_CONTENT = "WHERE CONTENT LIKE ? ";
	public final static String SEARCH_WHERE_WRITER = "WHERE WRITER LIKE ? ";
	
	public final static String SEARCH_ORDER_ID = "ORDER BY ID DESC ";
	public final static String SEARCH_OFFSET_ROW = "LIMIT 5 OFFSET ?";


	/* 
	 * 날짜 : 2025/09/08
	 * 이름 : 박효빈
	 * 내용 : Academic (학사안내) FAQ SQL 작성
	 */
	// 학사안내 - FAQ(자주묻는질문) 전체 가져오기
	public final static String SELECT_FAQ_ALL = 
		    "SELECT id, category, question, answer, DATE_FORMAT(created_at, '%Y-%m-%d') AS created_at " +
		    "FROM tb_academic_faq ORDER BY id";
	// 학사 안내 - 학사일정 전체 불러오기 CalanderDTO
	public final static String SELECT_CALANDER_ALL = "SELECT * FROM tb_academic_calendar";
	// 대학생활 - 갤러리 게시판 전체 불러오기
	public final static String SELECT_GALLERY_ALL = "SELECT * FROM tb_collegelife_gallery";
	

	/* 
	 * 날짜 : 2025/09/08
	 * 이름 : 정순권
	 * 내용 : Signup sql 작성
	 */

	// 유효성 검사 및 회원 가입
	public static final String SELECT_COUNT = "SELECT COUNT(*) FROM Users ";
	public static final String WHERE_USER_ID = "WHERE USER_ID=?";
	public static final String WHERE_HP   = "WHERE USER_HP=?";
	public static final String WHERE_EMAIL = "WHERE USER_EMAIL=?";
	
	public static final String INSERT_USER = "INSERT INTO USERS (USER_ID, USER_PASS, USER_NAME, USER_HP, USER_EMAIL, POSTAL_CODE, BASIC_ADDR, DETAIL_ADDR) "
			+ "VALUES (?,STANDARD_HASH(?, 'SHA256'),?,?,?,?,?,?)";
	
	// 로그인
	public static final String SELECT_USER_BY_PASS = "SELECT * FROM USERS WHERE USER_ID=? AND USER_PASS=STANDARD_HASH(?, 'SHA256')";
}

 
