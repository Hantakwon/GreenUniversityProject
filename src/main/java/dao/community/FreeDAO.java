package dao.community;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dto.community.FreeDTO;

public class FreeDAO {

	/*
	날짜: 2025/09/11
	이름: 장진원
	내용: 자유게시판 DAO (검색 및 페이지네이션 기능 추가)
	 */
    private static FreeDAO instance = new FreeDAO();

    public static FreeDAO getInstance() {
        return instance;
    }

    private FreeDAO() {
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
     * 검색 조건에 맞는 전체 자유게시판 게시글의 수를 조회합니다.
     * @param searchType 검색 유형 (all, title, writer)
     * @param keyword 검색어
     * @return 검색 조건에 맞는 게시글 수
     */
    public int selectFreeCount(String searchType, String keyword) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(url, user, password);
            String sql = "SELECT COUNT(*) FROM `board_free` WHERE 1=1";
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
     * 검색 조건에 맞는 페이지별 자유게시판 목록을 조회합니다.
     * @param searchType 검색 유형 (all, title, writer)
     * @param keyword 검색어
     * @param start 시작 인덱스
     * @param limit 페이지당 게시글 수
     * @return 검색된 게시글 목록
     */
    public List<FreeDTO> getFreeList(String searchType, String keyword, int start, int limit) {
        List<FreeDTO> freeList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(url, user, password);
            String sql = "SELECT `no`, `title`, `writer`, `rdate`, `hit` FROM `board_free` WHERE 1=1";
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
                FreeDTO dto = new FreeDTO();
                dto.setNo(rs.getInt("no"));
                dto.setTitle(rs.getString("title"));
                dto.setWriter(rs.getString("writer"));
                dto.setRdate(rs.getString("rdate"));
                dto.setHit(rs.getInt("hit"));
                freeList.add(dto);
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
        return freeList;
    }
}