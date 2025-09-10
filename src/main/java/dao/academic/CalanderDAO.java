package dao.academic;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.academic.CalanderDTO;
import dto.academic.FaqDTO;
import util.DBHelper;
import util.Sql;

/*
 * 날짜 : 2025-09-08
 * 이름 : 박효빈
 * 내용 : MySQL CalanderDAO 작성
 */
/*
 * 날짜 : 2025-09-10
 * 이름 : 정순권
 * 내용 : close All
 */
public class CalanderDAO extends DBHelper {
	private final static CalanderDAO INSTANCE = new CalanderDAO();

	public static CalanderDAO getInstance() {
		return INSTANCE;
	}

	private CalanderDAO() {
	}

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public void insert(CalanderDTO dto) {

	}

	public FaqDTO select(int id) {
		return null;
	}

	public List<CalanderDTO> selectAll() {
		List<CalanderDTO> dtoList = new ArrayList<CalanderDTO>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_CALANDER_ALL);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CalanderDTO dto = new CalanderDTO();
				dto.setId(rs.getInt("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setEnd_date(rs.getString("end_date"));
				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dtoList;
	}

	public void update(CalanderDTO dto) {

	}

	public void delete(int id) {

	}
}
