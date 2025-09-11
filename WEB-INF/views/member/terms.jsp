<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--
	날짜 : 2025/09/11
    이름 : 정순권
    내용 : 약관 출력
-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/member/terms.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<main>
		<div class="info">
			<div>
				<span id="test"> <img
					src="<%=request.getContextPath()%>/resources/images/ico-home.png"
					alt="홈 버튼"> > 회원 > 약관안내
				</span>
			</div>
		</div>
		<div>
			<div class="content-wrapper">
				<div class="terms">
					<div class="topInfo">
						<span>
							<h4>약관안내</h4>
							<p>※ 대학구성원(학생, 교직원)은 회원가입 없이 학번, 교번(사번) 아이디를 사용하여 로그인할 수
								있습니다.</p>
							<p>※ 만 14세 미만 아동의 경우 홈페이지 회원가입에 제한이 있습니다.</p>
						</span>
					</div>
					<div class="termsAll">
						<form>
							<table class="termsTable">
								<tr>
									<th>이용약관</th>
									<td><span>${termsDTO.terms}</span></td>
								</tr>
								<tr>
									<th>개인정보 수집안내</th>
									<td><span>${termsDTO.privacy}
									</span></td>
								</tr>
							</table>
							<div class="agree">
								<input type="checkbox" id="agree"> <label for="agree">위의
									홈페이지 이용에 따른 회원가입 약관 및 개인정보 수집·이용에 모두 동의합니다.</label>
							</div>
							<div class="select">
								<button id="cancel">취소</button>
								<button id="next">다음</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../footer.jsp" />
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			const agreeCheckbox = document.getElementById('agree');
			const nextPageBtn = document.getElementById('next');
			const cancelBtn = document.getElementById('cancel');

			// 다음버튼
			nextPageBtn.addEventListener('click', function(e) {
				e.preventDefault(); // 기본 form 제출 동작 막기

				if (agreeCheckbox.checked) {
					window.location.href = '/member/signup.do';
				} else {
					alert('약관에 동의해야 회원가입이 가능합니다.')
				}
			});

			// 취소버튼
			cancelBtn.addEventListener('click', function(e) {
				e.preventDefault();

				window.history.back();
			});
		});
	</script>
</body>
</html>