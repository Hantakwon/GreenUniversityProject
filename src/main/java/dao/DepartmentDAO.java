package dao;

import java.util.List;

import org.eclipse.jdt.internal.compiler.batch.Main.Logger;
import org.slf4j.LoggerFactory;

import src.main.java.dto.DepartmentDTO;

/*
 * 날짜 : 2025-09-08
 * 이름 : 한탁원
 * 내용 : DAO 작성 예정
 */
public class DepartmentDAO extends DBHelper {
	
	private final static DepartmentDAO INSTANCE = new DepartmentDAO();
	public static DepartmentDAO getInstance() {
		return INSTANCE;
	}	
	
	private DepartmentDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insert(DepartmentDTO dto) {
		
	}
	
	public DepartmentDTO select(int ano) {
		return null;
	}
	
	public List<DepartmentDTO> selectAll() {
		return null;
	}
	
	public void update(DepartmentDTO dto) {
		
	}
	
	public void delete(int ano) {
		
	}
}