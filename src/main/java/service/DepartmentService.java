package service;

import java.util.List;

import src.main.java.dao.DepartmentDAO;
import src.main.java.dto.DepartmentDTO;

public enum DepartmentService {

	INSTANCE;

	private DepartmentDAO dao = DepartmentDAO.getInstance();

	public void register(DepartmentDTO dto) {
		dao.insert(dto);
	}

	public DepartmentDTO findByPass(int id) {
		return dao.select(id);
	}

	public List<DepartmentDTO> findAll() {
		return dao.selectAll();
	}

	public void modify(DepartmentDTO dto) {
		dao.update(dto);
	}

	public void remove(int id) {
		dao.delete(id);
	}
}