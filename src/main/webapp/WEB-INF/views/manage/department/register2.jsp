<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>대학 및 학과 등록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/manage/admin.css" />
</head>
<body>
	<div id="admin-wrapper">

		<jsp:include page="../common2/header.jsp" />

		<main>
			<jsp:include page="../common2/aside.jsp" />

			<section id="admin-index" class="main-mini-box">
				<nav>
					<h3>대학 및 학과</h3>
					<p>
						대학 및 학과<strong>대학 및 학과 등록</strong>
					</p>
				</nav>

				<!-- ===================== [1] 대학 정보 입력 ===================== -->
				<form method="post"
					action="${pageContext.request.contextPath}/manage/college/register.do"
					enctype="multipart/form-data">
					<h4 class="tit-h4">대학정보 입력</h4>

					<article>
						<table class="board-table form-table compact">
							<colgroup>
								<col style="width: 160px;" />
								<col />
								<col style="width: 160px;" />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<td class="tit15">대학명</td>
									<td><input type="text" name="name_kor" class="w-300"
										placeholder="예) 인문사회대학" required /></td>
									<td class="tit15">대학 영문명</td>
									<td><input type="text" name="name_eng" class="w-300"
										placeholder="예) Humanities And Social Sciences" /></td>
								</tr>

								<tr>
									<td class="tit15">대학 소개</td>
									<td colspan="3"><input type="text" name="title"
										class="w-520" placeholder="대학 소개 제목입력" /> <textarea
											name="content" rows="6"
											style="display: block; width: 520px; margin-top: 6px;"
											placeholder="대학 소개 내용입력"></textarea>

										<div style="margin-top: 8px;">
											<input type="file" name="image" accept="image/*" /> <span
												style="color: #c44; margin-left: 8px;">대학·대학원 소개 페이지용
												첨부 이미지(320 × 240) 권장</span>
										</div></td>
								</tr>
							</tbody>
						</table>

						<button type="submit" class="btn-primary fr">등록</button>
					</article>
				</form>

				<!-- ===================== [2] 학과 정보 입력 ===================== -->
				<form method="post"
					action="${pageContext.request.contextPath}/manage/department/register.do">
					<h4 class="tit-h4">학과정보 입력</h4>

					<article>
						<table class="board-table form-table compact">
							<colgroup>
								<col style="width: 160px;" />
								<col />
								<col style="width: 160px;" />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<td class="tit15">학과번호</td>
									<td>
										<!-- 서버에서 자동생성된다면 disabled 표시용만 두고, 필요 없으면 이 input 제거 --> <input
										type="text" class="w-200" value="고유 2자리 숫자 자동생성" disabled />
									</td>
									<td class="tit15">단과대학</td>
									<td>
										<!-- 동적으로 주입 가능한 경우: colleges 리스트를 넘겨받아 사용
                  <c:forEach var="c" items="${colleges}">
                    <option value="${c.col_id}">${c.name_kor}</option>
                  </c:forEach>
                  --> <select name="col_id" class="w-200" required>
											<option value="">선택</option>
											<option value="1">인문사회대학</option>
											<option value="2">자연과학대학</option>
											<option value="3">공과대학</option>
											<option value="4">사범대학</option>
											<option value="5">대학원</option>
									</select>
									</td>
								</tr>

								<tr>
									<td class="tit15">학과명</td>
									<td><input type="text" name="name_kor" class="w-300"
										placeholder="학과명 입력" required /></td>
									<td class="tit15">영문명</td>
									<td><input type="text" name="name_eng" class="w-300"
										placeholder="학과 공식 영문명 입력" /></td>
								</tr>

								<tr>
									<td class="tit15">설립년도</td>
									<td><input type="date" name="founded_date" class="w-200" />
									</td>
									<td class="tit15">학사형태</td>
									<td>
										<!-- 스키마에 없다면 name 제거하거나 서버에서 무시 --> <select
										name="degree_type" class="w-200">
											<option value="">선택</option>
											<option>학사</option>
											<option>석사</option>
											<option>박사</option>
									</select>
									</td>
								</tr>

								<tr>
									<td class="tit15">학과 연락처</td>
									<td><input type="text" name="tel" class="w-200"
										placeholder="예) 051-123-1001"
										pattern="\\d{2,3}-\\d{3,4}-\\d{4}" /></td>
									<td class="tit15">학과 사무실</td>
									<td><input type="text" name="office" class="w-300"
										placeholder="예) 인문관 3층 306호" /></td>
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
