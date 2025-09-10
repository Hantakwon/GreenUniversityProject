package dao.community;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import dto.community.NewsDTO;

public class NewsDAO {

    private String url = "jdbc:mysql://localhost:3306/greendae";
    private String user = "root";
    private String password = "password";

    // 데이터베이스 연결 설정
    public NewsDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public List<NewsDTO> getNewsList() {
        List<NewsDTO> newsList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(url, user, password);
            String sql = "SELECT no, category, title, writer, rdate, hit FROM board_news ORDER BY no DESC"; // SQL 쿼리문
            ps = conn.prepareStatement(sql);
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
            // 자원 해제
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return newsList;
    }
}