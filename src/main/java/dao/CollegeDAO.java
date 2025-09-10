package dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.CollegeDTO;
import util.DBHelper;
import util.Sql;

/*
 * 날짜 : 2025-09-08
 * 이름 : 한탁원
 * 내용 : DAO 작성 예정
 */
public class CollegeDAO extends DBHelper {
	
	private final static CollegeDAO INSTANCE = new CollegeDAO();
	public static CollegeDAO getInstance() {
		return INSTANCE;
	}	
	
	private CollegeDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insert(CollegeDTO dto) {
		
	}
	
	public CollegeDTO select(int ano) {
		
		CollegeDTO dto = new CollegeDTO();
		
		try {
			conn = getConnection();
			
			psmt = conn.prepareStatement(Sql.SELECT_COLLEGE_ALL);

			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setCol_id(rs.getInt(1));
				dto.setName_kor(rs.getString(2));
				dto.setName_eng(rs.getString(3));
				dto.setTitle(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setImage(rs.getString(6));
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dto;
	}
	
	public List<CollegeDTO> selectAll() {
		List<CollegeDTO> dtoList = new ArrayList<CollegeDTO>();

		try {
			conn = getConnection();
			
			psmt = conn.prepareStatement(Sql.SELECT_COLLEGE_ALL);

			rs = psmt.executeQuery();

			while (rs.next()) {
				CollegeDTO dto = new CollegeDTO();
				dto.setCol_id(rs.getInt(1));
				dto.setName_kor(rs.getString(2));
				dto.setName_eng(rs.getString(3));
				dto.setTitle(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setImage(rs.getString(6));
				
				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dtoList;
	}
	
	public void update(CollegeDTO dto) {
		
	}
	
	public void delete(int ano) {
		
	}
}