package service;

import java.util.List;

import dao.LectureDAO;
import dto.LectureDTO;

public enum LectureService {

	INSTANCE;

	private LectureDAO dao = LectureDAO.getInstance();

	public void register(LectureDTO dto) {
		dao.insert(dto);
	}

	public LectureDTO findByPass(int id) {
		return dao.select(id);
	}

	public List<LectureDTO> findAll() {
		return dao.selectAll();
	}

	public void modify(LectureDTO dto) {
		dao.update(dto);
	}

	public void remove(int id) {
		dao.delete(id);
	}
}