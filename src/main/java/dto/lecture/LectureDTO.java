package dto.lecture;

import java.sql.Date;
import java.time.LocalTime;

/*
 * 날짜 : 2025-09-08
 * 이름 : 한탁원
 * 내용 : DTO 작성 예정
 */
public class LectureDTO {
	private int lec_id;
	private int pro_id;
	private int dept_id;
	private String lec_no;
	private String grade;
	private String semester;
	private String credit;
	private String category;
	private String lec_name;
	private String description;
	private Date start_date;
	private Date end_date;
	private LocalTime start_time;
	private LocalTime end_time;
	private String day_of_week;
	private String evaluation;
	private String textbook;
	private String classroom;
	private int max_enrollment;

	public int getLec_id() {
		return lec_id;
	}

	public void setLec_id(int lec_id) {
		this.lec_id = lec_id;
	}

	public int getPro_id() {
		return pro_id;
	}

	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}

	public int getDept_id() {
		return dept_id;
	}

	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}

	public String getLec_no() {
		return lec_no;
	}

	public void setLec_no(String lec_no) {
		this.lec_no = lec_no;
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

	public String getCredit() {
		return credit;
	}

	public void setCredit(String credit) {
		this.credit = credit;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public LocalTime getStart_time() {
		return start_time;
	}

	public void setStart_time(LocalTime start_time) {
		this.start_time = start_time;
	}

	public LocalTime getEnd_time() {
		return end_time;
	}

	public void setEnd_time(LocalTime end_time) {
		this.end_time = end_time;
	}

	public String getDay_of_week() {
		return day_of_week;
	}

	public void setDay_of_week(String day_of_week) {
		this.day_of_week = day_of_week;
	}

	public String getEvaluation() {
		return evaluation;
	}

	public void setEvaluation(String evaluation) {
		this.evaluation = evaluation;
	}

	public String getTextbook() {
		return textbook;
	}

	public void setTextbook(String textbook) {
		this.textbook = textbook;
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
		return "LectureDTO [lec_id=" + lec_id + ", pro_id=" + pro_id + ", dept_id=" + dept_id + ", lec_no=" + lec_no
				+ ", grade=" + grade + ", semester=" + semester + ", credit=" + credit + ", category=" + category
				+ ", lec_name=" + lec_name + ", description=" + description + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", start_time=" + start_time + ", end_time=" + end_time + ", day_of_week="
				+ day_of_week + ", evaluation=" + evaluation + ", textbook=" + textbook + ", classroom=" + classroom
				+ ", max_enrollment=" + max_enrollment + "]";
	}

}
