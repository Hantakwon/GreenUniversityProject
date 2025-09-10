package dao.stusup;


import java.util.ArrayList;
import java.util.List;

import dto.stusup.CreditStatusDTO;
import dto.stusup.ProfileDTO;
import dto.stusup.SemesterCreditDTO;

public class ProfileDAO {

    public ProfileDAO() {
        // 실제로는 DB 연결 설정
    }

    /**
     * 학생 기본정보를 조회하는 메서드
     * @return 학생 기본정보를 담은 ProfileDTO 객체
     */
    public ProfileDTO getProfileInfo() {
        // 실제로는 DB 쿼리를 통해 데이터를 조회
        return new ProfileDTO(
            "202001230",
            "컴퓨터공학과",
            "홍길동",
            "900103-1234567",
            "010-1234-1001",
            "hong1001@naver.com",
            "3학년/1학기",
            "재학중"
        );
    }

    /**
     * 취득학점 현황을 조회하는 메서드
     * @return 취득학점 현황을 담은 CreditStatusDTO 객체
     */
    public CreditStatusDTO getCreditStatus() {
        return new CreditStatusDTO(21, 16, 3, 0, 0, 40, 130);
    }

    /**
     * 학년/학기별 취득학점 현황을 조회하는 메서드
     * @return 학년/학기별 학점을 담은 SemesterCreditDTO 객체의 리스트
     */
    public List<SemesterCreditDTO> getSemesterCredits() {
        List<SemesterCreditDTO> semesterCreditList = new ArrayList<>();
        semesterCreditList.add(new SemesterCreditDTO(2020, 1, 1, 18, 15, 3, 0, 18, 3.2, ""));
        semesterCreditList.add(new SemesterCreditDTO(2020, 1, 2, 18, 15, 3, 0, 18, 3.2, ""));
        semesterCreditList.add(new SemesterCreditDTO(2021, 2, 1, 18, 18, 0, 0, 18, 4.2, ""));
        semesterCreditList.add(new SemesterCreditDTO(2021, 2, 2, 18, 18, 0, 0, 18, 4.2, ""));
        return semesterCreditList;
    }
}
