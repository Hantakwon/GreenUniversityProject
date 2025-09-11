package dao.community;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dto.community.JobDTO;

public class JobDAO {

    private static JobDAO instance = new JobDAO();

    public static JobDAO getInstance() {
        return instance;
    }

    private JobDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    private String url = "jdbc:mysql://localhost:3306/green_1";
    private String user = "jinwonj96";
    private String password = "1234";

    /**
     * 전체 취업정보 게시글의 수를 조회합니다.
     * @return 전체 게시글 수
     */
    public int selectJobCount() {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(url, user, password);
            String sql = "SELECT COUNT(*) FROM `board_job`";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return count;
    }

    /**
     * 페이지별 취업정보 목록을 조회합니다.
     * @param start 시작 인덱스 (0부터 시작)
     * @param limit 페이지당 게시글 수
     * @return 취업정보 목록
     */
    public List<JobDTO> getJobList(int start, int limit) {
        List<JobDTO> jobList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(url, user, password);
            String sql = "SELECT `no`, `status`, `company`, `title`, `rdate`, `hit` FROM `board_job` ORDER BY `no` DESC LIMIT ? OFFSET ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, limit);
            ps.setInt(2, start);
            rs = ps.executeQuery();

            while (rs.next()) {
                JobDTO dto = new JobDTO();
                dto.setNo(rs.getInt("no"));
                dto.setStatus(rs.getString("status"));
                dto.setCompany(rs.getString("company"));
                dto.setTitle(rs.getString("title"));
                dto.setRdate(rs.getString("rdate"));
                dto.setHit(rs.getInt("hit"));
                jobList.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return jobList;
    }
}