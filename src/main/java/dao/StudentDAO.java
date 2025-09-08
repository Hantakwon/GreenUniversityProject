package dao;

import java.util.List;

import org.eclipse.jdt.internal.compiler.batch.Main.Logger;
import org.slf4j.LoggerFactory;

import src.main.java.dto.StudentDTO;

/*
 * 날짜 : 2025-09-08
 * 이름 : 한탁원
 * 내용 : DAO 작성 예정
 */
public class StudentDAO extends DBHelper {
	
	private final static StudentDAO INSTANCE = new StudentDAO();
	public static StudentDAO getInstance() {
		return INSTANCE;
	}	
	
	private StudentDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insert(StudentDTO dto) {
		
	}
	
	public StudentDTO select(int ano) {
		return null;
	}
	
	public List<StudentDTO> selectAll() {
		return null;
	}
	
	public void update(StudentDTO dto) {
		
	}
	
	public void delete(int ano) {
		
	}
}