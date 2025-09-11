package dao.admission;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.admission.Admission_consultDTO;
import util.DBHelper;
import util.Sql;

/*
 * 날짜 : 2025-09-05
 * 이름 : 한탁원
 * 내용 : 입학안내 - 공지사항 DAO 
 */
public class Admission_consultDAO extends DBHelper {

	private final static Admission_consultDAO INSTANCE = new Admission_consultDAO();

	public static Admission_consultDAO getInstance() {
		return INSTANCE;
	}

	private Admission_consultDAO() {
	}

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public int insert(Admission_consultDTO dto) {
		int id = 0;

		try {
			conn = getConnection();

			psmt = conn.prepareStatement(Sql.INSERT_ADMISSION_CONSULT);
			psmt.setString(1, dto.getCategory());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getWriter());
			psmt.setString(4, dto.getContent());
			psmt.executeUpdate();

			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return id;
	}

	// 게시글 개수 구하기
	public int selectCountTotal() {

		int total = 0;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_ADMISSION_CONSULT_COUNT_TOTAL);

			if (rs.next()) {
				total = rs.getInt(1);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return total;
	}

	public Admission_consultDTO select(int id) {
		return null;
	}

	public List<Admission_consultDTO> selectAll(int start) {
		List<Admission_consultDTO> dtoList = new ArrayList<Admission_consultDTO>();

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ADMISSION_CONSULT_ALL);
			psmt.setInt(1, start);

			rs = psmt.executeQuery();

			while (rs.next()) {
				Admission_consultDTO dto = new Admission_consultDTO();
				dto.setId(rs.getInt(1));
				dto.setCategory(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setWriter(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setCreated_at(rs.getDate(6));
				dto.setIs_answered(rs.getBoolean(7));
				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return dtoList;
	}

	public int selectCountSearch(String searchType, String keyword) {

		int total = 0;

		if (searchType == null || searchType.isBlank()) {
			return selectCountTotal();
		}

		StringBuilder sql = new StringBuilder(Sql.SELECT_ADMISSION_CONSULT_COUNT_SEARCH);

		if (searchType.equals("title")) {
			sql.append(Sql.SEARCH_WHERE_TITLE);
		} else if (searchType.equals("content")) {
			sql.append(Sql.SEARCH_WHERE_CONTENT);
		} else if (searchType.equals("writer")) {
			sql.append(Sql.SEARCH_WHERE_WRITER);
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

	public List<Admission_consultDTO> selectSearch(int start, String searchType, String keyword) {

		if (searchType == null || searchType.isBlank()) {
			return selectAll(start);
		}

		List<Admission_consultDTO> dtoList = new ArrayList<Admission_consultDTO>();
		StringBuilder sql = new StringBuilder(Sql.SELECT_ADMISSION_CONSULT_SEARCH);

		if (searchType.equals("title")) {
			sql.append(Sql.SEARCH_WHERE_TITLE);
		} else if (searchType.equals("content")) {
			sql.append(Sql.SEARCH_WHERE_CONTENT);
		} else if (searchType.equals("writer")) {
			sql.append(Sql.SEARCH_WHERE_WRITER);
		}
		sql.append(Sql.SEARCH_ORDER_ID);
		sql.append(Sql.SEARCH_OFFSET_ROW);

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, "%" + keyword + "%");
			psmt.setInt(2, start);

			rs = psmt.executeQuery();
			while (rs.next()) {
				Admission_consultDTO dto = new Admission_consultDTO();
				dto.setId(rs.getInt(1));
				dto.setCategory(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setWriter(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setCreated_at(rs.getDate(6));
				dto.setIs_answered(rs.getBoolean(7));
				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dtoList;
	}

	public void update(Admission_consultDTO dto) {

	}

	public void delete(int id) {

	}
}