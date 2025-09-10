package dto.community;

import java.sql.Date;

public class NoticeDTO {
    private int no;
    private String title;
    private String writer;
    private Date rdate; // 작성일
    private int hit; // 조회수
    
    // 기본 생성자
    public NoticeDTO() {}

    // 모든 필드를 포함하는 생성자
    public NoticeDTO(int no, String title, String writer, Date rdate, int hit) {
        this.no = no;
        this.title = title;
        this.writer = writer;
        this.rdate = rdate;
        this.hit = hit;
    }

    // Getter와 Setter
    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public Date getRdate() {
        return rdate;
    }

    public void setRdate(Date rdate) {
        this.rdate = rdate;
    }

    public int getHit() {
        return hit;
    }

    public void setHit(int hit) {
        this.hit = hit;
    }

    @Override
    public String toString() {
        return "NoticeDTO{" +
               "no=" + no +
               ", title='" + title + '\'' +
               ", writer='" + writer + '\'' +
               ", rdate=" + rdate +
               ", hit=" + hit +
               '}';
    }
}