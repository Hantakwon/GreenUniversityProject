package dto.stusup;

public class CurriculumDTO {
    private String subjectNumber; // 과목번호
    private String subjectName; // 과목명
    private String subjectType; // 이수구분 (전공, 교양 등)
    private String subjectCredit; // 학점
    private String professor; // 담당교수
    private String semester; // 개설학기
    private String prerequisite; // 선수과목

    public CurriculumDTO(String subjectNumber, String subjectName, String subjectType, String subjectCredit, String professor, String semester, String prerequisite) {
        this.subjectNumber = subjectNumber;
        this.subjectName = subjectName;
        this.subjectType = subjectType;
        this.subjectCredit = subjectCredit;
        this.professor = professor;
        this.semester = semester;
        this.prerequisite = prerequisite;
    }

    // Getter 메서드
    public String getSubjectNumber() { return subjectNumber; }
    public String getSubjectName() { return subjectName; }
    public String getSubjectType() { return subjectType; }
    public String getSubjectCredit() { return subjectCredit; }
    public String getProfessor() { return professor; }
    public String getSemester() { return semester; }
    public String getPrerequisite() { return prerequisite; }
}