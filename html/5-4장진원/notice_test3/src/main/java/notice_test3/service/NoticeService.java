package notice_test3.service;

import java.util.List;

import notice_test3.dao.NoticeDAO;
import notice_test3.dto.NoticeDTO;

public enum NoticeService {

    INSTANCE;

    private NoticeDAO dao = NoticeDAO.getInstance();

    /**
     * 전체 게시물 목록을 조회하는 메서드
     * @return 전체 게시물 목록
     */
    public List<NoticeDTO> selectNotices() {
        return dao.selectNotices();
    }
    
    /**
     * 특정 게시물 정보를 조회하는 메서드
     * @param id 게시물 번호
     * @return 해당 게시물 DTO 객체
     */
    public NoticeDTO selectNotice(int id) {
        return dao.selectNotice(id);
    }
}