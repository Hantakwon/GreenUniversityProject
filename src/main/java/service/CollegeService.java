package service;

import java.util.List;

import dao.CollegeDAO;
import dto.CollegeDTO;

public enum CollegeService {

	INSTANCE;

	private CollegeDAO dao = CollegeDAO.getInstance();

	public void register(CollegeDTO dto) {
		dao.insert(dto);
	}

	public CollegeDTO findById(int id) {
		return dao.select(id);
	}

	public List<CollegeDTO> findAll() {
		return dao.selectAll();
	}

	public void modify(CollegeDTO dto) {
		dao.update(dto);
	}

	public void remove(int id) {
		dao.delete(id);
	}
}