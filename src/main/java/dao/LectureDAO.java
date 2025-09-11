package dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.lecture.LectureDTO;
import dto.lecture.LectureListDTO;
import util.DBHelper;
import util.Sql;

/*
 * 날짜 : 2025-09-08
 * 이름 : 한탁원
 * 내용 : DAO 작성 예정
 */
public class LectureDAO extends DBHelper {

	private final static LectureDAO INSTANCE = new LectureDAO();

	public static LectureDAO getInstance() {
		return INSTANCE;
	}

	private LectureDAO() {
	}

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public void insert(LectureDTO dto) {

		try {
			conn = getConnection();
			conn.setAutoCommit(false);

			// lec_no는 SQL에서 자동 생성됨 (dept_no + YEAR(start_date) + semester + 순번)
			psmt = conn.prepareStatement(Sql.INSERT_LECTURE, Statement.RETURN_GENERATED_KEYS);

			int i = 1;
			psmt.setInt(i++, dto.getPro_id()); // 1) pro_id

			// lec_no 생성용 YEAR(?) + 학기 + (LIKE 내에서도 동일)
			psmt.setDate(i++, dto.getStart_date()); // 2) YEAR(?)
			psmt.setString(i++, dto.getSemester()); // 3) semester (lec_no 생성용)
			psmt.setDate(i++, dto.getStart_date()); // 4) YEAR(?) in subquery
			psmt.setString(i++, dto.getSemester()); // 5) semester in subquery

			// 실제 컬럼들
			psmt.setString(i++, dto.getGrade()); // 6) grade
			psmt.setString(i++, dto.getSemester()); // 7) semester (칼럼 저장)
			psmt.setString(i++, dto.getCredit()); // 8) credit
			psmt.setString(i++, dto.getCategory()); // 9) category
			psmt.setString(i++, dto.getLec_name()); // 10) lec_name
			psmt.setString(i++, dto.getDescription()); // 11) description
			psmt.setDate(i++, dto.getStart_date()); // 12) start_date
			psmt.setDate(i++, dto.getEnd_date()); // 13) end_date

			// 14) start_time
			if (dto.getStart_time() != null) {
				psmt.setTime(i++, java.sql.Time.valueOf(dto.getStart_time()));
			} else {
				psmt.setNull(i++, java.sql.Types.TIME);
			}

			// 15) end_time
			if (dto.getEnd_time() != null) {
				psmt.setTime(i++, java.sql.Time.valueOf(dto.getEnd_time()));
			} else {
				psmt.setNull(i++, java.sql.Types.TIME);
			}

			psmt.setString(i++, dto.getDay_of_week()); // 16) "MON,WED,FRI"
			psmt.setString(i++, dto.getEvaluation()); // 17) evaluation
			psmt.setString(i++, dto.getTextbook()); // 18) textbook
			psmt.setString(i++, dto.getClassroom()); // 19) classroom
			psmt.setInt(i++, dto.getMax_enrollment()); // 20) max_enrollment

			psmt.setInt(i++, dto.getDept_id()); // 21) WHERE d.dept_id = ?

			psmt.executeUpdate();

			// (선택) 생성된 lec_id 회수
			try (ResultSet rs = psmt.getGeneratedKeys()) {
				if (rs.next()) {
					int lecId = rs.getInt(1);
					dto.setLec_id(lecId);
				}
			}

			conn.commit();
			closeAll();
		} catch (Exception e) {
			try {
				if (conn != null)
					conn.rollback();
			} catch (Exception ignore) {
			}
			e.printStackTrace();
		}
	}

	public LectureDTO select(int ano) {
		return null;
	}

	public List<LectureDTO> selectAll() {
		return null;
	}

	public List<LectureListDTO> selectInfoAll(int start) {
		List<LectureListDTO> dtoList = new ArrayList<LectureListDTO>();

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_LECTURE_INFO_ALL);
			psmt.setInt(1, start);
			rs = psmt.executeQuery();

			while (rs.next()) {
				LectureListDTO dto = new LectureListDTO();
				dto.setLec_no(rs.getString(1));
				dto.setDept_name(rs.getString(2));
				dto.setGrade(rs.getString(3));
				dto.setCategory(rs.getString(4));
				dto.setLec_name(rs.getString(5));
				dto.setProfessor_name(rs.getString(6));
				dto.setCredit(rs.getString(7));
				dto.setSchedule(rs.getString(8));
				dto.setClassroom(rs.getString(9));
				dto.setMax_enrollment(rs.getInt(10));
				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return dtoList;
	}

	public void update(LectureDTO dto) {

	}

	public void delete(int ano) {

	}

	// 게시글 개수 구하기
	public int selectCountTotal() {

		int total = 0;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_LECTURE_COUNT);

			if (rs.next()) {
				total = rs.getInt(1);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return total;
	}

	public int selectCountSearch(String searchType, String keyword) {

		int total = 0;

		if (searchType == null || searchType.isBlank()) {
			return selectCountTotal();
		}

		StringBuilder sql = new StringBuilder(Sql.SELECT_LECTURE_COUNT_SEARCH);

		if (searchType.equals("pro_name")) {
			sql.append(Sql.WHERE_PROFESSOR_NAME);
		} else if (searchType.equals("dept_name")) {
			sql.append(Sql.WHERE_DEPARTMENT_NAME);
		}

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, "%" + keyword + "%");

			rs = psmt.executeQuery();

			if (rs.next()) {
				total = rs.getInt(1);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return total;
	}
}