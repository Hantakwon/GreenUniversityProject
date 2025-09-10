package dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.admission.Admission_noticeDTO;
import dto.professor.ProfessorDTO;
import dto.professor.ProfessorInfoDTO;
import util.DBHelper;
import util.Sql;

/*
 * 날짜 : 2025-09-08
 * 이름 : 한탁원
 * 내용 : DAO 작성 예정
 */


public class ProfessorDAO extends DBHelper {
	
	private final static ProfessorDAO INSTANCE = new ProfessorDAO();
	public static ProfessorDAO getInstance() {
		return INSTANCE;
	}	
	
	private ProfessorDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insert(ProfessorDTO dto) {
		
	}
	
	
	/*
	 * 날짜 : 2025-09-09
	 * 이름 : 정순권
	 * 내용 : select 작성(로그인용)
	 */
	public ProfessorDTO select(ProfessorDTO dto) {
		ProfessorDTO profDTO = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_PROFESSOR_BY_RRN);
			psmt.setInt(1, dto.getPro_id());
			psmt.setString(2, dto.getRrn());
			rs = psmt.executeQuery();
			if(rs.next()) {
				profDTO = new ProfessorDTO();
				profDTO.setPro_id(rs.getString(1));
				profDTO.setPro_no(rs.getString(2));
				profDTO.setRrn(rs.getString(3));
				profDTO.setName_kor(rs.getString(4));
				profDTO.setName_eng(rs.getString(5));
				profDTO.setGender(rs.getString(6));
				profDTO.setNationality(rs.getString(7));
				profDTO.setTel(rs.getString(8));
				profDTO.setEmail(rs.getString(9));
				profDTO.setZip_code(rs.getString(10));
				profDTO.setAddress_basic(rs.getString(11));
				profDTO.setAddress_detail(rs.getString(12));
				profDTO.setStatement(rs.getString(13));
				profDTO.setPosition(rs.getString(14));
			}
			closeAll();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return profDTO;
	}
	
	public List<ProfessorDTO> selectAll() {
		return null;
	}
	
	public List<ProfessorInfoDTO> selectInfoAll(int start) {
		List<ProfessorInfoDTO> dtoList = new ArrayList<ProfessorInfoDTO>();

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_PROFESSOR_INFO_ALL);
			psmt.setInt(1, start);
			rs = psmt.executeQuery();

			while (rs.next()) {
				ProfessorInfoDTO dto = new ProfessorInfoDTO();
				dto.setProNo(rs.getString(1));
				dto.setProfessorName(rs.getString(2));
				dto.setRrn(rs.getString(3));
				dto.setTel(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setDepartmentName(rs.getString(6));
				dto.setPosition(rs.getString(7));
				dto.setStatement(rs.getString(8));
				dto.setAppointmentDate(rs.getDate(9));
				
				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return dtoList;
	}
	
	public void update(ProfessorDTO dto) {
		
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

	public List<ProfessorInfoDTO> selectSearch(int start, String searchType, String keyword) {

		if (searchType == null || searchType.isBlank()) {
		        return selectInfoAll(start);
		}
		 
		List<ProfessorInfoDTO> dtoList = new ArrayList<ProfessorInfoDTO>();
		StringBuilder sql = new StringBuilder(Sql.SELECT_PROFESSOR_INFO_ALL);

		if (searchType.equals("pro_name")) {
			sql.append(Sql.WHERE_PROFESSOR_NAME);
		} else if (searchType.equals("dept_name")) {
			sql.append(Sql.WHERE_DEPARTMENT_NAME);
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
				ProfessorInfoDTO dto = new ProfessorInfoDTO();
				dto.setProNo(rs.getString(1));
				dto.setProfessorName(rs.getString(2));
				dto.setRrn(rs.getString(3));
				dto.setTel(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setDepartmentName(rs.getString(6));
				dto.setPosition(rs.getString(7));
				dto.setStatement(rs.getString(8));
				dto.setAppointmentDate(rs.getDate(9));

				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dtoList;
	}
}