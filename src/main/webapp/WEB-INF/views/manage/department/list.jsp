<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학과 목록</title>
</head>
<!-- 
	날짜 :
	이름 : 김수진
	내용 : 
-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/manage/style.css">
<script src="<%=request.getContextPath()%>/resources/js/manage/script.js"></script>
<body>
  	<jsp:include page="../common/manage_header.jsp" />
	<jsp:include page="../common/manage_sidebar.jsp" />

  <div class="mainWrap">
    <div class="page">
      <div class="page-head">
        <div class="title">학과 목록</div>
        <div class="breadcrumb">대학 및 학과 &gt; <a href="departmentList.html">학과 목록</a></div>
      </div>

      <div class="searchbar">
        <select><option>검색조건</option></select>
        <input type="text" placeholder="키워드 입력">
        <button class="btn">검색</button>
      </div>

      <section class="panel">
        <div class="panel-body">
          <table class="table">
            <thead>
              <tr>
                <th>학과번호</th><th>단과대학</th><th>학과</th><th>학과장</th>
                <th>학과 연락처</th><th>소속 교수수</th><th>소속 학생수</th><th>개설 강의수</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>10</td><td>인문사회대학</td><td>국어국문학과</td><td>김언어</td><td>051-512-1010</td><td>23</td><td>322</td><td>42</td>
              </tr>
              <tr>
                <td>11</td><td>인문사회대학</td><td>영어영문학과</td><td>김영문</td><td>051-512-1011</td><td>20</td><td>312</td><td>23</td>
              </tr>
              <tr>
                <td>31</td><td>공과대학</td><td>컴퓨터공학과</td><td>김컴공</td><td>051-512-1234</td><td>23</td><td>322</td><td>42</td>
              </tr>
            </tbody>
          </table>
        </div>
      </section>

      <div class="page-foot">
        <div class="paging">
          <button class="pg">&laquo;</button>
          <button class="pg active">1</button>
          <button class="pg">2</button>
          <button class="pg">3</button>
          <button class="pg">&raquo;</button>
        </div>
        <button class="btn btn-block" onclick="location.href='departmentRegister.html'">등록</button>
      </div>
    </div>
  </div>

	<jsp:include page="../common/manage_footer.jsp" />
</body>
</html>