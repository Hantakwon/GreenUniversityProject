package dao.stusup;

import java.util.ArrayList;
import java.util.List;

import dto.stusup.CurriculumDTO;

public class CurriculumDAO {

	/*
	날짜: 2025/09/11
	이름: 장진원
	내용: 커리큘럼 DAO
	 */
    public CurriculumDAO() {
        // 실제로는 DB 연결 설정 등 초기화 코드가 위치
    }

    /**
     * 교과과정 목록을 조회하는 메서드
     * @return 교과과정 데이터를 담은 CurriculumDTO 객체의 리스트
     */
    public List<CurriculumDTO> getCurriculumList() {
        List<CurriculumDTO> list = new ArrayList<>();
        
        // 샘플 데이터 추가
        list.add(new CurriculumDTO("CS001", "자바 프로그래밍", "전공필수", "3", "김자바", "1학년 1학기", "없음"));
        list.add(new CurriculumDTO("CS002", "자료구조", "전공필수", "3", "박구조", "1학년 2학기", "자바 프로그래밍"));
        list.add(new CurriculumDTO("CS003", "운영체제", "전공선택", "3", "이운영", "2학년 1학기", "자료구조"));
        list.add(new CurriculumDTO("GE101", "대학영어", "교양필수", "2", "최영어", "1학년 1학기", "없음"));
        list.add(new CurriculumDTO("GE102", "기초수학", "교양선택", "3", "정수학", "1학년 1학기", "없음"));

        return list;
    }
}