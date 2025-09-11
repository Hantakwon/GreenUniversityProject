package dao.community;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dto.community.JobDTO;
/*
날짜: 2025/09/11
이름: 장진원
내용: 취업정보 DAO
 */
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
    
    private String url = "jdbc:mysql://13.125.98.52:3306/greendae4";
    private String user = "hanto0916";
    private String password = "abc1234!";

    /**
     * 전체 취업정보 게시글의 수를 조회합니다.
     * @param searchType 검색 유형 (all, company, title)
     * @param keyword 검색어
     * @return 검색 조건에 맞는 게시글 수
     */
    public int selectJobCount(String searchType, String keyword) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(url, user, password);
            String sql = "SELECT COUNT(*) FROM `board_job` WHERE 1=1";
            if (searchType != null && keyword != null && !keyword.isEmpty() && !searchType.equals("all")) {
                sql += " AND `" + searchType + "` LIKE ?";
            }
            ps = conn.prepareStatement(sql);
            if (searchType != null && keyword != null && !keyword.isEmpty() && !searchType.equals("all")) {
                ps.setString(1, "%" + keyword + "%");
            }
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
     * @param searchType 검색 유형 (all, company, title)
     * @param keyword 검색어
     * @param start 시작 인덱스
     * @param limit 페이지당 게시글 수
     * @return 검색된 게시글 목록
     */
    public List<JobDTO> getJobList(String searchType, String keyword, int start, int limit) {
        List<JobDTO> jobList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(url, user, password);
            String sql = "SELECT `no`, `status`, `company`, `title`, `rdate`, `hit` FROM `board_job` WHERE 1=1";
            if (searchType != null && keyword != null && !keyword.isEmpty() && !searchType.equals("all")) {
                sql += " AND `" + searchType + "` LIKE ?";
            }
            sql += " ORDER BY `no` DESC LIMIT ? OFFSET ?";
            ps = conn.prepareStatement(sql);
            int paramIndex = 1;
            if (searchType != null && keyword != null && !keyword.isEmpty() && !searchType.equals("all")) {
                ps.setString(paramIndex++, "%" + keyword + "%");
            }
            ps.setInt(paramIndex++, limit);
            ps.setInt(paramIndex, start);
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