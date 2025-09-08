package util;

public class Sql {
	
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
}

 
