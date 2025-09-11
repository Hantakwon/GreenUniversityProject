package dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.OperateDTO;
import dto.lecture.LectureDTO;
import util.DBHelper;
import util.Sql;

/*
 * 날짜 : 2025-09-11
 * 이름 : 한탁원
 * 내용 : DAO 작성
 */
public class OperateDAO extends DBHelper {

	private final static OperateDAO INSTANCE = new OperateDAO();

	public static OperateDAO getInstance() {
		return INSTANCE;
	}

	private OperateDAO() {
	}

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public void insert(OperateDTO dto) {
	}

	public OperateDTO select(int ano) {
		return null;
	}

	public List<OperateDTO> selectAll() {
		return null;
	}

	public List<OperateDTO> selectInfoAll(int start) {
		List<OperateDTO> dtoList = new ArrayList<OperateDTO>();

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_OPERATE_INFO_ALL);
			psmt.setInt(1, start);
			rs = psmt.executeQuery();

			while (rs.next()) {
				OperateDTO dto = new OperateDTO();
				dto.setDept_name(rs.getString(1));
				dto.setLecture_no(rs.getString(2));
				dto.setLecture_name(rs.getString(3));
				dto.setGrade(rs.getString(4));
				dto.setProfessor_name(rs.getString(5));
				dto.setCategory(rs.getString(6));
				dto.setCredit(rs.getString(7));
				dto.setClassroom(rs.getString(8));
				dto.setEnrollment_text(rs.getString(9));
				dto.setEnrollment_rate(rs.getString(10));
				
				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return dtoList;
	}

	public void update(OperateDTO dto) {

	}

	public void delete(int ano) {

	}

	// 게시글 개수 구하기
	public int selectCountTotal() {

		int total = 0;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_PROFESSOR_COUNT);

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

		StringBuilder sql = new StringBuilder(Sql.SELECT_PROFESSOR_COUNT_SEARCH);

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