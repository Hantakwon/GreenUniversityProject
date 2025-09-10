<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린대학교</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admission/common.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admission/regular.css">
</head>
<!--
	날짜 : 2025/09/05
    이름 : 한탁원
    내용 : 정시모집
-->

<body>
	<jsp:include page="../header.jsp" />
	<div class="path-wrap">
		<div class="path-box">
			<div class="jwxe_navigator jw-relative">
				<ul>
					<li><a href="#"><img src="../resources/images/ico-home.png" alt="home" /></a></li>
					<li><a href="#">입학안내</a></li>
					<li>정시모집</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="sub-container">
		<div class="lnb-wrap">
			<div class="lnb">
				<div class="lnb-title-box">
					<div>
						<h2>입학안내</h2>
					</div>
				</div>

				<ul class="lnb-menu jwxe-menu-ul">
					<li><a href="/admission/notice.do">공지사항</a></li>

					<li><a href="/admission/rolling.do">수시모집</a></li>
 
					<li class="active"><a href="/admission/regular.do" class="active">정시모집</a></li>
					
					<li><a href="/admission/transfer.do">편입학</a></li>
				
					<li><a href="/admission/consult.do">입학상담</a></li>

				</ul>
			</div>
		</div>
		<div class="content-wrap">

			<div class="title">
				<div class="jwxe_mnu_template jw-relative page-title">
					<h3>정시모집</h3>
				</div>
			</div>
			<div class="content" id="jwxe_main_content">
				<div class="content-box">
					<!-- 정시모집 컨텐츠 시작  -->
						<div class="admission-main">
						    <div class="admission-bg">
						        <div class="admission-text">
						            <h1>미래를 움직이는 인재 그린인</h2>
						            <p>그 인재의 가치를 아는 대학, 그린대학교</p>
						        </div>
						
						        <div class="admission-box">
						            <h3>2026학년도 정시 신입생모집 원서접수 안내</h3>
						            <ul class="admission-menu">
						                <li><a href="#">원서접수</a></li>
						                <li><a href="#">접수확인</a></li>
						                <li><a href="#">서류도착확인</a></li>
						                <li><a href="#">경쟁률</a></li>
						            </ul>
						        </div>
						    </div>
						</div>
					<!-- 정시모집 컨텐츠 끝  -->
				
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>