package dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.DepartmentDTO;
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
	
	private DepartmentDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insert(DepartmentDTO dto) {
		
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
				dto.setDeptId(rs.getInt(1));
				dto.setColId(rs.getInt(2));
				dto.setDeptNo(rs.getString(3));
				dto.setNameKor(rs.getString(4));
				dto.setNameEng(rs.getString(5));
				dto.setFoundedDate(rs.getDate(6));
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
	
	public List<DepartmentDTO> selectAllByCollege(int col_id) {
		List<DepartmentDTO> dtoList = new ArrayList<DepartmentDTO>();
		
		StringBuilder sql = new StringBuilder(Sql.SELECT_DEPARTMENT_ALL);

		sql.append(Sql.SEARCH_WHERE_COLLEGE);
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql.toString());
			psmt.setInt(1, col_id);

			rs = psmt.executeQuery();

			while (rs.next()) {
				DepartmentDTO dto = new DepartmentDTO();
				dto.setDeptId(rs.getInt(1));
				dto.setColId(rs.getInt(2));
				dto.setDeptNo(rs.getString(3));
				dto.setNameKor(rs.getString(4));
				dto.setNameEng(rs.getString(5));
				dto.setFoundedDate(rs.getDate(6));
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
	
	public void update(DepartmentDTO dto) {
		
	}
	
	public void delete(int ano) {
		
	}
}