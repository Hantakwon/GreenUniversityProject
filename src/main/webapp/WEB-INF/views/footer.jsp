<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/footer.css">
</head>
<body>
	<footer>
		<!-- 상단 메뉴 -->
		<div class="terms-wrap">
			<div class="inner">
				<ul>
					<li><a href="#">개인정보처리방침</a></li>
					<li><a href="#">통합정보시스템</a></li>
					<li><a href="#">학사일정</a></li>
					<li><a href="#">주요민원 연락처</a></li>
					<li><a href="#">교내공지사항</a></li>
				</ul>
			</div>
		</div>

		<!-- 학교 정보 + 주요사이트 -->
		<div class="info-wrap">
			<div class="inner">
				<div class="info-left">
					<img src="<%=request.getContextPath()%>/resources/images/footer_logo.png" alt="그린대학교 로고">
					<div class="text">
						그린대학교<br> [12345] 부산광역시 부산진구 부전대로 123 그린대학교<br> 대표전화 :
						051-123-1000 | 입학안내 : 051-123-1302 | 팩스 : 051-123-3333<br> <span>copyright
							©Green University All rights reserved.</span>
					</div>
				</div>
				<div class="site">
					<select>
						<option>주요사이트 선택</option>
						<option>도서관</option>
						<option>학생포털</option>
						<option>취업정보센터</option>
						<option>국제교류센터</option>
					</select>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>