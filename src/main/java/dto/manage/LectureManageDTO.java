package dto.manage;
/*
 * 날짜 :
 * 이름 : 우지희
 * 내용 : 강의 dto
 */

public class LectureManageDTO {
    private int lecNo;               
    private String lenName;          
    private String category;
    private String department;
    private String grade;           
    private String semester;         
    private String credit;
    private String professor;
    private String description;     
    private String start_date;       
    private String end_date;         
    private String start_time;      
    private String end_time;         
    private String day_of_week;      
    private String evaluation;       
    private String textbook;         
    private String classroom;        
    private String max_enrollment;
    
    //요일, 시간 합침
    private String class_time;
    
    public String getClass_time() {
		return class_time;
	}
    public void setClass_time(String class_time) {
		this.class_time = class_time;
	}
    
    public void setDepartment(String department) {
		this.department = department;
	}
    public String getDepartment() {
		return department;
	}
    
    public String getProfessor() {
		return professor;
	}
    public void setProfessor(String professor) {
		this.professor = professor;
	}
	
    public int getLecNo() {
		return lecNo;
	}
	public void setLecNo(int lecNo) {
		this.lecNo = lecNo;
	}
	public String getLenName() {
		return lenName;
	}
	public void setLenName(String lenName) {
		this.lenName = lenName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
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
	public String getMax_enrollment() {
		return max_enrollment;
	}
	public void setMax_enrollment(String max_enrollment) {
		this.max_enrollment = max_enrollment;
	}
	
	@Override
	public String toString() {
		return "LectureManageDTO [lecNo=" + lecNo + ", lenName=" + lenName + ", category=" + category + ", grade="
				+ grade + ", semester=" + semester + ", credit=" + credit + ", description=" + description
				+ ", start_date=" + start_date + ", end_date=" + end_date + ", start_time=" + start_time + ", end_time="
				+ end_time + ", day_of_week=" + day_of_week + ", evaluation=" + evaluation + ", textbook=" + textbook
				+ ", classroom=" + classroom + ", max_enrollment=" + max_enrollment + "]";
	}     
	
	
	
}
