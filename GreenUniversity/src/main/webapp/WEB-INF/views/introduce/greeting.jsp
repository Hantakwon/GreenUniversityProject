<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린대학교</title>
</head>
<!--
	날짜 : 2025/09/05
    이름 : 한탁원
    내용 : 총장 인사말
-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/introduce/common.css">
<body>
	<jsp:include page="../header.jsp" />
	<div class="path-wrap">
		<div class="path-box">
			<div class="jwxe_navigator jw-relative">
				<ul>
					<li><a href="#"><img src="../resources/images/ico-home.png" alt="home" /></a></li>
					<li><a href="#">대학소개</a></li>
					<li>총장 인사말</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="sub-container">
		<div class="lnb-wrap">
			<div class="lnb">
				<div class="lnb-title-box">
					<div>
						<h2>대학소개</h2>
					</div>
				</div>

				<ul class="lnb-menu jwxe-menu-ul">
					<li class="active"><a href="/introduce/greeting.do"	class="active">총장 인사말</a></li>

					<li><a href="/introduce/ideology.do">교육이념</a></li>
 
					<li><a href="/introduce/history.do">연혁</a></li>

					<li><a href="/introduce/organization.do">조직도</a></li>

					<li><a href="/introduce/direction.do">오시는길</a></li>
				</ul>
			</div>
		</div>
		<div class="content-wrap">

			<div class="title">
				<div class="jwxe_mnu_template jw-relative page-title">
					<h3>총장 인사말</h3>
				</div>
			</div>
			<div class="content" id="jwxe_main_content">
				<div class="content-box">
				<h4>2026</h4>
				</br>
					<h2>민족의 천년을 책임지는 대학, 그린대학교 80주년</h2>
					</br>
					<p> 1946년 5월 15일 그날, 윤그린 초대 총장은
						'우리 민족의 천년을 책임질 대학'이라는 사명으로 그린대학교의 역사를 열었습니다.
						내년 2026년 뜻깊은 설립 80주년을 맞게 되었습니다.
						우리 대학이 다시 한번 80년 역사와 전통을 뛰어넘어 새로운 100년의 힘찬 도약과 발전을 이룰 수 있도록
						많은 관심과 성원을 보내주시길 바랍니다. 감사합니다.
						</br>2025. 9.
						</br>
						</br>
						<img src="<%=request.getContextPath()%>/resources/images/introduce_dean.jpg" alt="총장 이미지" style="max-width: 100%; height: auto;" />
						Photo by Jason Smith
					</p>
					</br>
					</br>
					<b>그린대학교 총장 김그린</b>
					
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>