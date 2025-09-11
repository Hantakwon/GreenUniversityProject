package dto.stusup;
/*
날짜: 2025/09/11
이름: 장진원
내용: 프로필 DTO
 */
public class ProfileDTO {

    private String studentId;
    private String department;
    private String name;
    private String residentNumber; // 주민번호
    private String phoneNumber;
    private String email;
    private String gradeAndSemester;
    private String status; // 재학 상태

    public ProfileDTO(String studentId, String department, String name, String residentNumber, String phoneNumber, String email, String gradeAndSemester, String status) {
        this.studentId = studentId;
        this.department = department;
        this.name = name;
        this.residentNumber = residentNumber;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.gradeAndSemester = gradeAndSemester;
        this.status = status;
    }

    // Getter 메서드
    public String getStudentId() { return studentId; }
    public String getDepartment() { return department; }
    public String getName() { return name; }
    public String getResidentNumber() { return residentNumber; }
    public String getPhoneNumber() { return phoneNumber; }
    public String getEmail() { return email; }
    public String getGradeAndSemester() { return gradeAndSemester; }
    public String getStatus() { return status; }
}
