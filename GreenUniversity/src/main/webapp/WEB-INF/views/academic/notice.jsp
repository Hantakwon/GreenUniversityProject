<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 
	날짜 :
	이름 : 박효빈
	내용 : 공지사항
-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/academic/notice.css">
<body>
	<main>
		<div>
			<div class="info">
				<span id="test">
					<img src="<%=request.getContextPath()%>/resources/images/ico-home.png" alt="홈 버튼">
					> 학사안내 > 공지사항
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
							<li class="active"><a href="./학사안내-공지사항.html">공지사항</a></li>
							<li><a href="./학사안내-학사일정.html">학사일정</a></li>
							<li><a href="./학사안내-수강신청.html">수강신청</a></li>
							<li><a href="#">성적</a></li>
							<li><a href="#">수료 및 졸업</a></li>
							<li><a href="#">자주 묻는 질문</a></li>
						</ul>
					</div>
				</div>
				<div class="main-content">
					<div class="top">
						<h2>공지사항</h2>
					</div>
					<!-- 🔍 공지사항 검색  시작 -->
					<div class="search-container">
						<div class="search-div">
							<select name="category">
								<option value="all">전체</option>
								<option value="title">제목</option>
								<option value="author">작성자</option>
							</select>
							<input type="text" name="keyword" placeholder="검색어를 입력하세요">
							<button type="submit">검색</button>
						</div>
					</div>

					<!-- 📋 공지사항 목록 테이블 시작 -->
					<div class="notice-list-wrapper">
						<div class="notice-list">
							<table>
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>2023학년도 신입생 수강 신청 안내 및 오리엔테이션 일정</td>
										<td>담당자</td>
										<td>23-04-09</td>
										<td>160</td>
									</tr>
									<tr>
										<td>2</td>
										<td>2023학년도 신입생 오리엔테이션 일정 안내</td>
										<td>담당자</td>
										<td>23-04-09</td>
										<td>160</td>
									</tr>
									<tr>
										<td>3</td>
										<td>[공지]2023년 강의평가 일정 및 방법 안내</td>
										<td>담당자</td>
										<td>23-04-09</td>
										<td>160</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>


					<div class="page-wrapper">
						<div class="page">
							<img src="<%=request.getContextPath()%>/resources/images/btn-first-page.png" alt="첫 페이지" class="pagination-arrow first">
							<img src="<%=request.getContextPath()%>/resources/images/btn-prev-page.png" alt="이전 페이지" class="pagination-arrow prev">
							<button class="page-btn active">1</button>
							<button class="page-btn">2</button>
							<button class="page-btn">3</button>
							<img src="<%=request.getContextPath()%>/resources/images/btn-next-page.png" alt="다음 페이지" class="pagination-arrow next">
							<img src="<%=request.getContextPath()%>/resources/images/btn-last-page.png" alt="마지막 페이지" class="pagination-arrow last">
							<!-- <p>컨텐츠 내용 구역입니다.</p> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>