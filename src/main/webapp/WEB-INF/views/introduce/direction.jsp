<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린대학교</title>

<!-- ✅ 카카오 지도 JavaScript 키 수진이꺼임수진이꺼! 
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5484cc9c08d15b992911cc635e404a9&libraries=services"></script>
-->
<!-- 카카오 지도 SDK -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5484cc9c08d15b992911cc635e404a9&libraries=services"></script>
</head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/introduce/common.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/introduce/direction.css">

<!--
	날짜 : 2025/09/05
    이름 : 한탁원
    내용 : 오시는 길
-->

<body>
	<jsp:include page="../header.jsp" />
	<div class="path-wrap">
		<div class="path-box">
			<div class="jwxe_navigator jw-relative">
				<ul>
					<li><a href="#"><img src="../resources/images/ico-home.png" alt="home" /></a></li>
					<li><a href="#">대학소개</a></li>
					<li>오시는 길</li>
				</ul>
			</div>
		</div>
	</div>
	<style>
	  .sub-container {
	    color: white;
	  }
	
	  .sub-container a {
	    color: #fff;
	  }
	
	  .sub-container h2, 
	  .sub-container h3, 
	  .sub-container h4 {
	    color: #fff;
	  }
	</style>
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

					<li><a href="/introduce/organization.do">조직도</a></li>

					<li class="active"><a href="/introduce/direction.do" class="active">오시는길</a></li>
				</ul>
			</div>
		</div>
		<div class="content-wrap">

			<div class="title">
				<div class="jwxe_mnu_template jw-relative page-title">
					<h3>오시는 길</h3>
				</div>
			</div>
			<div class="content" id="jwxe_main_content">
				<div class="content-box">
			    <!-- ✅ 지도 표시 영역 -->
			    <div id="map" style="width:100%; height:400px; margin-top:20px;"></div>
	
				<!-- 지도 스크립트 -->
				    <script>
				        window.onload = function() {
				            var geocoder = new kakao.maps.services.Geocoder();
				
				            var mapContainer = document.getElementById('map'),
				                mapOption = {
				                    center: new kakao.maps.LatLng(35.1595454, 129.0556105),
				                    level: 3
				                };
				
				            var map = new kakao.maps.Map(mapContainer, mapOption);
				
				            geocoder.addressSearch('부산 부산진구 중앙대로 749', function(result, status) {
				                if (status === kakao.maps.services.Status.OK) {
				                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				                    map.setCenter(coords);
				
				                    var marker = new kakao.maps.Marker({
				                        map: map,
				                        position: coords
				                    });
				
				                    var infowindow = new kakao.maps.InfoWindow({
				                    	content: '<div style="padding:5px;font-size:13px; color:#000;">그린대학교<br/>부산진구 중앙대로 749</div>'

				                    });
				                    infowindow.open(map, marker);
				                } else {
				                    alert('주소를 찾을 수 없습니다.');
				                }
				            });
				        };
				    </script>
			</div>
		</div>
			</br>
			</br>
		<div class="direction_address">
			<h4> 주소 : 부산 부산진구 중앙대로 749, 그린대학교 </h4>
   		</div>
	   		</br>
	   		</br>

   	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>