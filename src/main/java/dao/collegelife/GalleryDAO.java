package dao.collegelife;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.collegelife.GalleryDTO;
import util.DBHelper;
import util.Sql;

/*
 * 날짜 : 2025-09-09
 * 이름 : 박효빈
 * 내용 : MySQL GalleryDAO 작성
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

	public List<GalleryDTO> selectAll() {

		List<GalleryDTO> dtoList = new ArrayList<GalleryDTO>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_GALLERY_ALL);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				GalleryDTO dto = new GalleryDTO();
				dto.setGno(rs.getInt("gno"));
				dto.setTitle(rs.getString("title"));
				dto.setImage_path(rs.getString("image_path"));
				//dto.setRdcnt(rs.getInt("rdcnt"));
				dto.setTitle(rs.getString("title"));
				dto.setTitle(rs.getString("title"));
			}

		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}

	public void update(GalleryDTO dto) {

	}

	public void delete(int gno) {

	}

}
