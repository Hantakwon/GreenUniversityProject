package service;

import java.util.List;

import dao.StudentDAO;
import dto.StudentDTO;

public enum StudentService {

	INSTANCE;

	private StudentDAO dao = StudentDAO.getInstance();

	public void register(StudentDTO dto) {
		dao.insert(dto);
	}

	public StudentDTO findByPass(int id) {
		return dao.select(id);
	}

	public List<StudentDTO> findAll() {
		return dao.selectAll();
	}

	public void modify(StudentDTO dto) {
		dao.update(dto);
	}

	public void remove(int id) {
		dao.delete(id);
	}
}