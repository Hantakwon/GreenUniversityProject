package dto.stusup;
/*
날짜: 2025/09/11
이름: 장진원
내용:  학년/학기별 취득 학점 현황 DTO
SemesterCreditDTO는 특정 학년/학기별 학점 현황을 상세하게 보여주는 데 사용
 */
public class SemesterCreditDTO {

    private int year;
    private int grade;
    private int semester;
    private int appliedCredit; // 신청학점
    private int majorCredit;
    private int electiveCredit;
    private int etcCredit;
    private int totalCredit;
    private double gpa; // 평점평균
    private String note;

    public SemesterCreditDTO(int year, int grade, int semester, int appliedCredit, int majorCredit, int electiveCredit, int etcCredit, int totalCredit, double gpa, String note) {
        this.year = year;
        this.grade = grade;
        this.semester = semester;
        this.appliedCredit = appliedCredit;
        this.majorCredit = majorCredit;
        this.electiveCredit = electiveCredit;
        this.etcCredit = etcCredit;
        this.totalCredit = totalCredit;
        this.gpa = gpa;
        this.note = note;
    }

    // Getter 메서드
    public int getYear() { return year; }
    public int getGrade() { return grade; }
    public int getSemester() { return semester; }
    public int getAppliedCredit() { return appliedCredit; }
    public int getMajorCredit() { return majorCredit; }
    public int getElectiveCredit() { return electiveCredit; }
    public int getEtcCredit() { return etcCredit; }
    public int getTotalCredit() { return totalCredit; }
    public double getGpa() { return gpa; }
    public String getNote() { return note; }
}
