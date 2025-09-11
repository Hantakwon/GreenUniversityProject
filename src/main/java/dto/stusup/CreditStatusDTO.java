package dto.stusup;
/*
날짜: 2025/09/11
이름: 장진원
내용: 취득학점현황 DTO
CreditStatusDTO는 현재까지의 총 학점 현황을 요약해서 보여주는 데 사용
 */
public class CreditStatusDTO {

    private int majorCredit;
    private int liberalArtsCredit; // 교양
    private int electiveCredit; // 선택
    private int volunteerCredit; // 사회봉사
    private int etcCredit;
    private int totalCredit;
    private int graduationRequirement; // 졸업요건 학점

    public CreditStatusDTO(int majorCredit, int liberalArtsCredit, int electiveCredit, int volunteerCredit, int etcCredit, int totalCredit, int graduationRequirement) {
        this.majorCredit = majorCredit;
        this.liberalArtsCredit = liberalArtsCredit;
        this.electiveCredit = electiveCredit;
        this.volunteerCredit = volunteerCredit;
        this.etcCredit = etcCredit;
        this.totalCredit = totalCredit;
        this.graduationRequirement = graduationRequirement;
    }

    // Getter 메서드
    public int getMajorCredit() { return majorCredit; }
    public int getLiberalArtsCredit() { return liberalArtsCredit; }
    public int getElectiveCredit() { return electiveCredit; }
    public int getVolunteerCredit() { return volunteerCredit; }
    public int getEtcCredit() { return etcCredit; }
    public int getTotalCredit() { return totalCredit; }
    public int getGraduationRequirement() { return graduationRequirement; }
}