package dto.professor;

import java.util.Date;

public class ProfessorInfoDTO {

	private String proNo;
	private String professorName;
	private String rrn;
	private String tel;
	private String email;
	private String departmentName;
	private String position;
	private String statement;
	private Date appointmentDate;

	public String getProNo() {
		return proNo;
	}

	public void setProNo(String proNo) {
		this.proNo = proNo;
	}

	public String getProfessorName() {
		return professorName;
	}

	public void setProfessorName(String professorName) {
		this.professorName = professorName;
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

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getStatement() {
		return statement;
	}

	public void setStatement(String statement) {
		this.statement = statement;
	}

	public Date getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(Date appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

	@Override
	public String toString() {
		return "ProfessorInfoDTO [proNo=" + proNo + ", professorName=" + professorName + ", rrn=" + rrn + ", tel=" + tel
				+ ", email=" + email + ", departmentName=" + departmentName + ", position=" + position + ", statement="
				+ statement + ", appointmentDate=" + appointmentDate + "]";
	}

}
