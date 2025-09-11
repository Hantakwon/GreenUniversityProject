<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="./_top.jsp" %>
            <section id="admin-index" class="main-mini-box">
               <nav>
                  <h3>강의 목록</h3>
                    <p>
                        학사운영<strong>강의 목록</strong>
                    </p>
                </nav>
                <article>
                    <div class="search">                    
                        <form method="get" action="#">
                            <select>
                                <option value="1">검색조건</option>
                                <option value="1">과목코드</option>
                                <option value="2">학과</option>
                                <option value="3">과목명</option>
                                <option value="4">교수</option>
                            </select>
                            <input type="text" name="keyword" placeholder="키워드 입력">
                            <input type="submit" value="검색">
                        </form>
                    </div>
                    <div class="bn-list-common01 type01 bn-common bn-common">                        
                        <table class="board-table">
                            <colgroup>
                                <col width="10%">
                                <col width="10%">
                                <col width="5%">
                                <col width="10%">
                                <col width="15%">
                                <col width="8%">
                                <col width="5%">
                                <col width="15%">
                                <col width="12%">
                                <col width="9%">
                            </colgroup>
                            <thead>
                            <tr>                          
                                <th scope="col">과목코드</th>
                                <th scope="col">학과</th>
                                <th scope="col">학년</th>
                                <th scope="col">구분</th>
                                <th scope="col">과목명</th>
                                <th scope="col">교수</th>
                                <th scope="col">학점</th>
                                <th scope="col">수업시간</th>
                                <th scope="col">강의실</th>
                                <th scope="col">최대 수강 인원</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="lec" items="${dtoList}">
                                <tr>                          
                                    <td>${lec.lec_no}</td>
                                    <td>${lec.department}</td>
                                    <td>${lec.grade}</td>
                                    <td>${lec.category}</td>
                                    <td>${lec.lec_name}</td>
                                    <td>${lec.professor}</td>
                                    <td>${lec.credit}</td>
                                    <td>${lec.class_time}</td>
                                    <td>${lec.classroom}</td>
                                    <td>${lec.max_enrollment}</td>
                                </tr>
                            </c:forEach>    
                            </tbody>
                        </table>
                    </div>
                    <div class="b-paging01 type03">
                        <div class="b-paging01 type01">
                          <div class="b-paging-wrap">
                            <ul>
                              <li class="first pager">
                    			<a href="?pg=1"><span class="hide">FIRST</span></a></li>
               				 
                             <li class="prev pager">
		                    <c:set var="prevPage" value="${pagenationDTO.pageGroupStart - 1}" />
		                    <c:if test="${prevPage >= 1}">
		                        <a href="?pg=${prevPage}"><span class="hide">PREV</span></a>
		                    </c:if></li>
                			
                			<c:forEach var="i" begin="${pagenationDTO.pageGroupStart}" end="${pagenationDTO.pageGroupEnd}">
                    		<li>
                        		<a href="?pg=${i}" class="<c:if test='${i == pagenationDTO.currentPage}'>active</c:if>">
                            	${i}
                        	</a></li>
               				</c:forEach>
               				
                            <li class="next pager">
		                    <c:set var="nextPage" value="${pagenationDTO.pageGroupEnd + 1}" />
		                    <c:if test="${nextPage <= pagenationDTO.lastPageNum}">
		                        <a href="?pg=${nextPage}"><span class="hide">NEXT</span></a>
		                    </c:if></li>
		                    
                              <li class="last pager">
                    			<a href="?pg=${pagenationDTO.lastPageNum}"><span class="hide">LAST</span></a></li>
                            </ul>
                          </div>
                        </div>
                </article>
            </section>
<%@ include file="./_bottom.jsp" %>