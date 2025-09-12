package dao.manage.index;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.manage.index.IndexOperateDTO;
import dto.manage.index.IndexStudentSummaryByDeptDTO;
import dto.manage.index.IndexStudentSummaryByGradeDTO;
import util.DBHelper;
import util.Sql;

public class IndexDAO extends DBHelper {

	private final static IndexDAO INSTANCE = new IndexDAO();

	public static IndexDAO getInstance() {
		return INSTANCE;
	}

	private IndexDAO() {
	}

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public IndexOperateDTO selectOperate() {
		IndexOperateDTO dto = new IndexOperateDTO();

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_MANAGE_INDEX_OPERATE);

			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setDept_cnt(rs.getInt(1));
				dto.setLec_cnt(rs.getInt(2));
				dto.setPro_cnt(rs.getInt(3));
				dto.setEmp_cnt(rs.getInt(4));
				dto.setStd_cnt(rs.getInt(5));
				dto.setLeave_cnt(rs.getInt(6));
				dto.setGrad_cnt(rs.getInt(7));
				dto.setGradutes(rs.getInt(8));
			}
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public List<IndexStudentSummaryByGradeDTO> selectStudentSummaryByGrade() {
		List<IndexStudentSummaryByGradeDTO> dtoList = new ArrayList<IndexStudentSummaryByGradeDTO>();

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_MANAGE_INDEX_GRADE_STUDENT_SUMMARY);

			rs = psmt.executeQuery();

			while (rs.next()) {
				IndexStudentSummaryByGradeDTO dto = new IndexStudentSummaryByGradeDTO();
				dto.setGrade(rs.getString(1));
				dto.setSumEnrolledCnt(rs.getInt(2));
				dto.setSumLeaveCnt(rs.getInt(3));
				dto.setSumTotalCnt(rs.getInt(4));
				
				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtoList;
	}
	
	public List<IndexStudentSummaryByDeptDTO> selectStudentSummaryByDept() {
		List<IndexStudentSummaryByDeptDTO> dtoList = new ArrayList<IndexStudentSummaryByDeptDTO>();

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_MANAGE_INDEX_DEPT_STUDENT_SUMMARY);

			rs = psmt.executeQuery();

			while (rs.next()) {
				IndexStudentSummaryByDeptDTO dto = new IndexStudentSummaryByDeptDTO();
				dto.setDept_name(rs.getString(1));
				dto.setSumEnrolledCnt(rs.getInt(2));
				dto.setSumLeaveCnt(rs.getInt(3));
				dto.setSumTotalCnt(rs.getInt(4));
				
				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtoList;
	}
}
