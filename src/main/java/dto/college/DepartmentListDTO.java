package dto.college;

public class DepartmentListDTO {
	private String dept_no;
	private String col_name;
	private String dept_name;
	private String dept_head;
	private String dept_tel;
	private int pro_num;
	private int stu_num;
	private int lec_num;

	public String getDept_no() {
		return dept_no;
	}

	public void setDept_no(String dept_no) {
		this.dept_no = dept_no;
	}

	public String getCol_name() {
		return col_name;
	}

	public void setCol_name(String col_name) {
		this.col_name = col_name;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getDept_head() {
		return dept_head;
	}

	public void setDept_head(String dept_head) {
		this.dept_head = dept_head;
	}

	public String getDept_tel() {
		return dept_tel;
	}

	public void setDept_tel(String dept_tel) {
		this.dept_tel = dept_tel;
	}

	public int getPro_num() {
		return pro_num;
	}

	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}

	public int getStu_num() {
		return stu_num;
	}

	public void setStu_num(int stu_num) {
		this.stu_num = stu_num;
	}

	public int getLec_num() {
		return lec_num;
	}

	public void setLec_num(int lec_num) {
		this.lec_num = lec_num;
	}

	@Override
	public String toString() {
		return "DepartmentListDTO [dept_no=" + dept_no + ", col_name=" + col_name + ", dept_name=" + dept_name
				+ ", dept_head=" + dept_head + ", dept_tel=" + dept_tel + ", pro_num=" + pro_num + ", stu_num="
				+ stu_num + ", lec_num=" + lec_num + "]";
	}

}