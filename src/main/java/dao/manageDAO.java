package dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.LectureManageDTO;
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
	        psmt.setInt(1, dto.getLec_no());
	        psmt.setString(2, dto.getLec_name());
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
	public LectureManageDTO selectLecture(int lec_no) {
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
			    dto.setLec_no(rs.getInt("lec_no"));
			    dto.setDepartment(rs.getString("department"));
			    dto.setGrade(rs.getString("grade"));
			    dto.setCategory(rs.getString("category"));
			    dto.setLec_name(rs.getString("lec_name"));
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
				dto.setLec_no(rs.getInt("lec_no"));
				dto.setLec_name(rs.getString("lec_name"));
				dto.setGrade(rs.getString("grade"));
				dto.setProfessor(rs.getString("professor"));
				dto.setCredit(rs.getString("credit"));
				dto.setClassroom(rs.getString("classroom"));
				dto.setEnrollment(rs.getString("enrollment"));
			    dto.setMax_enrollment(rs.getString("max_enrollment"));
			    
				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dtoList;
	}
	//수강 현황
	public List<LectureManageDTO> selectAllLecState(){
		
		List<LectureManageDTO> dtoList = new ArrayList<LectureManageDTO>();
		try {
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dtoList;
	}
	
	public int selectCountTotal() {
			
			int total = 0;		
			try {
				conn = getConnection();			
				stmt = conn.createStatement();
				rs = stmt.executeQuery(Sql.SELECT_COUNT_TOTAL);
				
				if(rs.next()) {
					total = rs.getInt(1);
				}			
				closeAll();
			}catch (Exception e) {
				logger.error(e.getMessage());
			}
			return total;
		}
	
	public int selectCountSearch(String searchType, String keyword) {

		int total = 0;
		
		StringBuilder sql = new StringBuilder(Sql.SELECT_COUNT_SEARCH);
		
		if(searchType.equals("lec_no")) {
			sql.append(Sql.SEARCH_WHERE_LECNO);
		}else if(searchType.equals("department")) {
			sql.append(Sql.SEARCH_WHERE_DEPARTMENT);
		}else if(searchType.equals("lec_name")) {
			sql.append(Sql.SEARCH_WHERE_LECNAME);
		}else if(searchType.equals("professor")) {
			sql.append(Sql.SEARCH_WHERE_PROFESSOR);
		}
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, "%" + keyword + "%");
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			closeAll();			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return total;
	}
	
	public List<LectureManageDTO> selectSearchList(String searchType, String keyword, int start) {
	    List<LectureManageDTO> list = new ArrayList<>();

	    StringBuilder sql = new StringBuilder(Sql.SELECT_SEARCH_BASE);

	    if(searchType.equals("lec_no")) {
	        sql.append(Sql.SEARCH_WHERE_LECNO);
	    } else if(searchType.equals("department")) {
	        sql.append(Sql.SEARCH_WHERE_DEPARTMENT);
	    } else if(searchType.equals("lecName")) {
	        sql.append(Sql.SEARCH_WHERE_LECNAME);
	    } else if(searchType.equals("professor")) {
	        sql.append(Sql.SEARCH_WHERE_PROFESSOR);
	    }

	    // ★ ORDER BY + OFFSET 붙이기
	    sql.append(Sql.SEARCH_ORDER_LECNO);
	    sql.append(Sql.SEARCH_OFFSET_ROW1);

	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(sql.toString());
	        psmt.setString(1, "%" + keyword + "%");
	        psmt.setInt(2, start);   // OFFSET 바인딩

	        rs = psmt.executeQuery();
	        while(rs.next()) {
	            LectureManageDTO dto = new LectureManageDTO();
	            dto.setLec_no(rs.getInt("lec_no"));
	            dto.setDepartment(rs.getString("department"));
	            dto.setGrade(rs.getString("grade"));
	            dto.setCategory(rs.getString("category"));
	            dto.setLec_name(rs.getString("lec_name"));
	            dto.setProfessor(rs.getString("professor"));
	            dto.setCredit(rs.getString("credit"));
	            dto.setClass_time(rs.getString("class_time"));
	            dto.setClassroom(rs.getString("classroom"));
	            dto.setMax_enrollment(rs.getString("max_enrollment"));
	            list.add(dto);
	        }
	        closeAll();
	    } catch(Exception e) {
	        logger.error(e.getMessage());
	    }

	    return list;
	}

	
	public void updateLecture(LectureManageDTO dto) {}
	
	public void deleteLecture(int lecno) {}
	

}
