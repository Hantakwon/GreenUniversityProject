package dto.community;
/*
날짜: 2025/09/11
이름: 장진원
내용: 자료실 DTO
 */
public class DataroomDTO {
    private int no;
    private String title;
    private String writer;
    private String rdate;
    private int hit;
    private int file; // 첨부파일 존재 여부 (1: 있음, 0: 없음)
    
    public DataroomDTO() {
    }

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

    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    }

    public int getHit() {
        return hit;
    }

    public void setHit(int hit) {
        this.hit = hit;
    }

    public int getFile() {
        return file;
    }

    public void setFile(int file) {
        this.file = file;
    }
}
