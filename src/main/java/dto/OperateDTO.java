package dto;

/*
 * 날짜 : 2025-09-11
 * 이름 : 한탁원
 * 내용 : 운영 현황 조회 DTO
 */
public class OperateDTO {

	private String dept_name;
	private String lecture_no;
	private String lecture_name;
	private String grade;
	private String professor_name;
	private String category;
	private String credit;
	private String classroom;
	private String enrollment_text;
	private String enrollment_rate;

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

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getProfessor_name() {
		return professor_name;
	}

	public void setProfessor_name(String professor_name) {
		this.professor_name = professor_name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCredit() {
		return credit;
	}

	public void setCredit(String credit) {
		this.credit = credit;
	}

	public String getClassroom() {
		return classroom;
	}

	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}

	public String getEnrollment_text() {
		return enrollment_text;
	}

	public void setEnrollment_text(String enrollment_text) {
		this.enrollment_text = enrollment_text;
	}

	public String getEnrollment_rate() {
		return enrollment_rate;
	}

	public void setEnrollment_rate(String enrollment_rate) {
		this.enrollment_rate = enrollment_rate;
	}

	@Override
	public String toString() {
		return "OperateDTO [dept_name=" + dept_name + ", lecture_no=" + lecture_no + ", lecture_name=" + lecture_name
				+ ", grade=" + grade + ", professor_name=" + professor_name + ", category=" + category + ", credit="
				+ credit + ", classroom=" + classroom + ", enrollment_text=" + enrollment_text + ", enrollment_rate="
				+ enrollment_rate + "]";
	}

}
