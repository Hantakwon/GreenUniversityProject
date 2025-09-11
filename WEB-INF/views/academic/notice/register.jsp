<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 
	날짜 : 2025/09/04
	이름 : 한탁원
	내용 : 학사안내 공지사항 입력 창
-->
<body>
	<jsp:include page="../../header.jsp" />

	<form action="/academic/notice/register.do" method="POST">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" placeholder="아이디 입력" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="content" placeholder="이름 입력" /></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" placeholder="이름 입력" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록하기" />
				</td>
			</tr>
		</table>
	</form>
	
	<jsp:include page="../../footer.jsp" />
</body>
</html>