package dto;

import java.sql.Timestamp;

/*
 * 날짜 : 2025-09-11
 * 이름 : 한탁원
 * 내용 : 수강 신청 상세 조회 DTO
 */
public class EnrollmentDTO {

	private int year;
	private String semester;
	private String student_no;
	private String student_name;
	private String grade;
	private String dept_name;
	private String lecture_no;
	private String lecture_name;
	private String category;
	private String professor_name;
	private String credit;
	private Timestamp enrolled_at;

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public String getStudent_no() {
		return student_no;
	}

	public void setStudent_no(String student_no) {
		this.student_no = student_no;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getLecture_no() {
		return lecture_no;
	}

	public void setLecture_no(String lecture_no) {
		this.lecture_no = lecture_no;
	}

	public String getLecture_name() {
		return lecture_name;
	}

	public void setLecture_name(String lecture_name) {
		this.lecture_name = lecture_name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getProfessor_name() {
		return professor_name;
	}

	public void setProfessor_name(String professor_name) {
		this.professor_name = professor_name;
	}

	public String getCredit() {
		return credit;
	}

	public void setCredit(String credit) {
		this.credit = credit;
	}

	public Timestamp getEnrolled_at() {
		return enrolled_at;
	}

	public void setEnrolled_at(Timestamp enrolled_at) {
		this.enrolled_at = enrolled_at;
	}

	@Override
	public String toString() {
		return "EnrollmentDTO [year=" + year + ", semester=" + semester + ", student_no=" + student_no
				+ ", student_name=" + student_name + ", grade=" + grade + ", dept_name=" + dept_name + ", lecture_no="
				+ lecture_no + ", lecture_name=" + lecture_name + ", category=" + category + ", professor_name="
				+ professor_name + ", credit=" + credit + ", enrolled_at=" + enrolled_at + "]";
	}

}