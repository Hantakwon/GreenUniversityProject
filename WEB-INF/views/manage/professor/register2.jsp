<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 등록</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/manage/admin.css">
</head>
<body>
	<div id="admin-wrapper">
		<!-- ⬅️ 래퍼 추가 -->

		<jsp:include page="../common2/header.jsp" />

		<main>
			<jsp:include page="../common2/aside.jsp" />

			<section id="admin-index" class="main-mini-box">
				<nav>
					<h3>교수 등록</h3>
					<p>
						인사관리<strong>교수 등록</strong>
					</p>
				</nav>

				<!-- ⬇️ 등록 폼 (action은 그대로) -->
				<form method="post"
					action="${pageContext.request.contextPath}/manage/professor/register.do">
					<!-- 기본정보 -->
					<!-- 기본정보 입력 -->
					<h4 class="tit-h4">기본정보 입력</h4>
					<article>
						<table class="board-table form-table compact">
							<colgroup>
								<col style="width: 160px;">
								<!-- 사진 -->
								<col style="width: 120px;">
								<!-- 라벨L -->
								<col>
								<!-- 값L -->
								<col style="width: 120px;">
								<!-- 라벨R -->
								<col>
								<!-- 값R -->
							</colgroup>
							<tbody>
								<tr>
									<td rowspan="6" class="photo-cell"><img
										src="${pageContext.request.contextPath}/resources/images/icon-avatar.png"
										width="100" alt="증명사진"></td>
									<td class="tit15">교수번호</td>
									<td><span class="desc">연도 + 학과 코드 + 순번 조합 자동생성</span></td>
									<td class="tit15">주민등록번호</td>
									<td><input type="text" name="rrn" class="w-240"
										placeholder="- 포함 14자리 입력" required></td>
								</tr>

								<tr>
									<td class="tit15">이름</td>
									<td><input type="text" name="name_kor" class="w-240"
										placeholder="교수 이름 입력" required></td>
									<td class="tit15">영문명</td>
									<td><input type="text" name="name_eng" class="w-260"
										placeholder="여권 등과 동일한 영문 이름"></td>
								</tr>

								<tr>
									<td class="tit15">성별</td>
									<td><label class="radio"><input type="radio"
											name="gender" value="M" required> 남</label> <label
										class="radio"><input type="radio" name="gender"
											value="F"> 여</label></td>
									<td class="tit15">국적</td>
									<td><select name="nationality" class="w-160" required>
											<option value="">선택</option>
											<option>대한민국</option>
											<option>일본</option>
									</select></td>
								</tr>

								<tr>
									<td class="tit15">휴대폰</td>
									<td><input type="text" name="tel" class="w-240"
										placeholder="휴대폰 번호 입력"></td>
									<td class="tit15">이메일</td>
									<td><input type="email" name="email" class="w-260"
										placeholder="이메일 입력"></td>
								</tr>

								<tr>
									<td class="tit15">직위</td>
									<td><select name="position" class="w-160" required>
											<option value="">선택</option>
											<option>정교수</option>
											<option>부교수</option>
											<option>조교수</option>
											<option>강의전담</option>
									</select></td>
									<td class="tit15">재직여부</td>
									<td><select name="statement" class="w-160" required>
											<option>재직중</option>
											<option>휴직</option>
											<option>퇴직</option>
									</select></td>
								</tr>

								<tr>
									<td class="tit15">주소</td>
									<td colspan="3" class="addr-cell"><input type="text"
										name="zip_code" class="w-150" placeholder="우편번호"> <input
										type="text" name="address_basic" class="w-520"
										placeholder="기본주소"> <input type="text"
										name="address_detail" class="w-520" placeholder="상세주소">
									</td>
								</tr>
							</tbody>
						</table>
					</article>

					<!-- 학적정보 입력 -->
					<h4 class="tit-h4">학적정보 입력</h4>
					<article>
						<table class="board-table form-table compact">
							<colgroup>
								<col style="width: 160px;">
								<col style="width: 120px;">
								<col>
								<col style="width: 120px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<td></td>
									<td class="tit15">졸업대학</td>
									<td><input type="text" name="school" class="w-300"
										placeholder="대학교 이름 입력"></td>
									<td class="tit15">학문 분야(전공)</td>
									<td><input type="text" name="major" class="w-260"
										placeholder="전공 입력"></td>
								</tr>
								<tr>
									<td></td>
									<td class="tit15">졸업일</td>
									<td><input type="date" name="graduation_at" class="w-180"></td>
									<td class="tit15">학위</td>
									<td><select name="degree" class="w-160">
											<option value="">선택</option>
											<option>박사</option>
											<option>석사</option>
											<option>학사</option>
									</select></td>
								</tr>
								<tr>
									<td></td>
									<td class="tit15">담당학과</td>
									<td><select name="col_id" class="w-180">
											<option value="">대학 선택</option>
											<c:forEach var="c" items="${collegeList}">
												<option value="${c.col_id}">${c.name_kor}</option>
											</c:forEach>
									</select> <select name="dept_id" class="w-200">
											<option value="">학과 선택</option>
											<c:forEach var="d" items="${departmentList}">
												<option value="${d.dept_id}">${d.name_kor}</option>
											</c:forEach>
									</select></td>
									<td class="tit15">임용일</td>
									<td><input type="date" name="appointment_date"
										class="w-180"></td>
								</tr>
							</tbody>
						</table>

						<button type="submit" class="btn-primary fr">등록</button>
					</article>

				</form>
			</section>
		</main>

		<jsp:include page="../common2/footer.jsp" />

	</div>
	<!-- /#admin-wrapper -->
</body>
</html>
