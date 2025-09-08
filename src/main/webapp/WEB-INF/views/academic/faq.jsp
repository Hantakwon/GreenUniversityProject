<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린대학교 자주묻는질문(FAQ)</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/academic/hyokongmain.css">

</head>
<!-- 
	날짜 : 2025/09/08
	이름 : 박효빈
	내용 : 자주묻는질문 (임시테이블로 구현) 
-->
<body>
	<main>
		<div>
			<div class="info">
				<span id="test"> <img
					src="<%=request.getContextPath()%>/resources/images/ico-home.png"
					alt="홈 버튼"> &gt; 학사안내 &gt; 자주 묻는 질문
				</span>
			</div>
		</div>
		<div>
			<div class="content-wrapper">
				<!-- 사이드바 -->
				<div class="sidebar">
					<div class="top">
						<h1>학사안내</h1>
					</div>
					<div class="bottom">
						<ul>
							<li><a href="#">공지사항</a></li>
							<li><a href="#">학사일정</a></li>
							<li><a href="#">수강신청</a></li>
							<li><a href="#">성적</a></li>
							<li><a href="#">수료 및 졸업</a></li>
							<li class="active"><a href="#">자주 묻는 질문</a></li>
						</ul>
					</div>
				</div>

				<!-- 메인 콘텐츠 -->
				<div class="main-content">
					<div class="top">
						<h2>자주묻는질문</h2>
					</div>

					<br>

					<!-- 휴·복학 관련 -->
					<div class="bold-ment">
						<img src="<%=request.getContextPath()%>/resources/images/bullet-h4.png" alt="bullet-h4 이미지">
						<h4 class="span-bold">휴·복학 관련</h4>
						<ul class="faq-list">
							<!-- faq_휴 복학관련 시작 -->
							<c:forEach var="faq" items="${faqList}">
								<c:if test="${faq.category == '휴·복학 관련' }">
									<li>
										<button type="button" class="question" aria-expanded="false"
											aria-controls="faq1">
											<span class="q-icon">Q</span> ${faq.question}
										</button>
										<div id="faq1" class="answer">
											<span class="a-icon">A</span> ${faq.answer}

										</div>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>


					<!-- 교과 및 학사 관련 -->
					<div class="bold-ment">
						<img src="<%=request.getContextPath()%>/resources/images/bullet-h4.png" alt="bullet-h4 이미지">
						<h4 class="span-bold">교과 및 학사 관련</h4>
						<ul class="faq-list">
						<!-- 교과 및 학사 관련 시작 -->
							<c:forEach var="faq" items="${faqList}">
								<c:if test="${faq.category == '교과 및 학사 관련'}">
							<li>
								<button type="button" class="question" aria-expanded="false"
									aria-controls="faq5">
									<span class="q-icon">Q</span> ${faq.question}
									
								</button>
								<div id="faq5" class="answer">
									<span class="a-icon">A</span> ${faq.answer}
								</div>
							</li>
							
			
							</c:if>
							</c:forEach>
						</ul>
					</div>

					<!-- 수강신청 관련 -->
					<div class="bold-ment">
						<img src="<%=request.getContextPath()%>/resources/images/bullet-h4.png" alt="bullet-h4 이미지">
						<h4 class="span-bold">수강신청 관련</h4>
						<ul class="faq-list">
						<!-- 수강신청 관련 시작 -->
							<c:forEach var="faq" items="${faqList}">
								<c:if test="${faq.category == '수강신청 관련'}">
							<li>
								<button type="button" class="question" aria-expanded="false"
									aria-controls="faq8">
									<span class="q-icon">Q</span> ${faq.question }
								</button>
								<div id="faq5" class="answer">
									<span class="a-icon">A</span> ${faq.answer}
								</div>

							</li>
							
	
							</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</main>

	<jsp:include page="../header.jsp" />
	
	<jsp:include page="../footer.jsp" />
</body>
</html>