package service;

import java.util.List;

import dao.PagenationDTO;
import dao.manageDAO;
/*
 * 날짜 :
 * 이름 : 우지희
 * 내용 : 강의등록
 */
import dto.LectureManageDTO;

public enum ManageService {
	
	INSTANCE;
	
	private manageDAO dao = manageDAO.getInstance();
	
	// 게시판 페이지네이션 처리 메서드
		public PagenationDTO getPagenationDTO(String pg, String searchType, String keyword) {
			
			int total = 0;
			
			if(keyword == null) {
				// 전체 게시물 갯수 구하기
				total = dao.selectCountTotal();
			}else {
				total = dao.selectCountSearch(searchType, keyword);
			}
					
			// 마지막 페이지번호 구하기
			int lastPageNum = 0;
			
			if(total % 10 == 0) {
				lastPageNum = total / 10;	  // 10으로 나누어 떨어지면
			}else {
				lastPageNum = total / 10 + 1; // 10으로 나누어 떨어지지 않음
			}		
		
			// 현재 페이지 번호 시작값 구하기
			int currentPage = 1;
			
			if(pg != null) {
				currentPage = Integer.parseInt(pg);	
			}
			
			int start = (currentPage - 1) * 10;		
			
			// 현재 페이지 그룹 구하기
			int currentPageGroup = (int) Math.ceil(currentPage / 10.0);
			int pageGroupStart = (currentPageGroup - 1) * 10 + 1;
			int pageGroupEnd = currentPageGroup * 10;
			
			if(pageGroupEnd > lastPageNum) {
				pageGroupEnd = lastPageNum;
			}
			
			// 현재 페이지 글 시작 번호 구하기
			int currentPageStartNum = total - (currentPage - 1) * 10;
			
			PagenationDTO dto = new PagenationDTO();
			dto.setTotal(total);
			dto.setStart(start);
			dto.setCurrentPage(currentPage);
			dto.setCurrentPageStartNum(currentPageStartNum);
			dto.setLastPageNum(lastPageNum);
			dto.setPageGroupStart(pageGroupStart);
			dto.setPageGroupEnd(pageGroupEnd);
			
			return dto;
		}
	
	public void registerLecture(LectureManageDTO dto) {
		dao.insertLecture(dto);
	}
	
	public int getNextSequence(String deptCode, String year, String semester) {
	    return dao.getNextSequence(deptCode, year, semester);
	}
	
	public LectureManageDTO findLectureById(int lec_no) {
		return dao.selectLecture(lec_no);
	}
	public List<LectureManageDTO> findAll() {
		return dao.selectAllLecture();
	}
	public List<LectureManageDTO> selectAllOpeState(){
		return dao.selectAllOpeState();
	}
	public void modifyLecture(LectureManageDTO dto) {}
	public void deleteLecture(int lecno) {}

}
