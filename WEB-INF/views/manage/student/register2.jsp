<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 등록</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/manage/admin.css">
</head>
<body>
	<div id="admin-wrapper">
		<jsp:include page="../common2/header.jsp" />

		<main>
			<jsp:include page="../common2/aside.jsp" />

			<section id="admin-index" class="main-mini-box">
				<nav>
					<h3>학생 등록</h3>
					<p>
						인사관리<strong>학생 등록</strong>
					</p>
				</nav>

				<form method="post"
					action="${pageContext.request.contextPath}/manage/student/register.do">
					<!-- 기본정보 입력 -->
					<h4 class="tit-h4" style="position: relative;">기본정보 입력</h4>
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
									<td rowspan="5" class="photo-cell"><img
										src="${pageContext.request.contextPath}/resources/images/icon-avatar.png"
										width="100" alt="증명사진"> <!-- 사진 업로드가 필요하면 아래 주석 해제
                                        <div class="mt-8">
                                            <input type="file" name="photo" accept="image/*">
                                        </div>
                                        (enctype="multipart/form-data" 도 form에 추가 필요)
                                        --></td>
									<td class="tit15">학번</td>
									<td><span class="desc">연도 + 학과 코드 + 순번 조합 자동생성</span></td>
									<td class="tit15">주민등록번호</td>
									<td><input type="text" name="rrn" class="w-240"
										placeholder="- 포함 14자리 입력" required>
									</td>
								</tr>

								<tr>
									<td class="tit15">이름</td>
									<td><input type="text" name="name_kor" class="w-240"
										placeholder="학생 이름 입력" required></td>
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
											<option>중국</option>
											<option>미국</option>
											<option>기타</option>
									</select></td>
								</tr>

								<tr>
									<td class="tit15">휴대폰</td>
									<td><input type="text" name="tel" class="w-240"
										placeholder="010-1234-5678">
									</td>
									<td class="tit15">이메일</td>
									<td><input type="email" name="email" class="w-260"
										placeholder="이메일 입력"></td>
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
					<h4 class="tit-h4" style="position: relative;">학적정보 입력</h4>
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
									<td class="tit15">입학일</td>
									<td><input type="date" name="entrance_date" class="w-180">
									</td>
									<td class="tit15">졸업일</td>
									<td><input type="date" name="graduate_date" class="w-180">
									</td>
								</tr>

								<tr>
									<td></td>
									<td class="tit15">입학구분</td>
									<td><select name="category" class="w-160">
											<option value="">선택</option>
											<option>수시</option>
											<option>정시</option>
											<option>편입</option>
											<option>재입학</option>
									</select></td>
									<td class="tit15">소속대학/학과</td>
									<td><select name="dept_id" class="w-200" required>
											<option value="">학과 선택</option>
											<c:forEach var="d" items="${departmentList}">
												<option value="${d.dept_id}">${d.name_kor}</option>
											</c:forEach>
									</select></td>
								</tr>

								<tr>
									<td></td>
									<td class="tit15">입학학년/학기</td>
									<td><select name="grade" class="w-120">
											<option value="1" ${param.grade=='1' ? 'selected' : ''}>1
												학년</option>
											<option value="2" ${param.grade=='2' ? 'selected' : ''}>2
												학년</option>
											<option value="3" ${param.grade=='3' ? 'selected' : ''}>3
												학년</option>
											<option value="4" ${param.grade=='4' ? 'selected' : ''}>4
												학년</option>
									</select> <select name="semester" class="w-120">
											<option value="1" ${param.semester=='1' ? 'selected' : ''}>1
												학기</option>
											<option value="2" ${param.semester=='2' ? 'selected' : ''}>2
												학기</option>
									</select></td>

									<td class="tit15">지도교수</td>
									<td><select name="pro_id" class="w-200">
											<option value="">선택</option>
											<c:forEach var="p" items="${professorList}">
												<option value="${p.pro_id}">${p.name_kor}</option>
											</c:forEach>
									</select></td>
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
</body>
</html>
