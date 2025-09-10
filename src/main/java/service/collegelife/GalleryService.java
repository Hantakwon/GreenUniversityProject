package service.collegelife;
/*
 * 날짜 : 2025-09-09
 * 이름 : 박효빈
 * 내용 : MySQL GalleryService 작성
 */

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.collegelife.GalleryDAO;
import dto.collegelife.GalleryDTO;
import dto.collegelife.GalleryPagenationDTO;

public enum GalleryService {
	INSTANCE;

	private GalleryDAO dao = GalleryDAO.getInstance();

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	private GalleryDAO galleryDAO = GalleryDAO.getInstance();
	
	public void insert(GalleryDTO dto) {

	}

	public GalleryDTO select(int gno) {
		return null;
	}

	public List<GalleryDTO> findAll() {
		return dao.selectAll();
	}

	public void update(GalleryDTO dto) {

	}

	public void delete(int gno) {

	}
	
	// 전체 게시물 수 
	public int getTotalCount() {
		return dao.selectCountTotal();
	}
	
	// 페이징 목록
	public List<GalleryDTO> getGalleryList(int start, int pageSize) {
        return dao.selectGalleryListByPaging(start, pageSize);
    }	
	
	

	

		
		
	

}
