package dao.stusup;

import java.util.ArrayList;
import java.util.List;

import dto.stusup.GradeDTO;

public class GradeDAO {

	/*
	날짜: 2025/09/11
	이름: 장진원
	내용: 성적조회 DAO
	 */
    /**
     * 샘플 데이터를 생성하여 모든 성적 목록을 반환합니다.
     * 실제 구현에서는 데이터베이스에서 데이터를 조회하는 로직으로 대체됩니다.
     *
     * @return 모든 성적을 담고 있는 GradeDTO 객체의 리스트
     */
    public List<GradeDTO> getAllGrades() {
        List<GradeDTO> gradeList = new ArrayList<>();
        
        // 샘플 데이터 추가
        gradeList.add(new GradeDTO("830003", "자바 프로그래밍", "2학년", "김자바", "전공", 99.0, "A+", 3, "상세확인"));
        gradeList.add(new GradeDTO("830003", "자료 구조", "2학년", "김자료", "전공", 86.2, "B", 3, "상세확인"));
        gradeList.add(new GradeDTO("830003", "대학영어", "2학년", "김영어", "교양", 92.6, "A", 3, "상세확인"));
        gradeList.add(new GradeDTO("830003", "알고리즘", "2학년", "김자바", "전공", 56.2, "F", 0, "상세확인"));
        gradeList.add(new GradeDTO("830003", "세계의 역사", "2학년", "김역사", "교양", 80.0, "B", 3, "상세확인"));
        gradeList.add(new GradeDTO("830003", "데이터베이스", "2학년", "김디비", "전공", 88.8, "B+", 3, "상세확인"));

        return gradeList;
    }
}
