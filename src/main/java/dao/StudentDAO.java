package dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.StudentDTO;
import util.DBHelper;
import util.Sql;

/*
 * 날짜 : 2025-09-08
 * 이름 : 한탁원
 * 내용 : DAO 작성 예정
 */
public class StudentDAO extends DBHelper {
	
	private final static StudentDAO INSTANCE = new StudentDAO();
	public static StudentDAO getInstance() {
		return INSTANCE;
	}	
	
	private StudentDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insert(StudentDTO dto) {
		
	}
	
	/*
	 * 날짜 : 2025-09-09
	 * 이름 : 정순권
	 * 내용 : select 작성(로그인용)
	 */
	public StudentDTO select(StudentDTO dto) {
		StudentDTO stdDTO = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_STUDENT_BY_RRN);
			psmt.setInt(1, dto.getStd_id());
			psmt.setString(2, dto.getRrn());
			rs = psmt.executeQuery();
			if(rs.next()) {
				stdDTO = new StudentDTO();
				stdDTO.setStd_id(rs.getInt(1));
				stdDTO.setCol_id(rs.getInt(2));
				stdDTO.setDept_id(rs.getInt(3));
				stdDTO.setPro_id(rs.getInt(4));
				stdDTO.setRrn(rs.getString(5));
				stdDTO.setName_kor(rs.getString(6));
				stdDTO.setName_eng(rs.getString(7));
				stdDTO.setGender(rs.getString(8));
				stdDTO.setNationality(rs.getString(9));
				stdDTO.setTel(rs.getString(10));
				stdDTO.setEmail(rs.getString(11));
				stdDTO.setZip_code(rs.getString(12));
				stdDTO.setAddress_basic(rs.getString(13));
				stdDTO.setAddress_detail(rs.getString(14));
				stdDTO.setEntrance_date(rs.getDate(15));
				stdDTO.setGraduate_date(rs.getDate(16));
				stdDTO.setStatement(rs.getString(17));
				stdDTO.setGrade(rs.getString(18));
				stdDTO.setSemester(rs.getString(19));
				stdDTO.setCategory(rs.getString(20));
			}
			closeAll();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return stdDTO;
	}
	
	public List<StudentDTO> selectAll() {
		return null;
	}
	
	public void update(StudentDTO dto) {
		
	}
	
	public void delete(int ano) {
		
	}
}