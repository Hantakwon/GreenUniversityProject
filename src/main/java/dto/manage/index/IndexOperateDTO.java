package dto.manage.index;

public class IndexOperateDTO {
	private int dept_cnt;
	private int lec_cnt;
	private int pro_cnt;
	private int emp_cnt;
	private int std_cnt;
	private int leave_cnt;
	private int grad_cnt;
	private int gradutes;

	public int getDept_cnt() {
		return dept_cnt;
	}

	public void setDept_cnt(int dept_cnt) {
		this.dept_cnt = dept_cnt;
	}

	public int getLec_cnt() {
		return lec_cnt;
	}

	public void setLec_cnt(int lec_cnt) {
		this.lec_cnt = lec_cnt;
	}

	public int getPro_cnt() {
		return pro_cnt;
	}

	public void setPro_cnt(int pro_cnt) {
		this.pro_cnt = pro_cnt;
	}

	public int getEmp_cnt() {
		return emp_cnt;
	}

	public void setEmp_cnt(int emp_cnt) {
		this.emp_cnt = emp_cnt;
	}

	public int getStd_cnt() {
		return std_cnt;
	}

	public void setStd_cnt(int std_cnt) {
		this.std_cnt = std_cnt;
	}

	public int getLeave_cnt() {
		return leave_cnt;
	}

	public void setLeave_cnt(int leave_cnt) {
		this.leave_cnt = leave_cnt;
	}

	public int getGrad_cnt() {
		return grad_cnt;
	}

	public void setGrad_cnt(int grad_cnt) {
		this.grad_cnt = grad_cnt;
	}

	public int getGradutes() {
		return gradutes;
	}

	public void setGradutes(int gradutes) {
		this.gradutes = gradutes;
	}

	@Override
	public String toString() {
		return "IndexOperateDTO [dept_cnt=" + dept_cnt + ", lec_cnt=" + lec_cnt + ", pro_cnt=" + pro_cnt + ", emp_cnt="
				+ emp_cnt + ", std_cnt=" + std_cnt + ", leave_cnt=" + leave_cnt + ", grad_cnt=" + grad_cnt
				+ ", gradutes=" + gradutes + "]";
	}

}
