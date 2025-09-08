package dto;

import java.sql.Date;

/*
 * 날짜 : 2025-09-08
 * 이름 : 한탁원
 * 내용 : DTO 작성 예정
 */
public class DepartmentDTO {
    private int deptId;       // dept_id (PK)
    private int colId;        // col_id (FK -> TB_College.col_id)
    private String deptNo;        // dept_no
    private String nameKor;       // name_kor
    private String nameEng;       // name_eng
    private Date foundedDate;     // founded_date (java.sql.Date 사용)
    private String tel;           // tel
    private String office;        // office
 
    public DepartmentDTO() {}

    public DepartmentDTO(Integer deptId, Integer colId, String deptNo,
                         String nameKor, String nameEng, Date foundedDate,
                         String tel, String office) {
        this.deptId = deptId;
        this.colId = colId;
        this.deptNo = deptNo;
        this.nameKor = nameKor;
        this.nameEng = nameEng;
        this.foundedDate = foundedDate;
        this.tel = tel;
        this.office = office;
    }

    // Getter & Setter
    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getColId() {
        return colId;
    }

    public void setColId(Integer colId) {
        this.colId = colId;
    }

    public String getDeptNo() {
        return deptNo;
    }

    public void setDeptNo(String deptNo) {
        this.deptNo = deptNo;
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

    public Date getFoundedDate() {
        return foundedDate;
    }

    public void setFoundedDate(Date foundedDate) {
        this.foundedDate = foundedDate;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getOffice() {
        return office;
    }

    public void setOffice(String office) {
        this.office = office;
    }

    @Override
    public String toString() {
        return "DepartmentDTO [deptId=" + deptId + ", colId=" + colId +
               ", deptNo=" + deptNo + ", nameKor=" + nameKor +
               ", nameEng=" + nameEng + ", foundedDate=" + foundedDate +
               ", tel=" + tel + ", office=" + office + "]";
    }
}
