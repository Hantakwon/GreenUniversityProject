package dao.stusup;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.stusup.Course_regDTO;
/*
날짜: 2025/09/11
이름: 장진원
내용: 수강신청 DAO
 */
public class Course_regDAO {

    private String url = "jdbc:mysql://localhost:3306/green_1";
    private String user = "jinwonj96";
    private String password = "1234";

    public Course_regDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public List<Course_regDTO> getCourseList() {
        List<Course_regDTO> courseList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(url, user, password);
            String sql = "SELECT `department`, `classification`, `year`, `code`, `subject`, `credit`, `professor`, `capacity`, `note` FROM `course` ORDER BY `department`, `year`";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Course_regDTO dto = new Course_regDTO();
                dto.setDepartment(rs.getString("department"));
                dto.setClassification(rs.getString("classification"));
                dto.setYear(rs.getInt("year"));
                dto.setCode(rs.getString("code"));
                dto.setSubject(rs.getString("subject"));
                dto.setCredit(rs.getInt("credit"));
                dto.setProfessor(rs.getString("professor"));
                dto.setCapacity(rs.getString("capacity"));
                dto.setNote(rs.getString("note"));
                courseList.add(dto);
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
        return courseList;
    }
}