package dto.professor;

public class ProfessorRoleDTO {
	private int id;
	private int dept_id;
	private int pro_id;
	private String role;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "ProfessorRole [id=" + id + ", dept_id=" + dept_id + ", pro_id=" + pro_id + ", role=" + role + "]";
	}

}
