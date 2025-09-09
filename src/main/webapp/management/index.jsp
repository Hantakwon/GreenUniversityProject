<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>운영현황 메인</title>
  <link rel="stylesheet" href="style.css">
  <script src="script.js" defer></script>
</head>
<body>
  <jsp:include page="_header.jsp"></jsp:include>
  <jsp:include page="_sidebar.jsp"></jsp:include>


  <div class="mainWrap">
    <div class="page">
      <div class="page-head">
        <div class="title">운영현황 메인</div>
        <div class="breadcrumb"><a href="#">HOME</a> &gt; 운영현황 메인</div>
      </div>

      <!-- 대학 운영 현황 -->
      <section class="panel">
        <div class="panel-head">대학 운영 현황</div>
        <div class="panel-body">
          <table class="table">
            <thead>
              <tr>
                <th>개설대학</th><th>개설강좌</th><th>전체교수</th><th>임직원</th>
                <th>운영 학과</th><th>학부생</th><th>대학원생</th><th>졸업생</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>3</td><td>214</td><td>64</td><td>24</td>
                <td>20</td><td>2047</td><td>127</td><td>5688</td>
              </tr>
            </tbody>
          </table>
        </div>
      </section>

      <!-- 교육 운영 현황 -->
      <section class="panel">
        <div class="panel-head">교육 운영 현황</div>
        <div class="panel-body">
          <table class="table">
            <thead>
              <tr>
                <th>학과</th><th>과목코드</th><th>과목명</th><th>학년</th>
                <th>담당교수</th><th>구분</th><th>학점</th><th>강의실</th><th>수강인원</th><th>수강률</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="tl">컴퓨터공학과</td><td>830003</td><td class="tl">자료구조</td><td>2</td>
                <td>김학수</td><td>전공</td><td>3</td><td>본관101</td><td>32 / 46</td><td>70%</td>
              </tr>
              <tr>
                <td class="tl">컴퓨터공학과</td><td>830001</td><td class="tl">프로그래밍의 이해</td><td>1</td>
                <td>김학수</td><td>전공</td><td>3</td><td>본관101</td><td>33 / 46</td><td>72%</td>
              </tr>
            </tbody>
          </table>
        </div>
      </section>

      <div class="grid-2">
        <!-- 학년별 학생 현황 -->
        <section class="panel">
          <div class="panel-head">학년별 학생 현황</div>
          <div class="panel-body">
            <table class="table">
              <thead><tr><th>학년</th><th>재학생</th><th>휴학생</th><th>전체</th></tr></thead>
              <tbody>
                <tr><td>1학년</td><td>460</td><td>32</td><td>492</td></tr>
                <tr><td>2학년</td><td>480</td><td>31</td><td>511</td></tr>
                <tr><td>3학년</td><td>460</td><td>32</td><td>492</td></tr>
                <tr><td>4학년</td><td>460</td><td>33</td><td>493</td></tr>
                <tr><td>총합</td><td>1860</td><td>128</td><td>1988</td></tr>
              </tbody>
            </table>
          </div>
        </section>

        <!-- 학과별 학생 현황 -->
        <section class="panel">
          <div class="panel-head">학과별 학생 현황</div>
          <div class="panel-body">
            <table class="table">
              <thead><tr><th>학과</th><th>재학생</th><th>휴학생</th><th>전체</th></tr></thead>
              <tbody>
                <tr><td class="tl">국어국문학과</td><td>120</td><td>2</td><td>122</td></tr>
                <tr><td class="tl">영어영문학과</td><td>87</td><td>3</td><td>90</td></tr>
                <tr><td class="tl">컴퓨터공학과</td><td>163</td><td>27</td><td>190</td></tr>
                <tr><td class="tl">경제학과</td><td>460</td><td>32</td><td>546</td></tr>
                <tr><td class="tl">총합</td><td>1860</td><td>128</td><td>1988</td></tr>
              </tbody>
            </table>
          </div>
        </section>
      </div>

      <div class="grid-2">
        <!-- 학사안내 공지사항 -->
        <section class="panel">
          <div class="panel-head">학사안내 공지사항</div>
          <div class="panel-body">
            <table class="table">
              <thead><tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th></tr></thead>
              <tbody>
                <tr><td>12</td><td class="tl">2025년도 신입생 추가모집 안내</td><td>담당자</td><td>24.04.09</td></tr>
                <tr><td>11</td><td class="tl">2025년도 신입생 추가모집 안내</td><td>담당자</td><td>24.04.09</td></tr>
                <tr><td>10</td><td class="tl">2025년도 신입생 추가모집 안내</td><td>담당자</td><td>24.04.09</td></tr>
              </tbody>
            </table>
          </div>
        </section>

        <!-- 입학상담 -->
        <section class="panel">
          <div class="panel-head">입학상담</div>
          <div class="panel-body">
            <table class="table">
              <thead><tr><th>번호</th><th>제목</th><th>작성일</th><th>상태</th></tr></thead>
              <tbody>
                <tr><td>5</td><td class="tl">[문의] 장학금 관련 문의드립니다.</td><td>24.04.09</td><td class="status ok">답변완료</td></tr>
                <tr><td>4</td><td class="tl">[문의] 등록금 추가감면 문의</td><td>24.04.09</td><td class="status ok">답변완료</td></tr>
                <tr><td>3</td><td class="tl">[문의] 기숙사 입사 문의</td><td>24.04.08</td><td class="status ok">답변완료</td></tr>
              </tbody>
            </table>
          </div>
        </section>
      </div>

    </div>
  </div>

  <div id="include-footer"></div>
</body>
</html>
