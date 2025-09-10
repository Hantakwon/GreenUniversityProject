package dto.college;

import java.sql.Date;

/*
 * 날짜 : 2025-09-08
 * 이름 : 한탁원
 * 내용 : DTO 작성 예정
 */
public class DepartmentDTO {
	private int dept_id;
	private int col_id;
	private String dept_no;
	private String name_kor;
	private String name_eng;
	private Date founded_date;
	private String tel;
	private String office;

	public int getDept_id() {
		return dept_id;
	}

	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}

	public int getCol_id() {
		return col_id;
	}

	public void setCol_id(int col_id) {
		this.col_id = col_id;
	}

	public String getDept_no() {
		return dept_no;
	}

	public void setDept_no(String dept_no) {
		this.dept_no = dept_no;
	}

	public String getName_kor() {
		return name_kor;
	}

	public void setName_kor(String name_kor) {
		this.name_kor = name_kor;
	}

	public String getName_eng() {
		return name_eng;
	}

	public void setName_eng(String name_eng) {
		this.name_eng = name_eng;
	}

	public Date getFounded_date() {
		return founded_date;
	}

	public void setFounded_date(Date founded_date) {
		this.founded_date = founded_date;
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
		return "DepartmentDTO [dept_id=" + dept_id + ", col_id=" + col_id + ", dept_no=" + dept_no + ", name_kor="
				+ name_kor + ", name_eng=" + name_eng + ", founded_date=" + founded_date + ", tel=" + tel + ", office="
				+ office + "]";
	}

}
