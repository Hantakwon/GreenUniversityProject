package dao;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.StudentDTO;
import dto.StudentListDTO;
import dto.college.DepartmentDTO;
import dto.professor.ProfessorInfoDTO;
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

	private StudentDAO() {
	}

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public void insert(StudentDTO dto) {
		try {
			conn = getConnection();
			conn.setAutoCommit(false);

			psmt = conn.prepareStatement(Sql.INSERT_STUDENT, Statement.RETURN_GENERATED_KEYS);

			int i = 1;
			psmt.setDate(i++, dto.getEntrance_date()); // 1) YEAR(?)
			psmt.setDate(i++, dto.getEntrance_date()); // 2) YEAR(?) in subquery
			psmt.setString(i++, dto.getRrn()); // 3
			psmt.setString(i++, dto.getName_kor()); // 4
			psmt.setString(i++, dto.getName_eng()); // 5
			psmt.setString(i++, dto.getGender()); // 6
			psmt.setString(i++, dto.getNationality()); // 7
			psmt.setString(i++, dto.getTel()); // 8
			psmt.setString(i++, dto.getEmail()); // 9
			psmt.setString(i++, dto.getZip_code()); // 10
			psmt.setString(i++, dto.getAddress_basic());// 11
			psmt.setString(i++, dto.getAddress_detail());// 12
			psmt.setDate(i++, dto.getEntrance_date()); // 13) entrance_date column
			psmt.setDate(i++, dto.getGraduate_date()); // 14
			psmt.setString(i++, dto.getCategory()); // 15
			psmt.setString(i++, dto.getGrade()); // 16
			psmt.setString(i++, dto.getSemester()); // 17
			psmt.setString(i++, dto.getStatement()); // 18
			psmt.setInt(i++, dto.getPro_id()); // 19) SELECT ... , ?, (pro_id)
			psmt.setInt(i++, dto.getDept_id()); // 20) WHERE d.dept_id = ?

			psmt.executeUpdate();
			conn.commit();

			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * 날짜 : 2025-09-09 이름 : 정순권 내용 : select 작성(로그인용)
	 */
	public StudentDTO select(StudentDTO dto) {
		StudentDTO stdDTO = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_STUDENT_BY_RRN);
			psmt.setInt(1, dto.getStd_id());
			psmt.setString(2, dto.getRrn());
			rs = psmt.executeQuery();
			if (rs.next()) {
				stdDTO = new StudentDTO();
				stdDTO.setStd_id(rs.getInt(1));
				stdDTO.setDept_id(rs.getInt(2));
				stdDTO.setPro_id(rs.getInt(3));
				stdDTO.setStd_no(rs.getString(4));
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
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return stdDTO;
	}

	public List<StudentDTO> selectAll() {
		List<StudentDTO> dtoList = new ArrayList<StudentDTO>();

		try {
			conn = getConnection();

			psmt = conn.prepareStatement(Sql.SELECT_STUDENT_ALL);

			rs = psmt.executeQuery();

			while (rs.next()) {
				StudentDTO dto = new StudentDTO();
				dto.setStd_id(rs.getInt(1));
				dto.setDept_id(rs.getInt(2));
				dto.setPro_id(rs.getInt(3));
				dto.setStd_no(rs.getString(4));
				dto.setRrn(rs.getString(5));
				dto.setName_kor(rs.getString(6));
				dto.setName_eng(rs.getString(7));
				dto.setGender(rs.getString(8));
				dto.setNationality(rs.getString(9));
				dto.setTel(rs.getString(10));
				dto.setEmail(rs.getString(11));
				dto.setZip_code(rs.getString(12));
				dto.setAddress_basic(rs.getString(13));
				dto.setAddress_detail(rs.getString(14));
				dto.setEntrance_date(rs.getDate(15));
				dto.setGraduate_date(rs.getDate(16));
				dto.setStatement(rs.getString(17));
				dto.setGrade(rs.getString(18));
				dto.setSemester(rs.getString(19));
				dto.setCategory(rs.getString(20));

				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return dtoList;
	}

	public List<StudentListDTO> selectInfoAll(int start) {
		List<StudentListDTO> dtoList = new ArrayList<StudentListDTO>();

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_STUDENT_INFO_ALL);
			psmt.setInt(1, start);
			rs = psmt.executeQuery();

			while (rs.next()) {
				StudentListDTO dto = new StudentListDTO();
				dto.setStd_no(rs.getString(1));
				dto.setName_kor(rs.getString(2));
				dto.setRrn(rs.getString(3));
				dto.setTel(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setDept_name(rs.getString(6));
				dto.setGrade(rs.getString(7));
				dto.setSemester(rs.getString(8));
				dto.setStatement(rs.getString(9));
				
				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return dtoList;
	}

	public void update(StudentDTO dto) {

	}

	public void delete(int ano) {

	}

	// 게시글 개수 구하기
	public int selectCountTotal() {

		int total = 0;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_STUDENT_COUNT);

			if (rs.next()) {
				total = rs.getInt(1);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return total;
	}

	public int selectCountSearch(String searchType, String keyword) {

		int total = 0;

		if (searchType == null || searchType.isBlank()) {
			return selectCountTotal();
		}

		StringBuilder sql = new StringBuilder(Sql.SELECT_STUDENT_COUNT_SEARCH);

		if (searchType.equals("pro_name")) {
			sql.append(Sql.WHERE_PROFESSOR_NAME);
		} else if (searchType.equals("dept_name")) {
			sql.append(Sql.WHERE_DEPARTMENT_NAME);
		}

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, "%" + keyword + "%");

			rs = psmt.executeQuery();

			if (rs.next()) {
				total = rs.getInt(1);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return total;
	}
}