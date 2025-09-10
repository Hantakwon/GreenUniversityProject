package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.professor.ProfessorAcademicDTO;
import dto.professor.ProfessorDTO;
import dto.professor.ProfessorInfoDTO;
import dto.professor.ProfessorRoleDTO;
import util.DBHelper;
import util.Sql;

/*
 * 날짜 : 2025-09-08
 * 이름 : 한탁원
 * 내용 : DAO 작성 예정
 */

public class ProfessorDAO extends DBHelper {

	private final static ProfessorDAO INSTANCE = new ProfessorDAO();

	public static ProfessorDAO getInstance() {
		return INSTANCE;
	}

	private ProfessorDAO() {
	}

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public int insert(ProfessorDTO professorDto, ProfessorAcademicDTO academicDto, ProfessorRoleDTO roleDto) {
		int proId = 0;

		// 0) 필수값 체크
		if (roleDto == null || roleDto.getDept_id() <= 0)
			throw new IllegalArgumentException("dept_id가 필요합니다.");
		if (academicDto == null || academicDto.getAppointment_at() == null)
			throw new IllegalArgumentException("appointment_date(임용일)가 필요합니다.");

		final int deptId = roleDto.getDept_id();
		final String roleName = (roleDto.getRole() == null || roleDto.getRole().isBlank()) ? "교수" : roleDto.getRole();

		final java.sql.Date appointmentDate = academicDto.getAppointment_at();

		// 학력 입력이 의미 있는지 판단
		final boolean hasAcademic = (academicDto.getSchool() != null && !academicDto.getSchool().isBlank())
				|| (academicDto.getMajor() != null && !academicDto.getMajor().isBlank())
				|| (academicDto.getDegree() != null && !academicDto.getDegree().isBlank())
				|| (academicDto.getGraduation_at() != null);

		try {
			conn = getConnection();
			conn.setAutoCommit(false);

			psmt = conn.prepareStatement(Sql.INSERT_PROFESSOR, Statement.RETURN_GENERATED_KEYS);
			int i = 1;
			psmt.setDate(i++, appointmentDate); // YEAR(?)
			psmt.setString(i++, professorDto.getRrn());
			psmt.setString(i++, professorDto.getName_kor());
			psmt.setString(i++, professorDto.getName_eng());
			psmt.setString(i++, professorDto.getGender());
			psmt.setString(i++, professorDto.getNationality());
			psmt.setString(i++, professorDto.getTel());
			psmt.setString(i++, professorDto.getEmail());
			psmt.setString(i++, professorDto.getZip_code());
			psmt.setString(i++, professorDto.getAddress_basic());
			psmt.setString(i++, professorDto.getAddress_detail());
			psmt.setString(i++, professorDto.getStatement());
			psmt.setString(i++, professorDto.getPosition());
			psmt.setDate(i++, appointmentDate); // LIKE YEAR(?)
			psmt.setInt(i++, deptId); // WHERE d.dept_id = ?

			int rows = psmt.executeUpdate();
			if (rows != 1)
				throw new RuntimeException("교수 INSERT 실패");

			try (ResultSet keys = psmt.getGeneratedKeys()) {
				if (keys.next())
					proId = keys.getInt(1);
			}
			psmt.close();

			// 2) 학력 INSERT (옵션)
			if (hasAcademic) {
				psmt = conn.prepareStatement(Sql.INSERT_PROFESSOR_ACADEMIC);
				int j = 1;
				psmt.setInt(j++, proId);
				psmt.setString(j++, academicDto.getSchool());
				psmt.setString(j++, academicDto.getMajor());
				psmt.setDate(j++, academicDto.getGraduation_at()); // null 가능
				psmt.setString(j++, academicDto.getDegree());
				psmt.setDate(j++, appointmentDate); // TB_Professor_Academic.appointment_date
				psmt.executeUpdate();
				psmt.close();
			}

			// 3) 역할 INSERT
			psmt = conn.prepareStatement(Sql.INSERT_PROFESSOR_ROLE);
			int k = 1;
			psmt.setInt(k++, proId);
			psmt.setInt(k++, deptId);
			psmt.setString(k++, roleName);
			psmt.executeUpdate();
			psmt.close();

			conn.commit();
			return proId;

		} catch (Exception e) {
			try {
				if (conn != null)
					conn.rollback();
			} catch (Exception ignore) {
			}
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if (conn != null)
					conn.setAutoCommit(true);
			} catch (Exception ignore) {
			}
			try {
				closeAll();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/*
	 * 날짜 : 2025-09-09 이름 : 정순권 내용 : select 작성(로그인용)
	 */
	public ProfessorDTO select(ProfessorDTO dto) {
		ProfessorDTO profDTO = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_PROFESSOR_BY_RRN);
			psmt.setInt(1, dto.getPro_id());
			psmt.setString(2, dto.getRrn());
			rs = psmt.executeQuery();
			if (rs.next()) {
				profDTO = new ProfessorDTO();
				profDTO.setPro_id(rs.getString(1));
				profDTO.setPro_no(rs.getString(2));
				profDTO.setRrn(rs.getString(3));
				profDTO.setName_kor(rs.getString(4));
				profDTO.setName_eng(rs.getString(5));
				profDTO.setGender(rs.getString(6));
				profDTO.setNationality(rs.getString(7));
				profDTO.setTel(rs.getString(8));
				profDTO.setEmail(rs.getString(9));
				profDTO.setZip_code(rs.getString(10));
				profDTO.setAddress_basic(rs.getString(11));
				profDTO.setAddress_detail(rs.getString(12));
				profDTO.setStatement(rs.getString(13));
				profDTO.setPosition(rs.getString(14));
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return profDTO;
	}

	public List<ProfessorDTO> selectAll() {
		return null;
	}

	public List<ProfessorInfoDTO> selectInfoAll(int start) {
		List<ProfessorInfoDTO> dtoList = new ArrayList<ProfessorInfoDTO>();

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_PROFESSOR_INFO_ALL);
			psmt.setInt(1, start);
			rs = psmt.executeQuery();

			while (rs.next()) {
				ProfessorInfoDTO dto = new ProfessorInfoDTO();
				dto.setProNo(rs.getString(1));
				dto.setProfessorName(rs.getString(2));
				dto.setRrn(rs.getString(3));
				dto.setTel(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setDepartmentName(rs.getString(6));
				dto.setPosition(rs.getString(7));
				dto.setStatement(rs.getString(8));
				dto.setAppointmentDate(rs.getDate(9));

				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return dtoList;
	}

	public void update(ProfessorDTO dto) {

	}

	public void delete(int ano) {

	}

	// 게시글 개수 구하기
	public int selectCountTotal() {

		int total = 0;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_PROFESSOR_COUNT);

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

		StringBuilder sql = new StringBuilder(Sql.SELECT_PROFESSOR_COUNT_SEARCH);

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

	public List<ProfessorInfoDTO> selectSearch(int start, String searchType, String keyword) {

		if (searchType == null || searchType.isBlank()) {
			return selectInfoAll(start);
		}

		List<ProfessorInfoDTO> dtoList = new ArrayList<ProfessorInfoDTO>();
		StringBuilder sql = new StringBuilder(Sql.SELECT_PROFESSOR_INFO_ALL);

		if (searchType.equals("pro_name")) {
			sql.append(Sql.WHERE_PROFESSOR_NAME);
		} else if (searchType.equals("dept_name")) {
			sql.append(Sql.WHERE_DEPARTMENT_NAME);
		}

		sql.append(Sql.SEARCH_ORDER_ID);
		sql.append(Sql.SEARCH_OFFSET_ROW);

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, "%" + keyword + "%");
			psmt.setInt(2, start);

			rs = psmt.executeQuery();
			while (rs.next()) {
				ProfessorInfoDTO dto = new ProfessorInfoDTO();
				dto.setProNo(rs.getString(1));
				dto.setProfessorName(rs.getString(2));
				dto.setRrn(rs.getString(3));
				dto.setTel(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setDepartmentName(rs.getString(6));
				dto.setPosition(rs.getString(7));
				dto.setStatement(rs.getString(8));
				dto.setAppointmentDate(rs.getDate(9));

				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dtoList;
	}
}