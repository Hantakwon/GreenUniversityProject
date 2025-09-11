package dto.community;
/*
날짜: 2025/09/11
이름: 장진원
내용: 질문과답변 DTO
 */
public class QnaDTO {
    private int no;
    private int parent; // 답변일 경우 원글 번호, 원글일 경우 0
    private int comment; // 답변 개수
    private String title;
    private String writer;
    private String rdate;
    private int status; // 1: 답변대기, 2: 답변완료
    private int cate; // 답변(RE:)일 경우 1, 아닐 경우 0
    private String pass; // 비밀글 여부 판단용 비밀번호

    public QnaDTO() {
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getParent() {
        return parent;
    }

    public void setParent(int parent) {
        this.parent = parent;
    }

    public int getComment() {
        return comment;
    }

    public void setComment(int comment) {
        this.comment = comment;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCate() {
        return cate;
    }

    public void setCate(int cate) {
        this.cate = cate;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
}