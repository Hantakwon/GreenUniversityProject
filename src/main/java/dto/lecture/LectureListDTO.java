package dto.lecture;

public class LectureListDTO {
	private String lec_no;
	private String dept_name;
	private String grade;
	private String category;
	private String lec_name;
	private String professor_name; 
	private String credit;
	private String schedule;
	private String classroom;
	private int max_enrollment;

	public String getLec_no() {
		return lec_no;
	}

	public void setLec_no(String lec_no) {
		this.lec_no = lec_no;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getLec_name() {
		return lec_name;
	}

	public void setLec_name(String lec_name) {
		this.lec_name = lec_name;
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

	public String getSchedule() {
		return schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

	public String getClassroom() {
		return classroom;
	}

	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}

	public int getMax_enrollment() {
		return max_enrollment;
	}

	public void setMax_enrollment(int max_enrollment) {
		this.max_enrollment = max_enrollment;
	}

	@Override
	public String toString() {
		return "LectureListDTO [lec_no=" + lec_no + ", dept_name=" + dept_name + ", grade=" + grade + ", category="
				+ category + ", lec_name=" + lec_name + ", professor_name=" + professor_name + ", credit=" + credit
				+ ", schedule=" + schedule + ", classroom=" + classroom + ", max_enrollment=" + max_enrollment + "]";
	}

}
