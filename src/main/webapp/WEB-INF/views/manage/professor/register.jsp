<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 등록</title>
</head>
<!-- 
	날짜 :
	이름 : 김수진
	내용 : 
-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/manage/style.css">
<script src="<%=request.getContextPath()%>/resources/js/manage/script.js"></script>
<body>
	<jsp:include page="../common/manage_header.jsp" />
	<jsp:include page="../common/manage_sidebar.jsp" />


	<div class="mainWrap">
		<div class="page">
			<div class="page-head">
				<div class="title">교수 등록</div>
				<div class="breadcrumb">
					인사관리 &gt; <a href="professorRegister.html">교수 등록</a>
				</div>
			</div>

			<!-- 기본정보 입력 -->
			<section class="formset">
				<div class="set-head">기본정보 입력</div>
				<div class="set-body">
					<div class="form-row">
						<div class="photo">PHOTO</div>
						<div style="flex: 1">
							<div class="form-grid">
								<label>교수번호</label><input type="text"
									placeholder="연도+학과코드+순번 조합 자동생성" disabled> <label>주민등록번호</label><input
									type="text" placeholder="- 포함 14자리 입력"> <label>이름</label><input
									type="text" placeholder="교수 이름 입력"> <label>영문명</label><input
									type="text" placeholder="여권 등과 동일한 영문 이름"> <label>성별</label>
								<div>
									<label><input type="radio" name="g2"> 남</label> <label
										style="margin-left: 12px"><input type="radio"
										name="g2"> 여</label>
								</div>
								<label>국적</label> <select>
									<option>선택</option>
									<option>대한민국</option>
									<option>기타</option>
								</select> <label>휴대폰</label><input type="text" placeholder="휴대폰 번호 입력">
								<label>이메일</label><input type="email" placeholder="이메일 입력">

								<label>주소</label>
								<div class="addr-2">
									<input type="text" placeholder="우편번호 입력"
										style="margin-bottom: 8px"> <input type="text"
										placeholder="기본주소 입력" style="margin-bottom: 8px"> <input
										type="text" placeholder="상세주소 입력">
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

			<!-- 학적정보 입력 -->
			<section class="formset">
				<div class="set-head">학적정보 입력</div>
				<div class="set-body">
					<div class="form-grid">
						<label>출신대학</label><input type="text" placeholder="대학 이름 입력">
						<label>학문 분야(전공)</label><input type="text" placeholder="전공 입력">

						<label>졸업일</label><input type="date"> <label>학위</label><select><option>박사</option>
							<option>석사</option>
							<option>학사</option></select> <label>담당학과</label>
						<div class="form-row">
							<select><option>인문사회대학</option>
								<option>자연과학대학</option>
								<option>공과대학</option></select> <select><option>영어영문학과</option>
								<option>국어국문학과</option>
								<option>컴퓨터공학과</option></select>
						</div>

						<label>직위</label><select><option>정교수</option>
							<option>부교수</option>
							<option>조교수</option></select> <label>임용일</label><input type="date">
					</div>
				</div>
			</section>

			<div class="page-foot">
				<div></div>
				<button class="btn btn-block" type="submit">등록</button>
			</div>
		</div>
	</div>

	<jsp:include page="../common/manage_footer.jsp" />
</body>
</html>