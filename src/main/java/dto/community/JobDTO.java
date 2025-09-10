package dto.community;

public class JobDTO {
    private int no;
    private String status;
    private String company;
    private String title;
    private String rdate;
    private int hit;
    
    public JobDTO() {
    }
    
    public JobDTO(int no, String status, String company, String title, String rdate, int hit) {
        this.no = no;
        this.status = status;
        this.company = company;
        this.title = title;
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
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getCompany() {
        return company;
    }
    
    public void setCompany(String company) {
        this.company = company;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
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
