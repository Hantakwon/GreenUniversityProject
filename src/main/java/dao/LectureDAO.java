package dao;

import java.util.List;

import org.eclipse.jdt.internal.compiler.batch.Main.Logger;
import org.slf4j.LoggerFactory;

import src.main.java.dto.LectureDTO;

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
	
	private LectureDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insert(LectureDTO dto) {
		
	}
	
	public LectureDTO select(int ano) {
		return null;
	}
	
	public List<LectureDTO> selectAll() {
		return null;
	}
	
	public void update(LectureDTO dto) {
		
	}
	
	public void delete(int ano) {
		
	}
}