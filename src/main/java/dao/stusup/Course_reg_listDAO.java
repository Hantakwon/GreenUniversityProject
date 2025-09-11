package dao.stusup;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.stusup.Course_reg_listDTO;

public class Course_reg_listDAO {

	/*
	날짜: 2025/09/11
	이름: 장진원
	내용: 수강신청내역 DAO
	 */
    private String url = "jdbc:mysql://localhost:3306/greendae";
    private String user = "root";
    private String password = "password";

    public Course_reg_listDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public List<Course_reg_listDTO> getRegisteredCourses(String studentId) {
        List<Course_reg_listDTO> registeredCourses = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(url, user, password);
            String sql = "SELECT c.course_code, c.subject, c.target_year, c.professor, c.credit, c.classification, c.class_time, c.classroom " +
                         "FROM registered_courses r " +
                         "JOIN courses c ON r.course_code = c.course_code " +
                         "WHERE r.student_id = ?"; // 학생 ID를 기준으로 조회
            ps = conn.prepareStatement(sql);
            ps.setString(1, studentId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Course_reg_listDTO dto = new Course_reg_listDTO();
                dto.setCourseCode(rs.getString("course_code"));
                dto.setSubject(rs.getString("subject"));
                dto.setTargetYear(rs.getString("target_year"));
                dto.setProfessor(rs.getString("professor"));
                dto.setCredit(rs.getInt("credit"));
                dto.setClassification(rs.getString("classification"));
                dto.setClassTime(rs.getString("class_time"));
                dto.setClassroom(rs.getString("classroom"));
                registeredCourses.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return registeredCourses;
    }
}
