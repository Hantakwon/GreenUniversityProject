package dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.ProfessorDTO;
import util.DBHelper;

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
	
	public ProfessorDTO select(int ano) {
		return null;
	}
	
	public List<ProfessorDTO> selectAll() {
		return null;
	}
	
	public void update(ProfessorDTO dto) {
		
	}
	
	public void delete(int ano) {
		
	}
}