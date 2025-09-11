<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린대학교 동아리/스터디</title>
</head>
<!-- 
	날짜 : 2025/09/11 
	이름 : 박효빈
	내용 : 동아리/스터디 / 정적페이지로 임의 내용 추가 
-->
<!--
    날짜 : 2025/09/11
    이름 : 정순권
    내용 : clud 수정
-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/academic/hyokongmain.css">

<body>
	<jsp:include page="../header.jsp" />
	<main>
		<div>
			<div class="info">
				<span id="test"> <img src="/resources/images/ico-home.png"
					alt="홈 버튼"> &gt; 대학생활 &gt; 동아리/스터디
				</span>
			</div>
		</div>
		<div>
			<div class="content-wrapper">
				<div class="sidebar">
					<div class="top">
						<h1>대학생활</h1>
					</div>
					<div class="bottom">
						<ul>
							<li><a href="/collegelife/studentunion.do">학생회 소개</a></li>
							<li class="active"><a href="/collegelife/clud.do">동아리/스터디</a></li>
							<li><a href="/collegelife/meal.do">식단안내</a></li>
							<li><a href="/collegelife/gallery.do">갤러리</a></li>

						</ul>
					</div>
				</div>
				<div class="main-content">
					<div class="top">
						<h2>동아리/스터디</h2>
					</div>
					
					<!-- 동아리 활동 안내 시작 -->
					<div class="bold-ment">
						<img src="/resources/images/bullet-h4.png" alt="bullet-h4 이미지">
						<h4 class="span-bold">동아리 활동 안내</h4>
						<div class="ment1">
							<span class="bold-span-highlight">- 동아리 참여 혜택</span><br>
							1) 학업 스트레스 해소 및 재충전의 기회 제공<br>
							2) 취미와 특기를 개발하고 심화할 수 있는 환경 제공<br>
							3) 다양한 전공의 학생들과 교류하며 인적 네트워크 확장<br>
							4) 협업 능력, 리더십 등 실질적인 역량 강화<br>
							5) 졸업 후에도 소중한 추억과 경험으로 남음<br><br>
							
							<span class="bold-span-highlight">- 동아리 유형 및 분야</span><br>
							1) 학술 동아리: 전공 지식 심화 및 실력 향상을 위한 다양한 학술 모임<br>
							   - 예시: 프로그래밍 '코딩마스터', 고양이학술 '고양시에사는고양이', 인문학 독서회 '지혜의 숲'<br>
							2) 문화예술 동아리: 창의적 표현과 감성 교류를 위한 동아리<br>
							   - 예시: 밴드 '그린노트', 연극 '무대예술', 사진 '찰나의 미학', 영화 '씨네필'<br>
							3) 체육 동아리: 건강한 몸과 협동심을 기르는 스포츠 동아리<br>
							   - 예시: 축구 '그린킥스', 농구 '덩크슛', 배드민턴 '셔틀러', 등산 '그린마운틴'<br>
							4) 봉사 동아리: 사회에 기여하고 따뜻한 마음을 나누는 동아리<<br>
							   - 예시: 환경보호 '에코그린', 교육봉사 '배움나눔', 고양이보호 '고양이쓰담쓰담'<br>
							5) 어학 동아리: 글로벌 역량 강화를 위한 외국어 학습 및 문화 교류<br>
							   - 예시: 영어회화 '스피크업', 고양이회화 '먀-아옹', 일본어 '니혼고'<br><br>
							
							<span class="bold-span-highlight">- 동아리 가입 방법</span><br>
							1) 고양이 박람회: 매 학기 초 교내에서 진행되는 고양이 박람회에서 각 고양이 부스를 방문하여 정보 확인 및 현장 가입<br>
							2) 개별 문의: 관심 있는 동아리 대표 또는 총학생회, 동아리 연합회에 직접 문의<br>
							3) 온라인 홍보: 각 동아리의 SNS, 학교 커뮤니티 등을 통해 상시 가입 문의
						</div>
					</div>
					<!-- 동아리 활동 안내 끝 -->

					<br> 

					<!-- 스터디 그룹 지원 시작 -->
					<div class="bold-ment">
						<img src="/resources/images/bullet-h4.png" alt="bullet-h4 이미지">
						<h4 class="span-bold">스터디 그룹 지원</h4>
						<div class="ment1">
							<span class="bold-span-highlight">- 스터디 그룹의 중요성</span><br>
							1) 학업 성과 향상: 동료들과의 질의응답 및 토론을 통해 학습 내용 심화<br>
							2) 문제 해결 능력 증진: 다양한 관점에서 문제에 접근하고 해결책 모색<br>
							3) 자기 주도 학습: 스스로 학습 계획을 수립하고 실천하는 능력 강화<br>
							4) 협력 및 소통 능력: 팀 기반 학습을 통해 협동심과 의사소통 능력 발달<br><br>
							
							<span class="bold-span-highlight">- 스터디 그룹 지원 내용</span><br>
							1) 스터디 룸 제공: 강의동 및 도서관 내 전용 스터디 룸 우선 사용 권한 부여<br>
							2) 학습 자료 지원: 교재, 참고 서적, 온라인 강의 콘텐츠 등 학습에 필요한 자료 지원<br>
							3) 전문 튜터링 연계: 필요시 해당 분야 교수 또는 선배 튜터와 연계하여 심층 학습 지원<br>
							4) 활동 장려금 지급: 우수 활동 스터디 그룹 선발 및 소정의 활동 장려금 지원<br><br>
							
							<span class="bold-span-highlight">- 스터디 그룹 신청 절차</span><br>
							1) 스터디원 모집: 최소 3인 이상으로 그룹 구성 및 스터디 목표 설정<br>
							2) 신청서 제출: 학교 학습지원센터 홈페이지를 통해 스터디 계획서 제출<br>
							3) 심사 및 승인: 제출된 계획서 검토 후 지원 여부 결정 및 결과 통보<br>
							4) 활동 보고: 정기적인 활동 보고서 제출 및 성과 공유회 참여
						</div>
					</div>
					<!-- 스터디 그룹 지원 끝 -->

					<br> 

					<!-- 신규 동아리/스터디 개설 안내 시작 -->
					<div class="bold-ment">
						<img src="/resources/images/bullet-h4.png" alt="bullet-h4 이미지">
						<h4 class="span-bold">신규 동아리/스터디 개설 안내</h4>
						<div class="ment1">
							<span class="bold-span-highlight">- 신규 동아리 등록 절차</span><br>
							1) 회원 모집: 정식 등록을 위해 최소 10인 이상의 재학생 회원 확보 (일부 동아리는 규정에 따라 상이)<br>
							2) 지도교수 지정: 동아리 활동을 지도할 교수님 섭외 및 승인<br>
							3) 서류 제출: 학생처 또는 동아리 연합회에 활동 계획서, 회원 명부 등 필요 서류 제출<br>
							4) 심사 및 인준: 제출된 서류 및 면접 심사를 거쳐 고양이 학회장 최종 인준<br>
							5) 혜택: 공식 동아리 인준 시 학교 시설 사용 우선권, 활동 지원금, 학교 행사 참여 기회 등 제공<br><br>
							
							<span class="bold-span-highlight">- 스터디 그룹 개설 안내</span><br>
							1) 그룹 구성: 특정 학습 목표를 가진 최소 3인 이상의 재학생으로 구성<br>
							2) 온라인 등록: 학습지원센터 홈페이지를 통해 간편하게 스터디 그룹 정보 등록<br>
							3) 지원 혜택: 등록된 스터디 그룹은 스터디 룸 우선 예약, 학습 자료 제공 등의 지원을 받을 수 있습니다.
						</div>
					</div>
					<!-- 신규 동아리/스터디 개설 안내 끝 -->

				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../footer.jsp" />
</body>
</html>