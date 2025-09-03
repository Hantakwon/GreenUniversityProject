<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<!--
        날짜 : 2025/09/03
        이름 : 한탁원
        내용 : footer 작성
    -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/footer2.css">
<script src="<%=request.getContextPath()%>/resources/js/cms.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/user.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery-1.9.1.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery-1.11.4.min.js"></script>
</head>
<body>
	<footer>
		<div class="top-footer-wrap">
			<div class="top-footer-box">
				<ul class="footer-link">
					<li class="privacy" style="width: 20%;"><a href="#"
						target="_blank" title="개인정보처리방침">개인정보처리방침</a></li>
					<li style="width: 20%;"><a href="#" target="_blank"
						title="통합정보시스템">통합정보시스템</a></li>
					<li style="width: 20%;"><a href="#" target="_blank"
						title="학사일정">학사일정</a></li>
					<li style="width: 20%;"><a href="#" target="_blank"
						title="주요민원 연락처">주요민원 연락처</a></li>
					<li style="width: 20%;"><a href="#" target="_blank"
						title="교내공지사항">교내공지사항</a></li>
				</ul>
			</div>
		</div>
		<div class="bottom-footer-wrap">
			<div class="bottom-footer-box">
				<div class="related-site-wrap">
					<a class="related-site-title" href="#a" title="주요사이트 바로가기">주요사이트</a>
					<ul class="related-site">
						<li><a href="#a" title="바로가기">그린대학교</a></li>
					</ul>
				</div>
				<div class="footer-content-box">
					<span class="footer-logo-wrap"><img
						alt="그린대학교 GREEN UNIVERSITY"
						src="/resources/images/footer_logo.png"></span>
					<ul class="footer-info">
						<li>
							<ul class="footer-contact">
								<li>
									<p>그린대학교</p>
									<p>
										<span>[12345] 부산광역시 부산진구 부전대로 123 그린대학교</span> <span>대표전화
											: <a href="tel:033-248-1000" title="전화걸기">051-123-1000</a>
										</span> <span>입학안내 : <a href="tel:033-248-1302" title="전화걸기">051-123-1302</a>
											<span>팩스 : 051-123-3333</span>
										</span>
									</p>
								</li>
							</ul>
						</li>
						<li>
							<p class="copyright">copyright&nbsp;©Green University All
								rights reserved.</p>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>