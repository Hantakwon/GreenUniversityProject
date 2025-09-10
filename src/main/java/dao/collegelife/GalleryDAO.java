package dao.collegelife;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.collegelife.GalleryDTO;
import dto.collegelife.GalleryPagenationDTO;
import util.DBHelper;
import util.Sql;

/*
 * 날짜 : 2025-09-10
 * 이름 : 박효빈
 * 내용 : MySQL GalleryDAO 
 */
public class GalleryDAO extends DBHelper {
	private final static GalleryDAO INSTANCE = new GalleryDAO();

	public static GalleryDAO getInstance() {
		return INSTANCE;
	}

	private GalleryDAO() {
	}

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public void insert(GalleryDTO dto) {

	}

	public GalleryDTO select(int gno) {
		return null;
	}
	
	// view 
	public List<GalleryDTO> selectAll() {

		List<GalleryDTO> dtoList = new ArrayList<GalleryDTO>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_GALLERY_ALL);
			rs = psmt.executeQuery();

			while (rs.next()) {
				GalleryDTO dto = new GalleryDTO();
				dto.setGno(rs.getInt("gno"));
				dto.setTitle(rs.getString("title"));
				dto.setImage_path(rs.getString("image_path"));
				dto.setRdcnt(rs.getInt("rdcnt"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setWriter(rs.getString("writer"));
				dtoList.add(dto);
			}

		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dtoList;
	}

	public void update(GalleryDTO dto) {

	}

	public void delete(int gno) {

	}

	// 1.전체 게시물 수 조회
	public int selectCountTotal() {

		int total = 0;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_GALLERY_COUNT_TOTAL_GALLERY);
			rs = psmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);
			}
			closeAll();

		} catch (Exception e) {
			logger.error("오류 메세지 :  " + e.getMessage());
		}
		return total;

	}
	// 2.페이징에 따른 게시물 목록 조회

	public List<GalleryDTO> selectGalleryListByPaging(int start, int pageSize) {
		List<GalleryDTO> galleryList = new ArrayList<GalleryDTO>();

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_GALLERY_LIST_PAGING);
			psmt.setInt(1, start);
			psmt.setInt(2, pageSize);
			rs = psmt.executeQuery();

			while (rs.next()) {
				GalleryDTO gallery = new GalleryDTO();
				gallery.setGno(rs.getInt("gno"));
				gallery.setTitle(rs.getString("title"));
				gallery.setImage_path(rs.getString("image_path"));
				gallery.setRdcnt(rs.getInt("rdcnt"));
				gallery.setReg_date(rs.getString("reg_date"));
				gallery.setContent(rs.getString("content"));
				gallery.setWriter(rs.getString("writer"));
				galleryList.add(gallery);

			}
			closeAll();

		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return galleryList;
	}


	// 1. 전체 게시물 수 조회
	public int countTotalGallery() {
		int total = 0;

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_GALLERY_COUNT_TOTAL_GALLERY);

			if (rs.next()) {
				total = rs.getInt(1); // 현재6
			}
			closeAll();

		} catch (Exception e) {

			logger.error(e.getMessage());
		}
		return total;
	}
	
	// 페이징에 따른 게시물 목록 조회
	public List<GalleryDTO> selectGalleryList(int start){
		List<GalleryDTO> dtoList = new ArrayList<>();
		try {
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return null;
	}
}


