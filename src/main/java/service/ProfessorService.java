package service;

import java.util.List;

import src.main.java.dao.ProfessorDAO;
import src.main.java.dto.ProfessorDTO;

public enum ProfessorService {

	INSTANCE;

	private ProfessorDAO dao = ProfessorDAO.getInstance();

	public void register(ProfessorDTO dto) {
		dao.insert(dto);
	}

	public ProfessorDTO findByPass(int id) {
		return dao.select(id);
	}

	public List<ProfessorDTO> findAll() {
		return dao.selectAll();
	}

	public void modify(ProfessorDTO dto) {
		dao.update(dto);
	}

	public void remove(int id) {
		dao.delete(id);
	}
}