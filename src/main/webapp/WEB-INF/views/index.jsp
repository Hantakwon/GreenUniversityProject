<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기 맞아?</title>
<!--
	날짜 : 2025/09/09
    이름 : 정순권
    내용 : index 시작
-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<main>
		<div>
			<div class="main-visual-wrap">
				<div class="main-visual-box carousel-wrap">
					<div
						class="main-visual-carousel owl-carousel owl-theme owl-loaded owl-drag">
						<div class="owl-stage-outer">
							<div class="owl-stage">
								<div class="owl-item cloned">
									<div class="item">
										<div class="main-visual-img-box">
											<img alt="메인01"
												src="<%=request.getContextPath()%>/resources/images/bg-main-vi01.jpg">
										</div>
										<div class="main-visual-txt-box">
											<div>
												<p class="main-visual-txt01">IT 기술로 세상을 변화시키는 인재를 양성</p>
												<p class="main-visual-txt02">그린대학교 컴퓨터과학과</p>
												<p class="main-visual-txt03">급변하는 컴퓨터 기술의 발전에 선도적으로 참여하고
													컴퓨터의 활용을 통하여 미래를 만들어 나갈 수 있는 인력을 배양</p>
												<a href="#"><span>학과소개 바로가기</span></a>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item cloned">
									<div class="item">
										<div class="main-visual-img-box">
											<img alt="메인02"
												src="<%=request.getContextPath()%>/resources/images/bg-main-vi02.jpg">
										</div>
										<div class="main-visual-txt-box">
											<div>
												<p class="main-visual-txt01">지속가능발전을 위해 고민하고, 미래를 짊어질
													환경전문인 양성</p>
												<p class="main-visual-txt02">그린대학교 생명공학과</p>
												<p class="main-visual-txt03">
													자연과학대학은 미래 첨단과학기술사회의 학계, 연구소, 산업계 등을 주도적으로 이끌어 나갈 기초과학 인재
													양성을 교육목표로<br> 자연과학의 근간이 되는 물리, 화학, 응용수학, 미생물학, 과학컴퓨팅 및
													간호학의 기초 이론을 교수·연구하고 융합 및 응용과학의 토대를 제공
												</p>
												<a href="#"><span>학과소개 바로가기</span></a>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item cloned">
									<div class="item">
										<div class="main-visual-img-box">
											<img alt="메인03"
												src="<%=request.getContextPath()%>/resources/images/bg-main-vi03.jpg">
										</div>
										<div class="main-visual-txt-box">
											<div>
												<p class="main-visual-txt01">한국어와 한국문학, 그 세계적인 경쟁력</p>
												<p class="main-visual-txt02">그린대학교 국어국문학과</p>
												<p class="main-visual-txt03">우리 말과 우리 문학에 대한 과학적이고 체계적인
													지식을 습득하여 민족 문화 유산을 연구 이해함으로써 한국 문화를 창조적으로 계승</p>
												<a href="#"><span>학과소개 바로가기</span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="owl-nav disabled">
							<div class="owl-prev">prev</div>
							<div class="owl-next">next</div>
						</div>
						<div class="owl-dots">
							<div class="owl-dot">
								<span></span>
							</div>
							<div class="owl-dot">
								<span></span>
							</div>
							<div class="owl-dot active">
								<span></span>
							</div>
						</div>
					</div>
				</div>
				<div class="control-wrap">
					<a class="prev" href="#"><span class="hide">prev</span></a> <a
						class="next" href="#"><span class="hide">next</span></a>
				</div>
			</div>

			<div class="main-content-wrap01">
				<div class="main-content-box main-content-box01">
					<div class="main-mini-box main-mini-box01">
						<h3 class="main-title">학사안내</h3>
						<div class="mini-board-content">
							<ul>
								<li>
									<a href="#">
										<div>
											<span class="mini-title">교과목 폐지 및 신설 안내</span>
											<span class="new">new</span>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="main-mini-box main-mini-box02">
					
					</div>
				</div>
			</div>

			<div class="main-content-wrap02"></div>

			<div class="main-content-wrap03"></div>

			<div class="main-content-wrap04"></div>
		</div>
	</main>
	<jsp:include page="footer.jsp" />
</body>
</html>