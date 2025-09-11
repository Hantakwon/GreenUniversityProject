package dao.community;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import dto.community.NewsDTO;
import java.sql.SQLException;

public class NewsDAO {

    /*
    날짜: 2025/09/11
    이름: 장진원
    내용: 뉴스 및 칼럼 DAO (페이지네이션 기능 추가)
     */
    private static NewsDAO instance = new NewsDAO();

    public static NewsDAO getInstance() {
        return instance;
    }

    private NewsDAO() {
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
     * 전체 뉴스 게시글의 수를 조회합니다.
     * @return 전체 게시글 수
     */
    public int getNewsCount() {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(url, user, password);
            String sql = "SELECT COUNT(*) FROM `board_news`";
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
     * 페이지별 뉴스 목록을 조회합니다.
     * @param start 시작 인덱스 (0부터 시작)
     * @param limit 페이지당 게시글 수
     * @return 뉴스 목록
     */
    public List<NewsDTO> getNewsList(int start, int limit) {
        List<NewsDTO> newsList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(url, user, password);
            String sql = "SELECT `no`, `category`, `title`, `writer`, `rdate`, `hit` FROM `board_news` ORDER BY `no` ASC LIMIT ? OFFSET ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, limit);
            ps.setInt(2, start);
            rs = ps.executeQuery();

            while (rs.next()) {
                NewsDTO dto = new NewsDTO();
                dto.setNo(rs.getInt("no"));
                dto.setCategory(rs.getString("category"));
                dto.setTitle(rs.getString("title"));
                dto.setWriter(rs.getString("writer"));
                dto.setRdate(rs.getString("rdate"));
                dto.setHit(rs.getInt("hit"));
                newsList.add(dto);
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
        return newsList;
    }
}