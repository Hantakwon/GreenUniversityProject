<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%-- 이 줄을 추가합니다. --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린대학교 갤러리</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/academic/hyokongmain.css">

</head>
<!--
	날짜 : 2025-09-09
	이름 : 박효빈
	내용 : 갤러리 jsp 페이지 작업 진행중
-->

<body>
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
				<div class="sidebar">
					<div class="top">
						<h1>대학생활</h1>
					</div>
					<div class="bottom">
						<ul>
							<li class="#"><a href="#">학생회 소개</a></li>
							<li class="#"><a href="#">동아리/스터디</a></li>
							<li><a href="#">식단안내</a></li>
							<li class="active"><a href="#">갤러리</a></li>

						</ul>
					</div>
				</div>
				<div class="main-content">
					<div class="top">
						<h2>갤러리</h2>
					</div>
					<div class="bold-ment">
						<div class="gallery-container">
							<!-- c:forEach 시작: gallery-item을 반복합니다. -->
							<c:forEach var="item" items="${galleryList}">
								<div class="gallery-item">
									<div class="img-box">
										<img
											src="<%=request.getContextPath()%><c:out value="${item.image_path}"/>"
											alt="${item.title}">
										<%-- alt 속성을 동적으로 변경했습니다 --%>
									</div>
									<div class="text-box">
										<p class="title">${item.title }</p>
										<div class="details">
											<span class="view-count">조회수 ${item.rdcnt}</span> <span
												class="divider">|</span> <span class="date">글 등록일 <c:catch
													var="fmtError">
													<%-- 날짜 파싱 실패 시 오류를 잡기 위함 --%>
													<fmt:parseDate value="${item.reg_date}" var="parsedRegDate"
														pattern="yyyy-MM-dd HH:mm:ss" />
													<%-- DTO의 reg_date String 형식을 정확히 지정 --%>
													<fmt:formatDate value="${parsedRegDate}" pattern="yy.MM.dd" />
												</c:catch> <c:if test="${fmtError != null}">
													<%-- 파싱 오류 시 원본 문자열 출력 --%>
        											${item.reg_date} (날짜 형식 오류)
    													</c:if>
											</span>
											<%-- pattertn 오타와 DTO 필드명 수정했습니다 --%>
										</div>
									</div>
								</div>
							</c:forEach>
							<!-- c:forEach 끝 -->
						</div>
						<%-- .gallery-container 닫힘 --%>

						<div class="page-wrapper">
							<div class="page">
									 <img src="<%=request.getContextPath()%>/resources/images/btn-first-page.png"
										class="pagination-arrow first"/>
										 <img src="<%=request.getContextPath()%>/resources/images/btn-prev-page.png"
										class="pagination-arrow prev"/>
								<button class="page-btn active">1</button>
								<button class="page-btn">2</button>
								<button class="page-btn">3</button>
								<img src="<%=request.getContextPath()%>/resources/images/btn-next-page.png"
										class="pagination-arrow next"/>
										 <img src="<%=request.getContextPath()%>/resources/images/btn-last-page.png"
										class="pagination-arrow last"/>
							</div>
						</div>
						<%-- .page-wrapper 닫힘 --%>
					</div>
					<%-- .bold-ment 닫힘 --%>
				</div>
				<%-- .main-content 닫힘 --%>
			</div>
			<%-- .content-wrapper 닫힘 --%>
		</div>
		<%-- 상위 div 닫힘 --%>
	</main>
</body>
</html>