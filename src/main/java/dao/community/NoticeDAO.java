package dao.community;

import dto.community.NoticeDTO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NoticeDAO {
    // 싱글톤 인스턴스를 미리 생성
    private static NoticeDAO instance = new NoticeDAO();
    
    // 외부에서 접근할 수 있는 정적 메서드
    public static NoticeDAO getInstance() {
        return instance;
    }

    // 싱글톤 패턴을 위해 생성자를 private으로 선언
    private NoticeDAO() {
        // JNDI 초기화 코드를 제거하고, DB 연결 정보를 필드에 직접 정의
    }

    // 데이터베이스 연결 정보
    private final String HOST = "jdbc:mysql://localhost:3306/studydb";
    private final String USER = "jinwonj96";
    private final String PASS = "1234";

    // 게시물 목록 조회
    public List<NoticeDTO> selectNotices() {
        List<NoticeDTO> notices = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        try {
            // 1. JDBC 드라이버 로드
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 2. DriverManager를 사용해 데이터베이스에 직접 연결
            conn = DriverManager.getConnection(HOST, USER, PASS);

            // 3. SQL 실행 객체 생성
            String sql = "SELECT `no`, `title`, `writer`, `rdate`, `hit` FROM `board_notice` ORDER BY `no` DESC";
            psmt = conn.prepareStatement(sql);

            // 4. SQL 실행
            rs = psmt.executeQuery();

            // 5. 결과 처리
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
            // 6. 연결 해제
            try {
                if (rs != null) rs.close();
                if (psmt != null) psmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return notices;
    }
}