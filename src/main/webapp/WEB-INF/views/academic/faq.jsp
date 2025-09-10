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
	날짜 : 2025-09-08
	이름 : 박효빈
	내용 : 자주묻는질문  JSP 작성
-->
<body>
<jsp:include page="../header.jsp" />
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
							<c:forEach var="faq" items="${faqList}">
								<c:if test="${faq.category == '휴·복학 관련'}">
									<li>
										<div class="question">
											<span class="q-icon">Q</span> ${faq.question}
										</div>
										<c:if test="${not empty faq.answer}">
											<div class="answer">
												<span class="a-icon">A</span> ${faq.answer}
											</div>
										</c:if>
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
							<c:forEach var="faq" items="${faqList}">
								<c:if test="${faq.category == '교과 및 학사 관련'}">
									<li>
										<div class="question">
											<span class="q-icon">Q</span> ${faq.question}
										</div>
										<c:if test="${not empty faq.answer}">
											<div class="answer">
												<span class="a-icon">A</span> ${faq.answer}
											</div>
										</c:if>
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
							<c:forEach var="faq" items="${faqList}">
								<c:if test="${faq.category == '수강신청 관련'}">
									<li>
										<div class="question">
											<span class="q-icon">Q</span> ${faq.question}
										</div>
										<c:if test="${not empty faq.answer}">
											<div class="answer">
												<span class="a-icon">A</span> ${faq.answer}
											</div>
										</c:if>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					
					<!-- FAQ 데이터가 없을 때 -->
					<c:if test="${empty faqList}">
						<div style="text-align: center; padding: 50px 0; color: #666;">
							<p>등록된 FAQ가 없습니다.</p>
						</div>
					</c:if>
				</div>
			</div>
		</div>
			
		
	</main>
	<jsp:include page="../footer.jsp" />
</body>
</html>