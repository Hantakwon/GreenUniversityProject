package dto;

/*
 * 날짜 : 2025-09-08
 * 이름 : 한탁원
 * 내용 : DTO 작성 예정
 */
public class CollegeDTO {
    private int colId;   
    private String nameKor;   
    private String nameEng;    
    private String title;      
    private String content;    
    private byte[] image;      

    public CollegeDTO() {}

    public CollegeDTO(Integer colId, String nameKor, String nameEng, String title, String content, byte[] image) {
        this.colId = colId;
        this.nameKor = nameKor;
        this.nameEng = nameEng;
        this.title = title;
        this.content = content;
        this.image = image;
    }

    public Integer getColId() {
        return colId;
    }

    public void setColId(Integer colId) {
        this.colId = colId;
    }

    public String getNameKor() {
        return nameKor;
    }

    public void setNameKor(String nameKor) {
        this.nameKor = nameKor;
    }

    public String getNameEng() {
        return nameEng;
    }

    public void setNameEng(String nameEng) {
        this.nameEng = nameEng;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "CollegeDTO [colId=" + colId + ", nameKor=" + nameKor + ", nameEng=" + nameEng
                + ", title=" + title + ", content=" + content + ", image=" + (image != null ? image.length + " bytes" : "null") + "]";
    }
}
