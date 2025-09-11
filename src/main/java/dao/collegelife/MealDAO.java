package dao.collegelife;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.collegelife.GalleryDTO;
import dto.collegelife.MealDTO;
import util.DBHelper;
import util.Sql;

/*
 * 날짜 : 2025-09-10
 * 이름 : 박효빈
 * 내용 : MySQL MealDAO 
 */
public class MealDAO extends DBHelper {
	private final static MealDAO INSTANCE = new MealDAO();

	public static MealDAO getInstance() {
		return INSTANCE;
	}

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public void insert(MealDTO dto) {

	}

	public MealDTO select(int meal_id) {
		return null;
	}

	// view

	public List<MealDTO> seleteAll() {
		List<MealDTO> dtoList = new ArrayList<MealDTO>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_MEAL_ALL);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MealDTO dto = new MealDTO();
				dto.setMeal_id(rs.getInt("meal_id"));
				LocalDate mealLocalDate = rs.getDate("meal_date").toLocalDate();
                dto.setMeal_date(mealLocalDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
				dto.setMeal_type(rs.getString("meal_type"));
				dto.setMeal_name(rs.getString("meal_name"));
				dto.setMeal_price(rs.getString("meal_price"));
				dto.setCreated_at(rs.getString("created_at"));
				dtoList.add(dto);
			}
			closeAll();

		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dtoList;
	}

	public void update(MealDTO dto) {

	}

	public void delete(int meal_id) {

	}

}
