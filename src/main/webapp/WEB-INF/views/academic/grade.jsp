<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린대학교 성적 페이지</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/academic/hyokongmain.css">
</head>

<!-- 
	날짜 : 2025-09-09
	이름 : 박효빈
	내용 : 성적 HTML 성적 *정적페이지 구성
-->
<body>
	<main>
		<jsp:include page="../header.jsp" />
		<div>
			<div class="info">
				<span id="test"><img
					src="<%=request.getContextPath()%>/resources/images/ico-home.png"
					alt="홈 버튼"> &gt; 학사안내 &gt; 성적
				</span>
			</div>
		</div>
		<div>
			<div class="content-wrapper">
				<div class="sidebar">
					<div class="top">
						<h1>학사안내</h1>
					</div>
					<div class="bottom">
						<ul>
							<li class="#"><a href="#">공지사항</a></li>
							<li class="#"><a href="#">학사일정</a></li>
							<li class="#"><a href="#">수강신청</a></li>
							<li class="active"><a href="#">성적</a></li>
							<li><a href="#">수료 및 졸업</a></li>
							<li><a href="#">자주 묻는 질문</a></li>
						</ul>
					</div>
				</div>
				<div class="main-content">
					<div class="top">
						<h2>성적</h2>
					</div>
					<div class="bold-ment">

						<img src="<%=request.getContextPath()%>/resources/images/bullet-h4.png" alt="bullet-h4 이미지">
						<h4 class="span-bold">시험</h4>
						<div class="ment1">

							<span class="bold-span-highlight">- 시험은 정기시험, 비정기시험, 추가시험,
								재시험 등으로 구분</span> 1) 정기시험 : 중간시험과 학기말시험으로 나누며 중간시험은 학기 당 수업일수 2분의 1이 되는
							주에 실시하고, 학기말시험은 학기의 최종 주에 실시<br> 2) 비정기시험 : 과제학습, 세미나 등 계속적인
							학습활동을 평가하는 시험으로 담당교수의 책임 하에 실시<br> 3) 추가시험 : 질병 또는 부득이한 사정으로
							정기시험에 응시할 수 없는 학생은 사유와 증빙서류를 첨부하여 추가시험신청서를 제출<br> <br>

							<span class="bold-span-highlight">- 시험 부정행위자의 처리</span> 1) 시험 중
							부정행위가 적발되면 감독교수는 그 행위내용을 시험지 상단에 기록하고 날인한 후 즉시 총장에게 보고<br>
							2) 시험 부정행위자에 대하여는 다음의 내용에 따라 제적 또는 유기정학 처분<br> └ 시험에 대리로
							응시하거나 대리응시를 부탁한 경우<br> └ 시험지에 다른 사람의 이름을 쓰거나 쓰게 한 경우<br>
							└ 부정행위자로 적발되어 징계처분을 받은 사실이 있는 학생이 거듭 부정행위를 한 경우
						</div>
					</div>
					<div class="bold-ment">
						<img src="<%=request.getContextPath()%>/resources/images/bullet-h4.png" alt="bullet-h4 이미지">
						<h4 class="span-bold">성적</h4>
						<div class="ment1">
							<span class="bold-span-highlight">- 평가내용</span> 1) 성적평가는 각 교과목의
							시험성적, 과제평가, 출석상황 및 학습태도 등을 종합하여 평가<br> 2) 출석 및 학습태도 10-20%,
							정기시험 50-70%, 비정기시험 및 과제 20-30%로 함을 원칙<br> <br> <span
								class="bold-span-highlight">- 등급</span>
							<div class="div-table">
								<table class="grade-table">

									<colgroup>
										<col style="width: 25%">
										<col style="width: 25%">
										<col style="width: 25%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">등급</th>
											<th scope="col">평점</th>
											<th scope="col">백분위 기준점수</th>
											<th scope="col">비고</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>A+</td>
											<td>4.5</td>
											<td>99</td>
											<td></td>
										</tr>
										<tr>
											<td>A</td>
											<td>4</td>
											<td>94</td>
											<td></td>
										</tr>
										<tr>
											<td>B+</td>
											<td>3.5</td>
											<td>89</td>
											<td></td>
										</tr>
										<tr>
											<td>B</td>
											<td>3</td>
											<td>84</td>
											<td></td>
										</tr>
										<tr>
											<td>C+</td>
											<td>2.5</td>
											<td>79</td>
											<td></td>
										</tr>
										<tr>
											<td>C</td>
											<td>2</td>
											<td>74</td>
											<td></td>
										</tr>
										<tr>
											<td>D+</td>
											<td>1.5</td>
											<td>69</td>
											<td></td>
										</tr>
										<tr>
											<td>D</td>
											<td>1</td>
											<td>64</td>
											<td></td>
										</tr>
										<tr>
											<td>F</td>
											<td>0</td>
											<td>59</td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>


						</div>
						<p class="con-p no-pd">※ 이수한 교과목의 성적이 D0급 이상 또는 P일 경우는 학점을 취득한
							것으로 인정</p>

					</div>


				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../footer.jsp" />
</body>
</html>