package service;

import java.util.List;

import dao.manageDAO;
import dto.manage.LectureManageDTO;
/*
 * 날짜 :
 * 이름 : 우지희
 * 내용 : 강의등록
 */

public enum ManageService {
	
	INSTANCE;
	
	private manageDAO dao = manageDAO.getInstance();
	
	public void registerLecture(LectureManageDTO dto) {
		dao.insertLecture(dto);
	}
	
	public int getNextSequence(String deptCode, String year, String semester) {
	    return dao.getNextSequence(deptCode, year, semester);
	}
	
	public LectureManageDTO findLectureById(int lecNo) {
		return dao.selectLecture(lecNo);
	}
	public List<LectureManageDTO> findAllLecture() {
		return dao.selectAllLecture();
	}
	public void modifyLecture(LectureManageDTO dto) {}
	public void deleteLecture(int lecno) {}

}
