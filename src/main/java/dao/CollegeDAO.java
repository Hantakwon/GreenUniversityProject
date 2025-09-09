package dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.CollegeDTO;
import util.DBHelper;

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
		return null;
	}
	
	public List<CollegeDTO> selectAll() {
		return null;
	}
	
	public void update(CollegeDTO dto) {
		
	}
	
	public void delete(int ano) {
		
	}
}