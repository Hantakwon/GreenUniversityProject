package dao.community;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import dto.community.QnaDTO;

public class QnaDAO {
    
    private String url = "jdbc:mysql://localhost:3306/greendae";
    private String user = "root";
    private String password = "password";

    public QnaDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public List<QnaDTO> getQnaList() {
        List<QnaDTO> qnaList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(url, user, password);
            String sql = "SELECT * FROM board_qna ORDER BY parent DESC, no ASC"; // 부모-자식 정렬
            ps = conn.prepareStatement(sql);
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
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return qnaList;
    }
}
