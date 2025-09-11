<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/academic/hyokongmain.css">

</head>
<!-- 
	날짜 : 2025-09-09
	이름 : 박효빈
	내용 : 수료 및 졸업 * 정적페이지 작성
-->
<body>
<jsp:include page="../header.jsp" />
<main>
  <div>
    <div class="info">
      <span id="test">
       <img src="/resources/images/ico-home.png"
					alt="홈 버튼">
        &gt; 학사안내 &gt; 수료 및 졸업
      </span>
    </div>
  </div>
  <div>
    <div class="content-wrapper">
      <div class="sidebar">
        <div class="top">
          <h1>학사안내</h1>
        </div>
        <div class="bottom">
          <ul>
            <li><a href="#">공지사항</a></li>
							<li class="#"><a href="/academic/calander.do">학사일정</a></li>
							<li><a href="/academic/registration.do">수강신청</a></li>
							<li class="#"><a href="/academic/grade.do">성적</a></li>
							<li class="active"><a href="/academic/graduation.do">수료 및 졸업</a></li>
							<li class="#"><a href="/academic/faq.do">자주 묻는 질문</a></li>
          </ul>
        </div>
      </div>
      <div class="main-content">
        <div class="top">
          <h2>수료 및 졸업</h2>
        </div>

        <div class="bold-ment">
		<img src="<%=request.getContextPath()%>/resources/images/bullet-h4.png" alt="bullet-h4 이미지">
          <h4 class="span-bold">수료기준</h4>
          <div class="ment1">
            <div class="scrollbox mg-b10">
              <table class="grade-table">
                <colgroup>
                  <col style="width:15%" />
                  <col style="width:15%" />
                  <col style="width:10%" />
                  <col style="width:15%" />
                  <col style="width:15%" />
                  <col style="width:15%" />
                  <col style="width:15%" />
                </colgroup>
                <thead>
                  <tr>
                    <th scope="col" colspan="2" rowspan="2">구분</th>
                    <th scope="col" rowspan="2">총 취득학점</th>
                    <th scope="col" colspan="4">수료 학점</th>
                  </tr>
                  <tr>
                    <th scope="col">1학년</th>
                    <th scope="col">2학년</th>
                    <th scope="col">3학년</th>
                    <th scope="col">4학년</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td colspan="2">인문대학</td>
                    <td>130이상</td>
                    <td>33</td>
                    <td>66</td>
                    <td>99</td>
                    <td>130</td>
                  </tr>
                  <tr>
                    <td colspan="2">사회과학대학</td>
                    <td>130이상</td>
                    <td>33</td>
                    <td>66</td>
                    <td>99</td>
                    <td>130</td>
                  </tr>
                  <tr>
                    <td colspan="2">경영대학</td>
                    <td>130이상</td>
                    <td>33</td>
                    <td>66</td>
                    <td>99</td>
                    <td>130</td>
                  </tr>
                  <tr>
                    <td colspan="2">자연과학대학</td>
                    <td>130이상</td>
                    <td>33</td>
                    <td>66</td>
                    <td>99</td>
                    <td>130</td>
                  </tr>
                  <tr>
                    <td colspan="2">정보과학대학</td>
                    <td>130이상</td>
                    <td>33</td>
                    <td>66</td>
                    <td>99</td>
                    <td>130</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <div class="bold-ment">
		<img src="<%=request.getContextPath()%>/resources/images/bullet-h4.png" alt="bullet-h4 이미지">
          <h4 class="span-bold">조기졸업</h4>
          <div class="ment1">
            <div class="con-box">
              <div class="scrollbox mg-b10">
                <table class="grade-table">
                  <colgroup>
                    <col style="width:30%" />
                    <col style="width:20%" />
                    <col style="width:20%" />
                    <col style="width:30%" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th scope="col" colspan="3">자격</th>
                      <th scope="col" rowspan="2">신청절차</th>
                    </tr>
                    <tr>
                      <th scope="col">이수학기</th>
                      <th scope="col">평점평균</th>
                      <th scope="col">취득학점</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="tl">
                        6학기 또는 7학기 이수자로서 해당학기 이수로 모든 졸업요건의 충족이 가능한 자.
                      </td>
                      <td>4.00 이상</td>
                      <td>정규졸업 요구학점과 동일</td>
                      <td class="tl">
                        졸업을 원하는 학기초 30일 이내에 “조기졸업신청서”를 교무팀에 제출
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <p class="con-p no-pd">※ 편입생 제외</p>
            </div>
            
          </div>
        </div>

		<div class="bold-ment">
		<img src="<%=request.getContextPath()%>/resources/images/bullet-h4.png" alt="bullet-h4 이미지">
          <h4 class="span-bold">졸업</h4>
          <div class="ment1">
            <div class="con-box">
              <div class="scrollbox mg-b10">
                     <table class="grade-table">
                      <colgroup>
                        <col style="width:15%">
                        <col style="width:15%">
                        <col style="width:15%">
                        <col style="width:15%">
                        <col style="width:15%">
                        <col style="width:25%">
                      </colgroup>
                      <thead>
                      <tr>
                        <th scope="col" colspan="2" rowspan="2">소속 단과대학</th>
                        <th scope="col" rowspan="2" style="border-right: 1px solid #dfdfdf">총 취득학점</th>
                        <th scope="col" colspan="3">전공 이수 학점</th>
                      </tr>
                      <tr>
                        <th scope="col">복수전공(제1전공 기준동일)</th>
                        <th scope="col">단일전공</th>
                        <th scope="col">부전공</th>
                      </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td colspan="2">인문대학</td>
                          <td>130이상</td>
                          <td>33</td>
                          <td>60</td>
                          <td>제1전공42 / 부전공21</td>
                        </tr>
                        <tr>
                          <td colspan="2">사회과학대학</td>
                          <td>130이상</td>
                          <td>33</td>
                          <td>60</td>
                          <td>제1전공42 / 부전공21</td>
                        </tr>
                        <tr>
                          <td colspan="2">경영대학</td>
                          <td>130이상</td>
                          <td>33</td>
                          <td>60</td>
                          <td>제1전공42 / 부전공21</td>
                        </tr>
                        <tr>
                          <td colspan="2">자연과학대학</td>
                          <td>130이상</td>
                          <td>33</td>
                          <td>70</td>
                          <td>제1전공50 / 부전공25</td>
                        </tr>
                        <tr>
                          <td colspan="2">정보과학대학</td>
                          <td>130이상</td>
                          <td>33</td>
                          <td>60</td>
                          <td>제1전공42 / 부전공21</td>
                        </tr>                        
                      </tbody>
                    </table>
              </div>

            </div>
            - 등록학기 : 8학기 이상, 의과대학 의학과는 12학기 이상<br>
            - 총 성적평점평균 : 2.00 이상<br>
            - 졸업논문(또는 졸업종합시험) : 합격<br>

          </div>
        </div>

		

      </div>
    </div>
  </div>
</main>
<jsp:include page="../footer.jsp" />

</body>
</html>