package dto.stusup;

public class GradeDTO {

    private String courseCode;
    private String subject;
    private String targetYear;
    private String professorName;
    private String classification;
    private double score;
    private String grade;
    private int credit;
    private String note;

    public GradeDTO(String courseCode, String subject, String targetYear, String professorName,
                    String classification, double score, String grade, int credit, String note) {
        this.courseCode = courseCode;
        this.subject = subject;
        this.targetYear = targetYear;
        this.professorName = professorName;
        this.classification = classification;
        this.score = score;
        this.grade = grade;
        this.credit = credit;
        this.note = note;
    }

    // Getter 메서드
    public String getCourseCode() {
        return courseCode;
    }

    public String getSubject() {
        return subject;
    }

    public String getTargetYear() {
        return targetYear;
    }

    public String getProfessorName() {
        return professorName;
    }

    public String getClassification() {
        return classification;
    }

    public double getScore() {
        return score;
    }

    public String getGrade() {
        return grade;
    }

    public int getCredit() {
        return credit;
    }

    public String getNote() {
        return note;
    }
}