package service.academic;

import java.util.List;

import dao.academic.FaqDAO;
import dto.academic.FaqDTO;

/*
 * 날짜 : 2025-09-08
 * 이름 : 박효빈
 * 내용 : 학사안내 - Faq 서비스 findAll() 구현
 */
public enum FaqService {

	INSTANCE;

	private FaqDAO dao = FaqDAO.getInstance();

	public void insert(FaqDTO dto) {

	}

	public FaqDTO select(int id) {
		return null;
	}

	public List<FaqDTO> findAll() { //0908 변경
		return dao.selectAll();
	}

	public void update(FaqDTO dto) {

	}

	public void delete(int id) {

	}
}
