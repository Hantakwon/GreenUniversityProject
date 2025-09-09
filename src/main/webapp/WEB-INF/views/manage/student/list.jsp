<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록</title>
</head>
<!-- 
	날짜 :
	이름 : 김수진
	내용 : 
-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/manage/style.css">
<script
	src="<%=request.getContextPath()%>/resources/js/manage/script.js"></script>
<body>
	<jsp:include page="../common/manage_header.jsp" />
	<jsp:include page="../common/manage_sidebar.jsp" />

	<div class="mainWrap">
		<div class="page">
			<div class="page-head">
				<div class="title">학생 목록</div>
				<div class="breadcrumb">
					인사관리 &gt; <a href="studentList.do">학생 목록</a>
				</div>
			</div>

			<div class="searchbar">
				<select><option>검색조건</option></select> <input type="text"
					placeholder="키워드 입력">
				<button class="btn">검색</button>
			</div>

			<section class="panel">
				<div class="panel-body">
					<table class="table">
						<thead>
							<tr>
								<th>학번</th>
								<th>이름</th>
								<th>주민번호</th>
								<th>휴대폰</th>
								<th>이메일</th>
								<th>학과</th>
								<th>학년</th>
								<th>학기</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>202001230</td>
								<td>홍길동</td>
								<td>900103-1234567</td>
								<td>010-1234-1001</td>
								<td class="tl">hong1001@naver.com</td>
								<td>컴퓨터공학과</td>
								<td>3</td>
								<td>1</td>
								<td class="status ok">재학중</td>
							</tr>
							<tr>
								<td>202001231</td>
								<td>홍길동</td>
								<td>900103-1234567</td>
								<td>010-1234-1001</td>
								<td class="tl">hong1001@naver.com</td>
								<td>컴퓨터공학과</td>
								<td>3</td>
								<td>1</td>
								<td class="status ok">재학중</td>
							</tr>
							<tr>
								<td>202001232</td>
								<td>홍길동</td>
								<td>900103-1234567</td>
								<td>010-1234-1001</td>
								<td class="tl">hong1001@naver.com</td>
								<td>컴퓨터공학과</td>
								<td>3</td>
								<td>1</td>
								<td class="status bad">제적</td>
							</tr>
							<tr>
								<td>202001233</td>
								<td>홍길동</td>
								<td>900103-1234567</td>
								<td>010-1234-1001</td>
								<td class="tl">hong1001@naver.com</td>
								<td>컴퓨터공학과</td>
								<td>3</td>
								<td>1</td>
								<td class="status wait">휴학중</td>
							</tr>
						</tbody>
					</table>
				</div>
			</section>

			<div class="page-foot">
				<div class="paging">
					<button class="pg">&laquo;</button>
					<button class="pg active">1</button>
					<button class="pg">2</button>
					<button class="pg">3</button>
					<button class="pg">&raquo;</button>
				</div>
				<button class="btn btn-block"
					onclick="location.href='studentRegister.do'">등록</button>
			</div>
		</div>
	</div>

	<jsp:include page="../common/manage_footer.jsp" />
</body>
</html>