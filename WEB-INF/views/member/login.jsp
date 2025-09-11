<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/member/login.css">

<script>
    // request.getAttribute가 null을 반환하면 "null"이라는 문자열이 됩니다.
    const message = '<%= request.getAttribute("message") %>';
    
    // message 값이 존재하고 "null" 문자열이 아닐 때만 alert를 실행합니다.
    if (message && message.trim() !== 'null') {
        alert(message);
    }
</script>

</head>
<body>
	<jsp:include page="../header.jsp" />
	<main>
		<div class="info">
			<div>
				<span> <img
					src="<%=request.getContextPath()%>/resources/images/ico-home.png"
					alt="홈 버튼"> > 회원 > 로그인
				</span>
			</div>
		</div>
		<div class="content-wrapper">
			<div class="login-container">
				<div class="loginBox">
					<h3>LOGIN</h3>
					<p>로그인을 하시면 더 다양한 서비스를 받으실 수 있습니다.</p>

					<form id="loginForm" action="/member/login.do" method="post">

						<div class="user-options">
							<div class="user-type-selection">
								<ul class="type">
									<li><input type="radio" id="typeStd" name="userType"
										value="student" class="checkbox"> <label for="typeStd">학부생</label></li>
									<li><input type="radio" id="typeProf" name="userType"
										value="staff" class="checkbox"> <label for="typeProf">교직원</label></li>
									<li><input type="radio" id="typeNull" name="userType"
										value="general" class="checkbox"> <label
										for="typeNull">일반인</label></li>
								</ul>
							</div>
							<div class="find-link">
								<a href="#">아이디/비밀번호 찾기</a>
							</div>
						</div>
						<div class="form-inputs">
							<input type="text" name="user_id" placeholder="아이디" required="required">
							<input type="password" name="user_pass" placeholder="비밀번호" required="required"
								>
						</div>
						<button type="submit" class="loginBtn">로그인</button>
						<div class="login-links">
							<a href="/member/terms.do">회원가입</a>
						</div>
					</form>
				</div>
				<div class="loginInfo">
					<h4>
						<img
							src="<%=request.getContextPath()%>/resources/images/bullet-h4.png"
							alt="아이콘">아이디, 비밀번호 안내
					</h4>
					<p>- 대학 구성원(학부생, 교직원)은 회원가입없이 교번, 학번을 사용하여 로그인이 가능합니다.</p>
					<p>- 비밀번호 분실시 학생지원팀에 방문하셔서 초기화하실 수 있습니다.</p>
					<p>- 재학, 휴학, 졸업 유예인 경우 사용하실 수 있으며, 매년 학적변동이 일어날 때 상태가 변경됩니다.</p>
					<p>- 문의사항이 있으시다면 담당자(055-123-4567)에게 전화주세요</p>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../footer.jsp" />
	<script
		src="<%=request.getContextPath()%>/resources/js/member/login.js"></script>
</body>
</html>