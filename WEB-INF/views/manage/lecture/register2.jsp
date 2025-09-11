<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 등록</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/manage/admin.css">
</head>
<body>
	<div id="admin-wrapper">
		<jsp:include page="../common2/header.jsp" />

		<main>
			<!-- 공통 Aside -->
			<jsp:include page="../common2/aside.jsp" />

			<section id="admin-index" class="main-mini-box">
				<!-- 페이지 타이틀 -->
				<nav class="page-toolbar">
					<h3>강의 등록</h3>
					<p>
						학사운영&nbsp;>&nbsp;<strong>강의 등록</strong>
					</p>
				</nav>

				<form method="post"
					action="${pageContext.request.contextPath}/manage/lecture/register.do">
					<!-- 기본정보 입력 -->
					<h4 class="tit-h4" style="position: relative;">기본정보 입력</h4>
					<article>
						<table class="board-table form-table compact">
							<colgroup>
								<col style="width: 160px;">
								<col>
								<col style="width: 160px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<td class="tit">과목코드</td>
									<td>
										<span class="desc">학과코드 + 연도 + 학기 + 순번 조합</span>
									</td>
									<td class="tit">개설학과</td>
									<td><select name="dept_id" class="w-240" required>
											<option value="">학과 선택</option>
											<c:forEach var="d" items="${departmentList}">
												<option value="${d.dept_id}">${d.name_kor}</option>
											</c:forEach>
									</select></td>
								</tr>

								<tr>
									<td class="tit">개설학년</td>
									<td>
										<!-- DTO는 String 타입 → value도 문자열 --> <select name="grade"
										class="w-160">
											<option value="">선택</option>
											<option value="1">1 학년</option>
											<option value="2">2 학년</option>
											<option value="3">3 학년</option>
											<option value="4">4 학년</option>
									</select> <select name="semester" class="w-120">
											<option value="1" ${param.semester=='1' ? 'selected' : ''}>1
												학기</option>
											<option value="2" ${param.semester=='2' ? 'selected' : ''}>2
												학기</option>
									</select>
									</td>
									<td class="tit">학점</td>
									<td><select name="credit" class="w-160">
											<option value="">선택</option>
											<option value="1">1 학점</option>
											<option value="2">2 학점</option>
											<option value="3">3 학점</option>
									</select>
									</td>
								</tr>

								<tr>
									<td class="tit">이수구분</td>
									<td><select name="category" class="w-200">
											<option value="">선택</option>
											<option value="전공 선택">전공 선택</option>
											<option value="전공 필수">전공 필수</option>
											<option value="교양 선택">교양 선택</option>
											<option value="교양 필수">교양 필수</option>
									</select></td>
									<td class="tit">담당교수</td>
									<td><select name="pro_id" class="w-240" required>
											<option value="">선택</option>
											<c:forEach var="p" items="${professorList}">
												<option value="${p.pro_id}">${p.name_kor}</option>
											</c:forEach>
									</select></td>
								</tr>

								<tr>
									<td class="tit">강의명</td>
									<td colspan="3"><input type="text" name="lec_name"
										class="w-520" placeholder="강좌명 입력" required></td>
								</tr>

								<tr>
									<td class="tit">강의 설명</td>
									<td colspan="3"><textarea name="description" rows="6"
											style="width: 50%; background-color: #fff; text-align: left; resize: vertical;"
											placeholder="강의 개요 및 목표, 학습 내용 등"></textarea></td>
								</tr>
							</tbody>
						</table>
					</article>

					<!-- 수업정보 입력 -->
					<h4 class="tit-h4" style="position: relative;">수업정보 입력</h4>
					<article>
						<table class="board-table form-table compact">
							<colgroup>
								<col style="width: 160px;">
								<col>
								<col style="width: 160px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<td class="tit">수업 기간</td>
									<td colspan="3">
										<!-- DTO: java.sql.Date ← input type="date" OK --> <input
										type="date" name="start_date" class="w-180">
										&nbsp;~&nbsp; <input type="date" name="end_date" class="w-180">
									</td>
								</tr>

								<tr>
									<td class="tit">수업 시간</td>
									<td colspan="3">
										<!-- DTO: LocalTime ← input type="time" OK --> <input
										type="time" name="start_time" class="w-150">
										&nbsp;~&nbsp; <input type="time" name="end_time" class="w-150">
										<div
											style="margin-left: 10px; display: inline-block; vertical-align: bottom;">
											<label class="day"><input type="checkbox"
												class="day-check" value="MON">월</label> <label class="day"><input
												type="checkbox" class="day-check" value="TUE">화</label> <label
												class="day"><input type="checkbox" class="day-check"
												value="WED">수</label> <label class="day"><input
												type="checkbox" class="day-check" value="THU">목</label> <label
												class="day"><input type="checkbox" class="day-check"
												value="FRI">금</label>
										</div> <!-- 서버에는 DTO의 String 필드(day_of_week)로 콤마 결합 전송 --> <input
										type="hidden" name="day_of_week" id="day_of_week_hidden">
									</td>
								</tr>

								<tr>
									<td class="tit">평가방식</td>
									<td colspan="3"><input type="text" name="evaluation"
										class="w-520" placeholder="출석 10%, 과제 30%, 시험 60%"></td>
								</tr>

								<tr>
									<td class="tit">교재</td>
									<td colspan="3"><input type="text" name="textbook"
										class="w-520" placeholder="출판사 - 도서명 - 저자 입력"></td>
								</tr>

								<tr>
									<td class="tit">강의실</td>
									<td><input type="text" name="classroom" class="w-240"
										placeholder="인문관 301호"></td>
									<td class="tit">최대 수강인원</td>
									<td>
										<!-- DTO: int → number OK --> <input type="number"
										name="max_enrollment" class="w-160" min="1" max="999">
									</td>
								</tr>
							</tbody>
						</table>

						<button type="submit" class="btn-primary fr">등록</button>
					</article>
				</form>

				<!-- 요일 hidden 조립 스크립트 -->
				<script>
            (function () {
                const form = document.currentScript.closest('section').querySelector('form');
                const hidden = form.querySelector('#day_of_week_hidden');
                form.addEventListener('submit', function () {
                    const codes = Array.from(form.querySelectorAll('.day-check:checked')).map(chk => chk.value);
                    hidden.value = codes.join(','); // 예: "MON,WED,FRI"
                });
            })();
        </script>
			</section>
		</main>

		<jsp:include page="../common2/footer.jsp" />
	</div>
</body>
</html>
