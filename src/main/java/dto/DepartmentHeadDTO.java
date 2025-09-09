package dto;

public class DepartmentHeadDTO {
	private String deptName;
	private String proName; 
	private String deptTel;

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getDeptTel() {
		return deptTel;
	}

	public void setDeptTel(String deptTel) {
		this.deptTel = deptTel;
	}

	@Override
	public String toString() {
		return "DepartmentHeadDTO [deptName=" + deptName + ", proName=" + proName + ", deptTel=" + deptTel + "]";
	}
	
	
}
