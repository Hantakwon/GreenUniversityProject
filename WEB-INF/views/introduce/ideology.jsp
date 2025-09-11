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
    이름 : 김수진
    내용 : 교육이념
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
					<li>교육이념</li>
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
					<li><a href="/introduce/greeting.do">총장 인사말</a></li>

					<li class="active"><a href="/introduce/ideology.do" class="active">교육이념</a></li>
 
					<li><a href="/introduce/history.do">연혁</a></li>

					<li><a href="/introduce/organization.do">조직도</a></li>

					<li><a href="/introduce/direction.do">오시는길</a></li>
				</ul>
			</div>
		</div>
		<div class="content-wrap">

			<div class="title">
				<div class="jwxe_mnu_template jw-relative page-title">
					<h3>교육이념</h3>
				</div>
			</div>
			<div class="content" id="jwxe_main_content">
				<div class="content-box">
					<img src="<%=request.getContextPath()%>/resources/images/introduce_ideology.PNG" alt="교육이념 이미지" style="max-width: 100%; height: auto;" />
					</br>
					</br>
					<h2>인재상</h2>
					</br>
					<h4>창조적 지성과 바른 인성을 겸비한 그린인</h4>
					</br>
					</br>
					<h2>교육목적</h2>
					</br>
					<h4>진리, 자유, 봉사의 정신으로 창조적 지성과 바른 인성을 겸비한 인재를 양성한다.</h4>
					</br>
					</br>
					<h2>교육목표</h2>
					</br>
					<img src="<%=request.getContextPath()%>/resources/images/introduce_goal.PNG" alt="교육이념 이미지" style="max-width: 100%; height: auto;">
					
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>