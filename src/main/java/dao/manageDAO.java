package dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.manage.LectureManageDTO;
import util.DBHelper;
import util.Sql;
/*
 * 날짜 :
 * 이름 : 우지희
 * 내용 : 강의등록
 */

public class manageDAO extends DBHelper{
	
	private final static manageDAO INSTANCE = new manageDAO();
	public static manageDAO getInstance() {
		return INSTANCE;
	}
	private manageDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertLecture(LectureManageDTO dto) {
		
		try {
			conn = getConnection();
	        psmt = conn.prepareStatement(Sql.REGISTER_LECTURE);
	        psmt.setInt(1, dto.getLecNo());
	        psmt.setString(2, dto.getLenName());
	        psmt.setString(3, dto.getCategory());
            psmt.setString(4, dto.getDepartment()); 
            psmt.setString(5, dto.getGrade());
            psmt.setString(6, dto.getSemester());
            psmt.setString(7, dto.getCredit());
            psmt.setString(8, dto.getProfessor()); 
            psmt.setString(9, dto.getDescription());
            psmt.setString(10, dto.getStart_date());
            psmt.setString(11, dto.getEnd_date());
            psmt.setString(12, dto.getStart_time());
            psmt.setString(13, dto.getEnd_time());
            psmt.setString(14, dto.getDay_of_week());
            psmt.setString(15, dto.getEvaluation());
            psmt.setString(16, dto.getTextbook());
            psmt.setString(17, dto.getClassroom());
            psmt.setString(18, dto.getMax_enrollment());

	        psmt.executeUpdate();
	        closeAll();
	    } catch (Exception e) {
	        logger.error(e.getMessage());
		}
	
	}
	public int getNextSequence(String deptCode, String year, String semester) {
	    
		int sequence = 1;
	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(Sql.GET_NEXT_SEQUENCE);
	        psmt.setString(1, deptCode + year.substring(2) + semester + "%");
	        
	        rs = psmt.executeQuery();
	        if (rs.next()) {
	            sequence = rs.getInt(1);
	        }
	        closeAll();
	    } catch (Exception e) {
	        logger.error(e.getMessage());
	    }
	    return sequence;
	}
	public LectureManageDTO selectLecture(int lecNo) {
		return null;
	}
	//강의목록
	public List<LectureManageDTO> selectAllLecture() {
		
		List<LectureManageDTO> dtoList = new ArrayList<LectureManageDTO>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ALL_TB_LECTURE);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				LectureManageDTO dto = new LectureManageDTO();
			    dto.setLecNo(rs.getInt("lecNo"));
			    dto.setDepartment(rs.getString("department"));
			    dto.setGrade(rs.getString("grade"));
			    dto.setCategory(rs.getString("category"));
			    dto.setLenName(rs.getString("lenName"));
			    dto.setProfessor(rs.getString("professor"));
			    dto.setCredit(rs.getString("credit"));
			    dto.setClass_time(rs.getString("class_time"));
			    dto.setClassroom(rs.getString("classroom"));
			    dto.setMax_enrollment(rs.getString("max_enrollment"));

	            dtoList.add(dto);   
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dtoList;
	}
	
	//운영현황
	public List<LectureManageDTO> selectAllOpeState(){
		
		List<LectureManageDTO> dtoList = new ArrayList<LectureManageDTO>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ALL_LECTURE_WITH_ENROLLMENT); //sql 추가해야함
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				LectureManageDTO dto = new LectureManageDTO();
				dto.setDepartment(rs.getString("department"));
				dto.setLecNo(rs.getInt("lecNo"));
				dto.setLenName(rs.getString("lenName"));
				dto.setGrade(rs.getString("grade"));
				dto.setProfessor(rs.getString("professor"));
				dto.setCredit(rs.getString("credit"));
				dto.setClassroom(rs.getString("classroom"));
				//수강인원 ,수강률
				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dtoList;
	}
	
	
	
	public void updateLecture(LectureManageDTO dto) {}
	public void deleteLecture(int lecno) {}

}
