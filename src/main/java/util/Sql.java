package util;

public class Sql {
	
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
	public final static String SEARCH_ACADEMIC_NOTICE_WHERE_TITLE = "WHERE TITLE LIKE ? ";
	public final static String SEARCH_ACADEMIC_NOTICE_WHERE_CONTENT = "WHERE CONTENT LIKE ? ";
	public final static String SEARCH_ACADEMIC_NOTICE_WHERE_WRITER = "WHERE WRITER LIKE ? ";
	
	public final static String SEARCH_ORDER_ID = "ORDER BY ID DESC ";
	public final static String SEARCH_OFFSET_ROW = "LIMIT 5 OFFSET ?";
	
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
	
}
