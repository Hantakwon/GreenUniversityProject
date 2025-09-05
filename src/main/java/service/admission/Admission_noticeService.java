package service.admission;

import java.util.List;

import dao.PagenationDTO;
import dao.admission.Admission_noticeDAO;
import dto.admission.Admission_noticeDTO;

/*
 * 날짜 : 2025-09-05
 * 이름 : 한탁원
 * 내용 : 입학안내 - 공지사항 서비스
 */
public enum Admission_noticeService {

	INSTANCE;

	private Admission_noticeDAO dao = Admission_noticeDAO.getInstance();

	public void register(Admission_noticeDTO dto) {
		dao.insert(dto);
	}

	public Admission_noticeDTO findByPass(int id) {
		return dao.select(id);
	}

	public List<Admission_noticeDTO> findAll(int start) {
		return dao.selectAll(start);
	}
	
	public List<Admission_noticeDTO> findAllSearch(int start, String searchType, String keyword) {
		return dao.selectSearch(start, searchType, keyword);
	}

	public void modify(Admission_noticeDTO dto) {
		dao.update(dto);
	}

	public void remove(int id) {
		dao.delete(id);
	}

	// 게시판 페이지네이션 처리 메서드
	public PagenationDTO getPagenationDTO(String pg, String searchType, String keyword) {

		int total = 0;
		int count = 5; // 한 페이지에 표시할 개수
		
		if (keyword == null) {
			// 전체 게시물 갯수 구하기
			total = dao.selectCountTotal();
		} else {
			total = dao.selectCountSearch(searchType, keyword);
		}

		// 마지막 페이지번호 구하기
		int lastPageNum = 0;

		if (total % count == 0) {
			lastPageNum = total / count; // 5으로 나누어 떨어지면
		} else {
			lastPageNum = total / count + 1; // 5으로 나누어 떨어지지 않음
		}

		// 현재 페이지 번호 시작값 구하기
		int currentPage = 1;

		if (pg != null) {
			currentPage = Integer.parseInt(pg);
		}

		int start = (currentPage - 1) * count;

		// 현재 페이지 그룹 구하기
		int currentPageGroup = (int) Math.ceil(currentPage / (double)count);
		int pageGroupStart = (currentPageGroup - 1) * count + 1;
		int pageGroupEnd = currentPageGroup * count;

		if (pageGroupEnd > lastPageNum) {
			pageGroupEnd = lastPageNum;
		}

		// 현재 페이지 글 시작 번호 구하기
		int currentPageStartNum = total - (currentPage - 1) * count;

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
}