package dto;

public class StudentListDTO {
	private String std_no;
	private String name_kor;
	private String rrn;
	private String tel;
	private String email;
	private String dept_name;
	private String grade;
	private String semester;
	private String statement;

	public String getStd_no() {
		return std_no;
	}

	public void setStd_no(String std_no) {
		this.std_no = std_no;
	}

	public String getName_kor() {
		return name_kor;
	}

	public void setName_kor(String name_kor) {
		this.name_kor = name_kor;
	}

	public String getRrn() {
		return rrn;
	}

	public void setRrn(String rrn) {
		this.rrn = rrn;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public String getStatement() {
		return statement;
	}

	public void setStatement(String statement) {
		this.statement = statement;
	}

	@Override
	public String toString() {
		return "StudentListDTO [std_no=" + std_no + ", name_kor=" + name_kor + ", rrn=" + rrn + ", tel=" + tel
				+ ", email=" + email + ", dept_name=" + dept_name + ", grade=" + grade + ", semester=" + semester
				+ ", statement=" + statement + "]";
	}

}
