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
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_DEPARTMENT);

			psmt.setInt(1, dto.getCol_id());
			psmt.setString(2, dto.getName_kor());
			psmt.setString(3, dto.getName_eng());
			psmt.setDate(4, dto.getFounded_date());
			psmt.setString(5, dto.getTel());
			psmt.setString(6, dto.getOffice());
			psmt.setInt(7, dto.getCol_id());

			psmt.executeUpdate();

			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}

	public DepartmentDTO select(int ano) {
		return null;
	}

	public List<DepartmentDTO> selectAll() {
		List<DepartmentDTO> dtoList = new ArrayList<DepartmentDTO>();

		try {
			conn = getConnection();

			psmt = conn.prepareStatement(Sql.SELECT_DEPARTMENT_ALL);

			rs = psmt.executeQuery();

			while (rs.next()) {
				DepartmentDTO dto = new DepartmentDTO();
				dto.setDept_id(rs.getInt(1));
				dto.setCol_id(rs.getInt(2));
				dto.setDept_no(rs.getString(3));
				dto.setName_kor(rs.getString(4));
				dto.setName_eng(rs.getString(5));
				dto.setFounded_date(rs.getDate(6));
				dto.setTel(rs.getString(7));
				dto.setOffice(rs.getString(8));

				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return dtoList;
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
	    List<DepartmentListDTO> dtoList = new ArrayList<>();

	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(Sql.SELECT_DEPARTMENT_WITH_INFO);

	        rs = psmt.executeQuery();

	        while (rs.next()) {
	            DepartmentListDTO dto = new DepartmentListDTO();
	            dto.setDept_no(rs.getString(1));             
	            dto.setCol_name(rs.getString(2));       
	            dto.setDept_name(rs.getString(3)); 
	            dto.setDept_head(rs.getString(4));
	            dto.setDept_tel(rs.getString(5));           
	            dto.setPro_num(rs.getInt(6));        
	            dto.setStu_num(rs.getInt(7));          
	            dto.setLec_num(rs.getInt(8));          

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