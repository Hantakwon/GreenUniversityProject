<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린대학교</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/introduce/organization.css">
</head>
<!--
	날짜 : 2025/09/05
    이름 : 한탁원
    내용 : 조직도
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
					<li>조직도</li>
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

					<li><a href="/introduce/ideology.do">교육이념</a></li>
 
					<li><a href="/introduce/history.do">연혁</a></li>

					<li class="active"><a href="/introduce/organization.do" class="active">조직도</a></li>

					<li><a href="/introduce/direction.do">오시는길</a></li>
				</ul>
			</div>
		</div>
		<div class="content-wrap">

			<div class="title">
				<div class="jwxe_mnu_template jw-relative page-title">
					<h3>조직도</h3>
				</div>
			</div>
			<div class="content" id="jwxe_main_content">
				<div class="content-box">
					 <!-- 조직도 시작 -->
                    <div class="organization">
                        <!-- 총장 -->
                        <div class="president">
                            <a href="http://localhost:8080/introduce/greeting.do">총장</a>
                        	</br>
                        </div>

                        <!-- 하위 블록 -->
                        <div class="org-blocks">

                            <!-- 본부 -->
                            <div class="org-card">
                                <div class="org-header">본부</div>
                                <ul class="org-list">
                                    <li>교무처</li>
                                    <li>학생처</li>
                                    <li>기획처</li>
                                    <li>연구처</li>
                                    <li>국제처</li>
                                    <li>입학처</li>
                                    <li>사무국</li>
                                    <li>교육혁신본부</li>
                                    <li>캠퍼스기획본부</li>
                                </ul>
                            </div>

                            <!-- 대학 주소조정 필요함 -->
                            <div class="org-card">
                                <div class="org-header">대학</div>
                                <ul class="org-list">
                                    <li><a href="./인문사회대학.html">인문사회대학</a></li>
                                    <li><a href="./자연과학대학.html">자연과학대학</a></li>
                                    <li><a href="./공과대학.html">공과대학</a></li>
                                    <li><a href="./사범대학.html">사범대학</a></li>
                                </ul>
                            </div>

                            <!-- 대학원 -->
                            <div class="org-card">
                                <div class="org-header">대학원</div>
                                <ul class="org-list">
                                    <li><a href="./대학원.html">대학원</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- 조직도 끝 -->

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>