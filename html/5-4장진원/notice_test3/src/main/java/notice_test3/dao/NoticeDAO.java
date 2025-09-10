package notice_test3.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import notice_test3.dto.NoticeDTO;
import util.DBHelper;

public class NoticeDAO extends DBHelper {

    // 1. 싱글톤 패턴 적용
    private static NoticeDAO instance = new NoticeDAO();
    public static NoticeDAO getInstance() {
        return instance;
    }
    private NoticeDAO() {}

    // 2. 게시물 목록 조회 메서드 작성
    public List<NoticeDTO> selectNotices() {

        // 게시물 목록을 담을 리스트 객체 생성
        List<NoticeDTO> noticeList = new ArrayList<>();

        // try-catch-finally 구문으로 예외 처리
        try {
            // DBHelper로부터 연결 가져오기
            conn = getConnection();

            // SQL 쿼리 준비
            psmt = conn.prepareStatement("SELECT * FROM `tb_academic_notice` ORDER BY `id` DESC;");
            
            // 쿼리 실행
            rs = psmt.executeQuery();
            
            // 결과를 DTO에 담기
            while(rs.next()) {
                NoticeDTO dto = new NoticeDTO();
                dto.setId(rs.getInt("id"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setCreated_at(rs.getString("created_at"));
                dto.setViews(rs.getInt("views"));
                
                noticeList.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 연결 자원 반환
            try {
                closeAll();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return noticeList;
    }
    
    public NoticeDTO selectNotice(int id) {
        NoticeDTO dto = null;

        try {
            conn = getConnection();
            // 특정 ID에 해당하는 게시물을 조회하는 SQL 쿼리로 변경
            psmt = conn.prepareStatement("SELECT * FROM `tb_academic_notice` WHERE `id` = ?");
            // 쿼리의 '?'에 파라미터(id) 값 설정
            psmt.setInt(1, id); 

            rs = psmt.executeQuery();

            if (rs.next()) {
                dto = new NoticeDTO();
                dto.setId(rs.getInt("id"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setCreated_at(rs.getString("created_at"));
                dto.setViews(rs.getInt("views"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                closeAll();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return dto; // 단일 객체 반환
    }
}