<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!--
	날짜 : -
    이름 : 정순권
    내용 : -
-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/member/signup.css">
<script
	src="<%=request.getContextPath()%>/resources/js/member/signup.js"></script>
</head>
<body>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/member/postcode.js"></script>
	<jsp:include page="../header.jsp" />

	<main>
		<div class="info">
			<div>
				<span> <img
					src="<%=request.getContextPath()%>/resources/images/ico-home.png"
					alt="홈 버튼"> > 회원 > 회원가입
				</span>
			</div>
		</div>
		<div class="content-wrapper">
			<div class="register">
				<div class="topInfo">
					<span>
						<h4>회원가입</h4>
						<p>반갑습니다 그린대학교 입니다. 회원가입 후 더 많은 정보를 이용하세요.</p>
						<p>대학구성원(학생, 교직원)은 회원가입 없이 학번, 교번(사번) 아이디를 사용하여 로그인할 수 있습니다.</p>
					</span>
				</div>
				<div class="registerForm">
					<form action="<%=request.getContextPath()%>/member/signup.do"
						id="registerForm" method="post">
						<table class="registerTable">
							<tr>
								<th>아이디<i>*</i></th>
								<td><input type="text" name="user_id" required
									placeholder="아이디 입력"> <span class="user_idResult">영문·숫자
										조합 4~10자 이내</span></td>
							</tr>
							<tr>
								<th>비밀번호<i>*</i></th>
								<td><input type="password" name="user_pass1" required
									placeholder="비밀번호 입력"> <span class="passResult">비밀번호는
										8-16자리 이내, 영문 · 숫자 · 특수문자 조합</span></td>
							</tr>
							<tr>
								<th>비밀번호 확인<i>*</i></th>
								<td><input type="password" name="user_pass2" required
									placeholder="비밀번호 확인 입력"></td>
							</tr>
							<tr>
								<th>이름<i>*</i></th>
								<td><input type="text" name="user_name" required
									placeholder="이름 입력"> <span class="nameResult"></span></td>
							</tr>
							<tr>
								<th>휴대폰<i>*</i></th>
								<td><input type="tel" name="user_hp" required
									placeholder="휴대폰 입력"> <span class="hpResult"></span></td>
							</tr>
							<tr>
								<th>이메일<i>*</i></th>
								<td><input type="text" name="user_email" required
									placeholder="이메일 입력"> <span class="emailResult"></span>
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>
									<div class="address-group">
										<input type="text" id="postal_code" name="postal_code"
											placeholder="우편번호" onclick="postcode()" readonly> <input
											type="text" id="basic_addr" name="basic_addr"
											placeholder="기본주소" readonly> <input type="text"
											id="detail_addr" name="detail_addr" placeholder="상세주소">
									</div>
								</td>
							</tr>
						</table>
						<div class="form-footer">
							<span class="notice"><i>*</i>&nbsp&nbsp필수입력</span>
							<div class="selectBox">
								<a href="/member/login.do" class="btnCancel">취소</a>
								<button id="signUp" type="submit">회원가입</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../footer.jsp" />
</body>
</html>