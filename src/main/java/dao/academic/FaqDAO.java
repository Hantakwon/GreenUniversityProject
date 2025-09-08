package dao.academic;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.LectureDTO;
import dto.academic.FaqDTO;
import util.DBHelper;
import util.Sql;

/*
 * 날짜 : 2025-09-08
 * 이름 : 박효빈
 * 내용 : 임시 FaqDAO 작성 
 */
public class FaqDAO extends DBHelper {
	private final static FaqDAO INSTANCE = new FaqDAO();

	public static FaqDAO getInstance() {
		return INSTANCE;
	}

	private FaqDAO() {
	}

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public void insert(FaqDTO dto) {

	}

	public FaqDTO select(int id) {
		return null;
	}

	public List<FaqDTO> selectAll() { // 2025.09.08 박효빈 구현
		List<FaqDTO> dtoList = new ArrayList<FaqDTO>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_FAQ_ALL);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				FaqDTO dto = new FaqDTO();
				dto.setId(rs.getInt("id"));
				dto.setCategory(rs.getString("category"));
				dto.setQuestion(rs.getString("question"));
				dto.setAnswer(rs.getString("answer"));
				dto.setCreated_at(rs.getString("created_at"));
				dtoList.add(dto);
			}

		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dtoList;
	}

	public void update(FaqDTO dto) {

	}

	public void delete(int id) {

	}

}
