<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운영현황 메인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/manage/admin.css">
</head>
<body>
	<div id="admin-wrapper">

		<jsp:include page="./common2/header.jsp" />

		<main>
			<jsp:include page="./common2/aside.jsp" />

			<section id="admin-index" class="main-mini-box">
				<!-- 상단 타이틀 -->
				<nav>
					<h3>운영현황 메인</h3>
					<p>
						HOME <strong>운영현황 메인</strong>
					</p>
				</nav>

				<!-- 대학 운영 현황 -->
				<h4 class="tit-h4" style="position: relative;">대학 운영 현황</h4>
				<article>
					<div class="bn-list-common01 type01 bn-common bn-common">
						<table class="board-table">
							<thead>
								<tr>
									<th scope="col">개설학과</th>
									<th scope="col">개설강좌</th>
									<th scope="col">전체교수</th>
									<th scope="col">임직원</th>
									<th scope="col">학생</th>
									<th scope="col">휴학생</th>
									<th scope="col">대학원생</th>
									<th scope="col">졸업생</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty indexOperateDto}">
										<tr>
											<td colspan="9" style="text-align: center;">조회된 자료가
												없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td>${indexOperateDto.dept_cnt}</td>
											<td>${indexOperateDto.lec_cnt}</td>
											<td>${indexOperateDto.pro_cnt}</td>
											<td>${indexOperateDto.emp_cnt}</td>
											<td>${indexOperateDto.std_cnt}</td>
											<td>${indexOperateDto.leave_cnt}</td>
											<td>${indexOperateDto.grad_cnt}</td>
											<td>${indexOperateDto.gradutes}</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</article>

				<!-- 교육 운영 현황 -->
				<h4 class="tit-h4" style="position: relative; margin-top: 20px;">
					교육 운영 현황 <a href="/manage/operate/list2.do" class="viewmore"
						style="right: 0;">더보기</a>
				</h4>
				<article>
					<div class="bn-list-common01 type01 bn-common bn-common">
						<table class="board-table">
							<thead>
								<tr>
									<th scope="col" style="width: 12%;">학과</th>
									<th scope="col">과목코드</th>
									<th scope="col" style="width: 12%;">과목명</th>
									<th scope="col">학년</th>
									<th scope="col">담당교수</th>
									<th scope="col">구분</th>
									<th scope="col">학점</th>
									<th scope="col">강의장</th>
									<th scope="col">수강인원</th>
									<th scope="col">수강률</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty operateList}">
										<tr>
											<td colspan="9" style="text-align: center;">조회된 자료가
												없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="operate" items="${operateList}">
											<tr>
												<td>${operate.dept_name}</td>
												<td>${operate.lecture_no}</td>
												<td>${operate.lecture_name}</td>
												<td>${operate.grade}</td>
												<td>${operate.professor_name}</td>
												<td>${operate.category}</td>
												<td>${operate.credit}</td>
												<td>${operate.classroom}</td>
												<td>${operate.enrollment_text}</td>
												<td>${operate.enrollment_rate}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</article>

				<div>
					<!-- 학년별 학생 현황 -->
					<div>
						<h4 class="tit-h4" style="position: relative; margin-top: 20px;">학년별
							학생 현황</h4>
						<article>
							<div class="bn-list-common01 type01 bn-common bn-common">
								<table class="board-table">
									<thead>
										<tr>
											<th scope="col">학년</th>
											<th scope="col">재학생</th>
											<th scope="col">휴학생</th>
											<th scope="col">전체</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty gradeSummaryList}">
												<tr>
													<td colspan="4" style="text-align: center;">조회된 자료가
														없습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:set var="gEnrolled" value="0" />
												<c:set var="gLeave" value="0" />
												<c:set var="gTotal" value="0" />

												<c:forEach var="row" items="${gradeSummaryList}">
													<c:choose>
														<%-- DB가 내려준 총합 행이면 값만 저장(출력 X) --%>
														<c:when test="${row.grade eq '총합'}">
															<c:set var="gEnrolled" value="${row.sumEnrolledCnt}" />
															<c:set var="gLeave" value="${row.sumLeaveCnt}" />
															<c:set var="gTotal" value="${row.sumTotalCnt}" />
														</c:when>
														<c:otherwise>
															<tr>
																<td>${row.grade}</td>
																<td>${row.sumEnrolledCnt}</td>
																<td>${row.sumLeaveCnt}</td>
																<td>${row.sumTotalCnt}</td>
															</tr>
															<%-- 총합 행이 없을 경우 대비해서 누적 --%>
															<c:set var="gEnrolled"
																value="${gEnrolled + row.sumEnrolledCnt}" />
															<c:set var="gLeave" value="${gLeave + row.sumLeaveCnt}" />
															<c:set var="gTotal" value="${gTotal + row.sumTotalCnt}" />
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
									<tfoot>
										<tr>
											<th scope="col">총합</th>
											<th scope="col">${gEnrolled}</th>
											<th scope="col">${gLeave}</th>
											<th scope="col">${gTotal}</th>
										</tr>
									</tfoot>
								</table>

							</div>
						</article>
					</div>

					<!-- 학과별 학생 현황 -->
					<div>
						<h4 class="tit-h4" style="position: relative; margin-top: 20px;">
							학과별 학생 현황</h4>
						<article>
							<div class="bn-list-common01 type01 bn-common bn-common">
								<table class="board-table">
									<thead>
										<tr>
											<th scope="col">학과</th>
											<th scope="col">재학생</th>
											<th scope="col">휴학생</th>
											<th scope="col">전체</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty deptSummaryList}">
												<tr>
													<td colspan="4" style="text-align: center;">조회된 자료가
														없습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:set var="dEnrolled" value="0" />
												<c:set var="dLeave" value="0" />
												<c:set var="dTotal" value="0" />

												<c:forEach var="row" items="${deptSummaryList}">
													<c:choose>
														<c:when test="${row.dept_name eq '총합'}">
															<c:set var="dEnrolled" value="${row.sumEnrolledCnt}" />
															<c:set var="dLeave" value="${row.sumLeaveCnt}" />
															<c:set var="dTotal" value="${row.sumTotalCnt}" />
														</c:when>
														<c:otherwise>
															<tr>
																<td>${row.dept_name}</td>
																<td>${row.sumEnrolledCnt}</td>
																<td>${row.sumLeaveCnt}</td>
																<td>${row.sumTotalCnt}</td>
															</tr>
															<c:set var="dEnrolled"
																value="${dEnrolled + row.sumEnrolledCnt}" />
															<c:set var="dLeave" value="${dLeave + row.sumLeaveCnt}" />
															<c:set var="dTotal" value="${dTotal + row.sumTotalCnt}" />
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
									<tfoot>
										<tr>
											<th scope="col">총합</th>
											<th scope="col">${dEnrolled}</th>
											<th scope="col">${dLeave}</th>
											<th scope="col">${dTotal}</th>
										</tr>
									</tfoot>
								</table>

							</div>
						</article>
					</div>
				</div>

				<!-- 공지/상담 -->
				<div>
					<div>
						<h4 class="tit-h4" style="position: relative; margin-top: 20px;">
							학사안내 공지사항 <a href="#a" class="viewmore" style="right: 0;">더보기</a>
						</h4>
						<article>
							<div class="bn-list-common01 type01 bn-common bn-common">
								<table class="board-table">
									<thead>
										<tr>
											<th scope="col" style="width: 10%;">번호</th>
											<th scope="col" style="width: 40%;">제목</th>
											<th scope="col">작성자</th>
											<th scope="col">작성일</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty academic_NoticeList}">
												<tr>
													<td colspan="4" style="text-align: center;">조회된 자료가
														없습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="notice" items="${academic_NoticeList}">
													<tr>
														<td>${notice.id}</td>
														<td>${notice.title}</td>
														<td>${notice.writer}</td>
														<td>${notice.created_at}</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</article>
					</div>

					<div>
						<h4 class="tit-h4" style="position: relative; margin-top: 20px;">
							입학상담 <a href="#a" class="viewmore" style="right: 0;">더보기</a>
						</h4>
						<article>
							<div class="bn-list-common01 type01 bn-common bn-common">
								<table class="board-table">
									<thead>
										<tr>
											<th scope="col" style="width: 10%;">번호</th>
											<th scope="col" style="width: 40%;">제목</th>
											<th scope="col">작성일</th>
											<th scope="col">상태</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty admission_consultList}">
												<tr>
													<td colspan="4" style="text-align: center;">조회된 자료가
														없습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="admission" items="${admission_consultList}">
													<tr>
														<td>${admission.id}</td>
														<td class="ellipsis">${admission.title}</td>
														<td><c:choose>
																<c:when test="${not empty admission.created_at}">
																	<fmt:formatDate value="${admission.created_at}"
																		pattern="yy.MM.dd" />
																</c:when>
																<c:otherwise>-</c:otherwise>
															</c:choose></td>
														<td><c:choose>
																<c:when test="${admission.is_answered}">
																	<span class="answer-ok">답변완료</span>
																</c:when>
																<c:otherwise>
																	<span class="answer-not">답변대기</span>
																</c:otherwise>
															</c:choose></td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</article>
					</div>
				</div>
			</section>
		</main>


		<jsp:include page="/WEB-INF/views/manage/common2/footer.jsp" /></div>
</body>
</html>
