package dto;

import java.sql.Date;

/*
 * 날짜 : 2025-09-08
 * 이름 : 한탁원
 * 내용 : DTO 작성 예정
 */
public class StudentDTO {

	private int std_id;
	private int col_id;
	private int dept_id;
	private int pro_id;
	private String rrn;
	private String name_kor;
	private String name_eng;
	private String gender;
	private String nationality;
	private String tel;
	private String email;
	private String zip_code;
	private String address_basic;
	private String address_detail;
	private Date entrance_date;
	private Date graduate_date;
	private String statement;
	private String grade;
	private String semester;
	private String category;

	public int getStd_id() {
		return std_id;
	}

	public void setStd_id(int std_id) {
		this.std_id = std_id;
	}

	public void setStd_id(String std_id) {
		if (std_id != null) {
			this.std_id = Integer.parseInt(std_id);
		}
	}

	public int getCol_id() {
		return col_id;
	}

	public void setCol_id(int col_id) {
		this.col_id = col_id;
	}

	public int getDept_id() {
		return dept_id;
	}

	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}

	public int getPro_id() {
		return pro_id;
	}

	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}

	public String getRrn() {
		return rrn;
	}

	public void setRrn(String rrn) {
		this.rrn = rrn;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
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

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getAddress_basic() {
		return address_basic;
	}

	public void setAddress_basic(String address_basic) {
		this.address_basic = address_basic;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public Date getEntrance_date() {
		return entrance_date;
	}

	public void setEntrance_date(Date entrance_date) {
		this.entrance_date = entrance_date;
	}

	public Date getGraduate_date() {
		return graduate_date;
	}

	public void setGraduate_date(Date graduate_date) {
		this.graduate_date = graduate_date;
	}

	public String getStatement() {
		return statement;
	}

	public void setStatement(String statement) {
		this.statement = statement;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "StudentDTO [std_id=" + std_id + ", col_id=" + col_id + ", dept_id=" + dept_id + ", pro_id=" + pro_id
				+ ", rrn=" + rrn + ", name_kor=" + name_kor + ", name_eng=" + name_eng + ", gender=" + gender
				+ ", nationality=" + nationality + ", tel=" + tel + ", email=" + email + ", zip_code=" + zip_code
				+ ", address_basic=" + address_basic + ", address_detail=" + address_detail + ", entrance_date="
				+ entrance_date + ", graduate_date=" + graduate_date + ", statement=" + statement + ", grade=" + grade
				+ ", semester=" + semester + ", category=" + category + "]";
	}

}
