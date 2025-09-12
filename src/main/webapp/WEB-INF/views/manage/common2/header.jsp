<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<nav>
			<div class="top-header-box" style="max-width: 1400px;">
				<ul>
					<li><a href="${pageContext.request.contextPath}/manage/index.do"
						title="HOME 바로가기">HOME</a></li>
					<li><a href="#" class="sitemap-btn">사이트맵</a></li>
					<li class="login"><a
						href="${pageContext.request.contextPath}/logout.do">로그아웃</a></li>
				</ul>
			</div>
		</nav>
		<div>
			<div class="gnb">
				<a href="${pageContext.request.contextPath}/manage/index.do"
					class="logo"> <img
					src="${pageContext.request.contextPath}/resources/images/admin_logo.png"
					alt="admin_logo">
				</a>
			</div>
		</div>
	</header>
</body>
</html>