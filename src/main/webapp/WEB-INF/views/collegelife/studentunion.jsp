<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린대학교</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/academic/hyokongmain.css">
<style>


/* 전체적인 텍스트 가독성 향상 */
.ment1 {
    font-size: 15px; /* 기본 텍스트 크기 약간 키움 */
    line-height: 1.7; /* 줄 간격 넓혀서 가독성 높임 */
    color: #444; /* 텍스트 색상 진하게 하여 대비 강화 */
}

/* 소제목 강조 (bold-span-highlight) */
.ment1 .bold-span-highlight {
    font-weight: 700; /* 더 강하게 강조 */
    color: #0056b3; /* 눈에 띄는 파란색 계열로 변경 (대학색상 고려) */
    display: inline-block; /* 아래쪽 padding 적용을 위해 필요 */
    padding-bottom: 5px; /* 소제목 아래 여백 추가 */
    margin-bottom: 8px; /* 소제목과 내용 시작 사이 간격 */
    border-bottom: 1px solid #cce5ff; /* 가벼운 밑줄로 구분 */
}

/* h4 (각 섹션 제목) 스타일 강화 - 밑줄 제거 */
h4.span-bold {
    font-size: 22px; /* 섹션 제목 크기 키움 */
    font-weight: 700; /* 더 강하게 강조 */
    color: #2c3e50; /* 어두운 색상으로 대비 강화 */
    margin-top: 30px; /* 위쪽 여백 */
    margin-bottom: 20px; /* 아래쪽 여백 충분히 확보 */
    padding-bottom: 10px; /* 제목 아래 패딩 */
    /* border-bottom: 2px solid #aebcbe; /* 이 줄을 삭제하여 밑줄 제거 */ */
}

/* ------------------------------------- */
/* 학생회 조직도 테이블 스타일 개선 */
/* ------------------------------------- */
.div-table {
    margin-top: 30px; /* 테이블 위 여백 */
    margin-bottom: 30px; /* 테이블 아래 여백 */
    overflow-x: auto; /* 테이블이 너무 넓을 경우 스크롤 허용 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.08); /* 은은한 그림자 추가 */
    border-radius: 8px; /* 모서리 둥글게 */
    overflow: hidden; /* 그림자 및 둥근 모서리 표현을 위해 */
}

.org-table {
    width: 100%;
    border-collapse: collapse; /* 셀 경계선을 단일 선으로 병합 */
    font-size: 15px; /* 테이블 텍스트 크기 통일 */
    line-height: 1.6; /* 테이블 내용 줄 간격 넓힘 */
    color: #333; /* 테이블 텍스트 색상 진하게 */
    table-layout: fixed; /* 컬럼 너비 설정을 정확하게 하기 위해 추가 */
}

/* 부서명 컬럼 (첫 번째 컬럼) 너비 조정 */
.org-table th:first-child,
.org-table td:first-child {
    width: 10%; /* 너비를 25%로 설정 (필요에 따라 더 늘릴 수 있음) */
    
}


.org-table th, .org-table td {
    padding: 15px 20px; /* 셀 패딩 증가로 여백 확보 */
    text-align: center;
    border: 1px solid #e0e0e0; /* 셀 테두리 선명하게 */
}

.org-table thead th {
    background-color: #0d47a1; /* 헤더 배경색을 진한 파란색 계열로 변경 */
    color: #ffffff; /* 헤더 텍스트를 흰색으로 */
    font-weight: 600; /* 헤더 폰트 두께 */
    font-size: 16px; /* 헤더 폰트 크기 */
    white-space: nowrap; /* 헤더 텍스트 줄바꿈 방지 */
}

.org-table tbody tr:nth-child(even) {
    background-color: #f8fafd; /* 짝수 행 배경색을 밝은 하늘색으로 변경 */
}

.org-table tbody tr:hover {
    background-color: #e3f2fd; /* 마우스 오버 시 배경색 더 밝게 */
    cursor: default; /* 테이블 행은 보통 클릭 가능하지 않으므로 커서 변경 */
}

/* 첫 번째 컬럼 (부서명) 강조 */
.org-table tbody td:first-child {
    font-weight: 600; /* 부서명만 강조 */
    color: #1a2a44; /* 부서명 색상 진하게 */
}
</style>
</head>
<!-- 
	날짜 : 2025/09/11 
	이름 : 박효빈
	내용 : 학생회 소개 정적 페이지 구성 
-->
<!--
    날짜 : 2025/09/11
    이름 : 정순권
    내용 : 학생회 소개 페이지 내용 추가 및 구조 적용
-->
<body>
	<jsp:include page="../header.jsp" />
	<main>
		<div>
			<div class="info">
				<span id="test"> <img src="/resources/images/ico-home.png"
					alt="홈 버튼"> &gt; 대학생활 &gt; 학생회 소개
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
							<li class="active"><a href="/collegelife/studentunion.do">학생회 소개</a></li>
							<li><a href="/collegelife/clud.do">동아리/스터디</a></li>
							<li><a href="/collegelife/meal.do">식단안내</a></li>
							<li><a href="/collegelife/gallery.do">갤러리</a></li>

						</ul>
					</div>
				</div>
				<div class="main-content">
					<div class="top">
						<h2>학생회 소개</h2>
					</div>
					
					<!-- 회장단 인사말 시작 -->
					<div class="bold-ment">
						<img src="/resources/images/bullet-h4.png" alt="bullet-h4 이미지">
						<h4 class="span-bold">회장단 인사말</h4>
						<div class="ment1">
							<span class="bold-span-highlight">- 학생 여러분께</span><br>
							안녕하세요, 존경하는 그린대학교 학우 여러분! 제78대 학생회 '그린'입니다. 따스한 봄날의 설렘과 뜨거운 여름날의 열정을 품고, 여러분의 기대에 부응하는 학생회가 되기 위해 저희 회장단과 모든 국원들이 한마음 한뜻으로 노력하고 있습니다.<br><br>
							
							<span class="bold-span-highlight">- 학생회의 다짐</span><br>
							저희 학생회 '그린'은 '학생이 즐거운 대학, 학생이 행복한 캠퍼스'를 슬로건으로 삼아, 여러분의 의견에 귀 기울이고 불편을 해소하며, 학내 복지 증진을 위해 끊임없이 소통하고 발로 뛰겠습니다. 항상 학생들의 편에 서서, 여러분의 권익을 대변하고 활기찬 대학 생활을 만들어 나가는 데 최선을 다할 것을 약속드립니다. 많은 관심과 참여 부탁드립니다. 감사합니다!<br><br>
							<br>
							그린대학교 제78대 학생회 '그린' 회장 올림
						</div>
					</div>
					<!-- 회장단 인사말 끝 -->

					<br> 

					<!-- 학생회 소개 및 비전 시작 -->
					<div class="bold-ment">
						<img src="/resources/images/bullet-h4.png" alt="bullet-h4 이미지">
						<h4 class="span-bold">학생회 소개 및 비전</h4>
						<div class="ment1">
							<span class="bold-span-highlight">- 학생회 목표</span><br>
							그린대학교 학생회는 모든 학우의 행복과 권익을 최우선으로 생각합니다. 학교와 학생 사이의 긍정적인 가교 역할을 수행하며, 더 나은 학사 환경과 활기찬 캠퍼스 문화를 조성하는 것을 목표로 합니다.<br><br>
							
							<span class="bold-span-highlight">- 주요 역할</span><br>
							1) 학우들의 복지 증진 및 불편 사항 해소<br>
							2) 학내 정책 수립 및 개선 과정에 학생 의견 반영<br>
							3) 다양한 문화 행사 및 축제 기획/운영<br>
							4) 학생자치 활동 지원 및 역량 강화<br>
							5) 대내외적으로 학교의 위상을 높이는 활동 참여<br><br>
							
							<span class="bold-span-highlight">- 비전</span><br>
							'소통과 공감으로 하나 되는 그린! 변화를 주도하는 학생회!'를 비전으로 삼아, 학생들이 주인의식을 가지고 능동적으로 참여하는 민주적이고 투명한 학생 자치 문화를 선도합니다.
						</div>
					</div>
					<!-- 학생회 소개 및 비전 끝 -->

					<br> 

					<!-- 학생회 조직도 및 주요 부서 (표로 구현) 시작 -->
					<div class="bold-ment">
						<img src="/resources/images/bullet-h4.png" alt="bullet-h4 이미지">
						<h4 class="span-bold">학생회 조직도 및 주요 부서</h4>
						<div class="ment1">
							<span class="bold-span-highlight">- 학생회 조직표</span>
							<div class="div-table">
								<table class="org-table">
									<thead>
										<tr>
											<th>부서명</th>
											<th>주요 역할</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>회장단</td>
											<td>학생회를 총괄하고 대표하며, 대내외 모든 활동의 중심축이 됩니다. 학생들의 의견을 수렴하고, 학교 당국과 소통하며 학사 운영에 학생들의 목소리를 반영하는 데 앞장섭니다.</td>
										</tr>
										<tr>
											<td>사무국</td>
											<td>학생회의 재정 및 행정 업무를 담당합니다. 예산 집행, 문서 관리, 회의록 작성 등 학생회 운영의 효율성을 책임지며, 내부 조직의 원활한 소통을 지원합니다.</td>
										</tr>
										<tr>
											<td>정책국</td>
											<td>학생들의 학습 환경 및 복지 개선을 위한 정책을 연구하고 제안합니다. 학사 제도, 장학금, 교육 환경 등 다양한 분야에서 학생들의 권익을 옹호하며, 학교 측에 정당한 요구를 전달합니다.</td>
										</tr>
										<tr>
											<td>문화기획국</td>
											<td>캠퍼스 내 다양한 문화 행사와 축제를 기획하고 실행합니다. 학우들의 활기찬 대학 생활을 위해 다양한 즐길 거리를 제공하며, 문화적 교류를 통해 단합을 도모합니다.</td>
										</tr>
										<tr>
											<td>복지국</td>
											<td>학생들의 생활 편의 증진을 위한 복지 사업을 담당합니다. 식당, 휴게 공간, 통학 환경 등 일상생활과 직결된 문제들을 개선하며, 학생들의 건의 사항을 수렴하여 실질적인 도움을 제공합니다.</td>
										</tr>
										<tr>
											<td>홍보국</td>
											<td>학생회의 활동 내용을 학우들에게 알리고, 학교의 소식을 전달하는 역할을 합니다. SNS, 웹사이트, 교내 게시판 등을 통해 활발한 소통을 이어가며, 학생회와 학우들 간의 연결 고리가 됩니다.</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- 학생회 조직도 및 주요 부서 끝 -->

				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../footer.jsp" />
</body>
</html>