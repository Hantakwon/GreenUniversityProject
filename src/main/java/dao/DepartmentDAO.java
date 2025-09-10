package dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.college.DepartmentDTO;
import dto.college.DepartmentHeadDTO;
import dto.college.DepartmentListDTO;
import util.DBHelper;
import util.Sql;

/*
 * 날짜 : 2025-09-08
 * 이름 : 한탁원
 * 내용 : DAO 작성 예정
 */
public class DepartmentDAO extends DBHelper {

	private final static DepartmentDAO INSTANCE = new DepartmentDAO();

	public static DepartmentDAO getInstance() {
		return INSTANCE;
	}

	private DepartmentDAO() {
	}

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public void insert(DepartmentDTO dto) {

	}

	public DepartmentDTO select(int ano) {
		return null;
	}

	public List<DepartmentDTO> selectAll() {
		return null;
	}

	public List<DepartmentHeadDTO> selectAllHeadByCollege(int col_id) {
		List<DepartmentHeadDTO> dtoList = new ArrayList<DepartmentHeadDTO>();

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_DEPARTMENT_ALL_HEAD_WHERE_COLLEGE);
			psmt.setString(1, "학과장");
			psmt.setInt(2, col_id);
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				DepartmentHeadDTO dto = new DepartmentHeadDTO();
				dto.setDeptName(rs.getString(1));
				dto.setProName(rs.getString(2));
				dto.setDeptTel(rs.getString(3));
				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return dtoList;
	}
	
	public List<DepartmentListDTO> selectAllWithInfo() {
		List<DepartmentListDTO> dtoList = new ArrayList<DepartmentListDTO>();

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_DEPARTMENT_WITH_INFO);
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				DepartmentListDTO dto = new DepartmentListDTO();
				dto.setDept_no(rs.getString(1));
				dto.setCol_name(rs.getString(2));
				dto.setDept_name(rs.getString(3));
				dto.setDept_tel(rs.getString(4));
				
				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return dtoList;
	}


	public void update(DepartmentDTO dto) {

	}

	public void delete(int ano) {

	}
}