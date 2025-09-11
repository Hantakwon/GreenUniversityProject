package dto.manage.index;

public class IndexStudentSummaryByDeptDTO {
	private String dept_name;
	private int sumEnrolledCnt;
	private int sumLeaveCnt;
	private int sumTotalCnt;

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public int getSumEnrolledCnt() {
		return sumEnrolledCnt;
	}

	public void setSumEnrolledCnt(int sumEnrolledCnt) {
		this.sumEnrolledCnt = sumEnrolledCnt;
	}

	public int getSumLeaveCnt() {
		return sumLeaveCnt;
	}

	public void setSumLeaveCnt(int sumLeaveCnt) {
		this.sumLeaveCnt = sumLeaveCnt;
	}

	public int getSumTotalCnt() {
		return sumTotalCnt;
	}

	public void setSumTotalCnt(int sumTotalCnt) {
		this.sumTotalCnt = sumTotalCnt;
	}

	@Override
	public String toString() {
		return "IndexStudentSummaryByDeptDTO [dept_name=" + dept_name + ", sumEnrolledCnt=" + sumEnrolledCnt
				+ ", sumLeaveCnt=" + sumLeaveCnt + ", sumTotalCnt=" + sumTotalCnt + "]";
	}

}
