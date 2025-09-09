package service.academic;
/*
 * 날짜 : 2025-09-08
 * 이름 : 박효빈
 * 내용 : MySQL CalanderService 작성했음
 */

import java.util.List;

import dao.academic.CalanderDAO;
import dto.academic.CalanderDTO;
import dto.academic.FaqDTO;

public enum CalanderService {
	
	INSTANCE;
	
	private CalanderDAO dao = CalanderDAO.getInstance();
	
	public void insert(CalanderDTO dto) {

	}

	public FaqDTO findById(int id) {
		return null;
	}

	public List<CalanderDTO> findAll() {
		return dao.selectAll();
	}

	public void update(CalanderDTO dto) {

	}

	public void delete(int id) {

	}
	
	
	
	
	

}
