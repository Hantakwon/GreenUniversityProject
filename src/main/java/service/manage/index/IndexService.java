package service.manage.index;

import java.util.List;

import dao.manage.index.IndexDAO;
import dto.manage.index.IndexOperateDTO;
import dto.manage.index.IndexStudentSummaryByDeptDTO;
import dto.manage.index.IndexStudentSummaryByGradeDTO;

public enum IndexService {

	INSTANCE;

	private IndexDAO dao = IndexDAO.getInstance();
	
	public IndexOperateDTO findOperate() {
		return dao.selectOperate();
	}

	public List<IndexStudentSummaryByGradeDTO> findStudentSummaryByGrade() {
		return dao.selectStudentSummaryByGrade();
	}

	public List<IndexStudentSummaryByDeptDTO> findStudentSummaryByDept() {
		return dao.selectStudentSummaryByDept();
	}
}