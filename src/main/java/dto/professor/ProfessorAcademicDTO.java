package dto.professor;

import java.sql.Date;

public class ProfessorAcademicDTO {
	private int acd_id;
	private int pro_id;
	private String school;
	private String major;
	private Date graduation_at;
	private String degree;
	private Date appointment_at;

	public int getAcd_id() {
		return acd_id;
	}

	public void setAcd_id(int acd_id) {
		this.acd_id = acd_id;
	}

	public int getPro_id() {
		return pro_id;
	}

	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public Date getGraduation_at() {
		return graduation_at;
	}

	public void setGraduation_at(Date graduation_at) {
		this.graduation_at = graduation_at;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public Date getAppointment_at() {
		return appointment_at;
	}

	public void setAppointment_at(Date appointment_at) {
		this.appointment_at = appointment_at;
	}

	@Override
	public String toString() {
		return "ProfessorAcademicDTO [acd_id=" + acd_id + ", pro_id=" + pro_id + ", school=" + school + ", major="
				+ major + ", graduation_at=" + graduation_at + ", degree=" + degree + ", appointment_at="
				+ appointment_at + "]";
	}

}
