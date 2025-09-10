package service;

import java.util.List;

import dao.DepartmentDAO;
import dto.college.DepartmentDTO;
import dto.college.DepartmentHeadDTO;
import dto.college.DepartmentListDTO;

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
	
	public List<DepartmentHeadDTO> findAllHeadByCollege(int col_id) {
		return dao.selectAllHeadByCollege(col_id);
	}
	
	public List<DepartmentListDTO> findAllWithInfo() {
		return dao.selectAllWithInfo();
	}

	public void modify(DepartmentDTO dto) {
		dao.update(dto);
	}

	public void remove(int id) {
		dao.delete(id);
	}
}