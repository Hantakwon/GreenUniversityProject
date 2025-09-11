package dao.community;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dto.community.QnaDTO;

public class QnaDAO {

	/*
	날짜: 2025/09/11
	이름: 장진원
	내용: 질문과답변 DAO
	 */
    private static QnaDAO instance = new QnaDAO();

    public static QnaDAO getInstance() {
        return instance;
    }

    private QnaDAO() {
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
     * 전체 Q&A 게시글의 수를 조회합니다.
     * @return 전체 게시글 수
     */
    public int selectQnaCount() {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(url, user, password);
            String sql = "SELECT COUNT(*) FROM `board_qna`";
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
     * 페이지별 Q&A 게시글 목록을 조회합니다.
     * @param start 시작 인덱스 (0부터 시작)
     * @param limit 페이지당 게시글 수
     * @return Q&A 게시글 목록
     */
    public List<QnaDTO> getQnaList(int start, int limit) {
        List<QnaDTO> qnaList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(url, user, password);
            String sql = "SELECT * FROM `board_qna` ORDER BY IF(`parent` > 0, `parent`, `no`) DESC, `no` ASC LIMIT ? OFFSET ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, limit);
            ps.setInt(2, start);
            rs = ps.executeQuery();

            while (rs.next()) {
                QnaDTO dto = new QnaDTO();
                dto.setNo(rs.getInt("no"));
                dto.setParent(rs.getInt("parent"));
                dto.setComment(rs.getInt("comment"));
                dto.setTitle(rs.getString("title"));
                dto.setWriter(rs.getString("writer"));
                dto.setRdate(rs.getString("rdate"));
                dto.setStatus(rs.getInt("status"));
                dto.setCate(rs.getInt("cate"));
                dto.setPass(rs.getString("pass"));
                qnaList.add(dto);
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
        return qnaList;
    }
}