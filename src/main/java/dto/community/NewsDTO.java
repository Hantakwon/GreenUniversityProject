package dto.community;

public class NewsDTO {
    private int no;
    private String category;
    private String title;
    private String writer;
    private String rdate;
    private int hit;
    
    // 기본 생성자
    public NewsDTO() {
    }

    // 모든 필드를 포함하는 생성자
    public NewsDTO(int no, String category, String title, String writer, String rdate, int hit) {
        this.no = no;
        this.category = category;
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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
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