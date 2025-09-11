package dto.manage.index;

public class IndexStudentSummaryByGradeDTO {
	private String grade;
	private int sumEnrolledCnt;
	private int sumLeaveCnt;
	private int sumTotalCnt;

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
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
		return "IndexStudentSummaryDTO [grade=" + grade + ", sumEnrolledCnt=" + sumEnrolledCnt + ", sumLeaveCnt="
				+ sumLeaveCnt + ", sumTotalCnt=" + sumTotalCnt + "]";
	}

}
