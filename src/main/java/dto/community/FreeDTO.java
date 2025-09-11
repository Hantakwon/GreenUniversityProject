package dto.community;
/*
날짜: 2025/09/11
이름: 장진원
내용: 자유게시판 DTO
 */
public class FreeDTO {
    private int no;
    private String title;
    private String writer;
    private String rdate;
    private int hit;
    
    public FreeDTO() {
    }
    
    public FreeDTO(int no, String title, String writer, String rdate, int hit) {
        this.no = no;
        this.title = title;
        this.writer = writer;
        this.rdate = rdate;
        this.hit = hit;
    }
    
    // Getter 및 Setter
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
}