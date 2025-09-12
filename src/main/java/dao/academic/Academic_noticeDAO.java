package dao.academic;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.academic.Academic_noticeDTO;
import util.DBHelper;
import util.Sql;

/*
 * 날짜 : 2025-09-04
 * 이름 : 한탁원
 * 내용 : 학사안내 - 공지사항 DAO 
 */
public class Academic_noticeDAO extends DBHelper {

	private final static Academic_noticeDAO INSTANCE = new Academic_noticeDAO();

	public static Academic_noticeDAO getInstance() {
		return INSTANCE;
	}

	private Academic_noticeDAO() {
	}

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public int insert(Academic_noticeDTO dto) {
		int id = 0;

		try {
			conn = getConnection();
			conn.setAutoCommit(false);

			psmt = conn.prepareStatement(Sql.INSERT_ACADEMIC_NOTICE);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getWriter());
			psmt.executeUpdate();

			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_ACADEMIC_NOTICE_MAX_ID);

			if (rs.next()) {
				id = rs.getInt(1);
			}

			conn.commit();
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());

			try {
				conn.rollback();
			} catch (SQLException e1) {
				logger.error(e1.getMessage());
			}
		}

		return id;
	}

	// 게시글 개수 구하기
	public int selectCountTotal() {

		int total = 0;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_ACADEMIC_NOTICE_COUNT_TOTAL);

			if (rs.next()) {
				total = rs.getInt(1);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return total;
	}

	public Academic_noticeDTO select(int id) {
		return null;
	}

	public List<Academic_noticeDTO> selectAll(int start) {
		List<Academic_noticeDTO> dtoList = new ArrayList<Academic_noticeDTO>();

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ACADEMIC_NOTICE_ALL);
			psmt.setInt(1, start);

			rs = psmt.executeQuery();

			while (rs.next()) {
				Academic_noticeDTO dto = new Academic_noticeDTO();
				dto.setId(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setCreated_at(rs.getDate(4));
				dto.setWriter(rs.getString(5));
				dto.setViews(rs.getInt(6));

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

		StringBuilder sql = new StringBuilder(Sql.SELECT_ACADEMIC_NOTICE_COUNT_SEARCH);

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

	public List<Academic_noticeDTO> selectSearch(int start, String searchType, String keyword) {

		List<Academic_noticeDTO> dtoList = new ArrayList<Academic_noticeDTO>();
		StringBuilder sql = new StringBuilder(Sql.SELECT_ACADEMIC_NOTICE_SEARCH);

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
				Academic_noticeDTO dto = new Academic_noticeDTO();
				dto.setId(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setCreated_at(rs.getDate(4));
				dto.setWriter(rs.getString(5));
				dto.setViews(rs.getInt(6));
				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dtoList;
	}

	public void update(Academic_noticeDTO dto) {

	}

	public void delete(int id) {

	}
}