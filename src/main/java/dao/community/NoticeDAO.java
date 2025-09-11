package dao.community;

import dto.community.NoticeDTO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import java.sql.SQLException;

public class NoticeDAO {
    /*
    날짜: 2025/09/11
    이름: 장진원
    내용: 공지사항 DAO
     */
    private static NoticeDAO instance = new NoticeDAO();
    
    public static NoticeDAO getInstance() {
        return instance;
    }

    private NoticeDAO() {}

    private final String HOST = "jdbc:mysql://localhost:3306/green_1";
    private final String USER = "jinwonj96";
    private final String PASS = "1234";

    /**
     * 전체 게시글의 수를 조회합니다.
     * @return 전체 게시글 수
     */
    public int selectNoticeCount() {
        int count = 0;
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(HOST, USER, PASS);
            String sql = "SELECT COUNT(*) FROM `board_notice`";
            psmt = conn.prepareStatement(sql);
            rs = psmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (psmt != null) psmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return count;
    }

    /**
     * 페이지별 게시글 목록을 조회합니다.
     * @param start 시작 인덱스 (0부터 시작)
     * @param limit 페이지당 게시글 수
     * @return 게시글 목록
     */
    public List<NoticeDTO> selectNotices(int start, int limit) {
        List<NoticeDTO> notices = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(HOST, USER, PASS);
            String sql = "SELECT `no`, `title`, `writer`, `rdate`, `hit` FROM `board_notice` ORDER BY `no` ASC LIMIT ? OFFSET ?";
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, limit);
            psmt.setInt(2, start);
            rs = psmt.executeQuery();

            while (rs.next()) {
                NoticeDTO notice = new NoticeDTO();
                notice.setNo(rs.getInt("no"));
                notice.setTitle(rs.getString("title"));
                notice.setWriter(rs.getString("writer"));
                notice.setRdate(rs.getDate("rdate"));
                notice.setHit(rs.getInt("hit"));
                notices.add(notice);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (psmt != null) psmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return notices;
    }
}