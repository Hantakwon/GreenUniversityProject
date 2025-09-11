<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린대학교 갤러리</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/academic/hyokongmain.css">
</head>
<!--
    날짜 : 2025-09-10
    이름 : 박효빈
    내용 : 갤러리 jsp 페이지 (페이징 적용 완료)
-->
<!--
    날짜 : 2025-09-11
    이름 : 정순권
    내용 : gallery header main태그 밖으로 이동, sidebar 링크 수정
-->
<body>

	<jsp:include page="../header.jsp" />
	<main>

		<div>
			<div class="info">
				<span id="test"> <img
					src="<%=request.getContextPath()%>/resources/images/ico-home.png"
					alt="홈버튼"> > 대학생활 > 갤러리
				</span>
			</div>
		</div>

		<div>
			<div class="content-wrapper">
				<!-- 사이드바 -->
				<div class="sidebar">
					<div class="top">
						<h1>대학생활</h1>
					</div>
					<div class="bottom">
						<ul>
							<li><a href="/collegelife/studentunion.do">학생회 소개</a></li>
							<li><a href="/collegelife/clud.do">동아리/스터디</a></li>
							<li><a href="/collegelife/meal.do">식단안내</a></li>
							<li class="active"><a href="/collegelife/gallery.do">갤러리</a></li>
						</ul>
					</div>
				</div>

				<!-- 메인 컨텐츠 -->
				<div class="main-content">
					<div class="top">
						<h2>갤러리</h2>
					</div>

					<div class="bold-ment">
						<div class="gallery-container">
							<!-- 갤러리 목록 반복 -->
							<c:forEach var="item" items="${galleryList}">
								<div class="gallery-item">
									<div class="img-box">
										<img
											src="<%=request.getContextPath()%><c:out value='${item.image_path}'/>"
											alt="${item.title}">
									</div>
									<div class="text-box">
										<p class="title">${item.title}</p>
										<div class="details">
											<span class="view-count">조회수 ${item.rdcnt}</span> <span
												class="divider">|</span> <span class="date"> 글 등록일 <c:out
													value="${item.reg_date}" />
											</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- // gallery-container -->

						<!-- 페이지 네비게이션 -->
						<div class="page-wrapper">
							<div class="page">
								<!-- 처음 페이지 -->
								<a href="gallery.do?page=1"> <img
									src="<%=request.getContextPath()%>/resources/images/btn-first-page.png"
									class="pagination-arrow first" />
								</a>

								<!-- 이전 페이지 -->
								<c:if test="${currentPage > 1}">
									<a href="gallery.do?page=${currentPage - 1}"> <img
										src="<%=request.getContextPath()%>/resources/images/btn-prev-page.png"
										class="pagination-arrow prev" />
									</a>
								</c:if>

								<!-- 페이지 번호 -->
								<c:forEach var="i" begin="1" end="${lastPageNum}">
									<c:choose>
										<c:when test="${i == currentPage}">
											<button class="page-btn active">${i}</button>
										</c:when>
										<c:otherwise>
											<a href="gallery.do?page=${i}">
												<button class="page-btn">${i}</button>
											</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<!-- 다음 페이지 -->
								<c:if test="${currentPage < lastPageNum}">
									<a href="gallery.do?page=${currentPage + 1}"> <img
										src="<%=request.getContextPath()%>/resources/images/btn-next-page.png"
										class="pagination-arrow next" />
									</a>
								</c:if>

								<!-- 마지막 페이지 -->
								<a href="gallery.do?page=${lastPageNum}"> <img
									src="<%=request.getContextPath()%>/resources/images/btn-last-page.png"
									class="pagination-arrow last" />
								</a>
							</div>
						</div>
						<!-- // page-wrapper -->
					</div>
					<!-- // bold-ment -->
				</div>
				<!-- // main-content -->
			</div>
			<!-- // content-wrapper -->
		</div>
	</main>
	<jsp:include page="../footer.jsp" />
</body>
</html>
