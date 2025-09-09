<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
                                    <td>${lec.lecNo}</td>
                                    <td>${lec.department}</td>
                                    <td>${lec.grade}</td>
                                    <td>${lec.category}</td>
                                    <td>${lec.lenName}</td>
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
                              <li  class="first pager"><a href="#curPage"><span class="hide">FIRST</span></a></li>
                              <li  class="prev pager"><a href="#curPage"><span class="hide">PREV</span></a></li>
                              <li><a href="#curPage" class="active">1</a></li>
                              <li><a href="#curPage">2</a></li>
                              <li><a href="#curPage">3</a></li>
                              <li  class="next pager"><a href="#curPage"><span class="hide">NEXT</span></a></li>
                              <li  class="last pager"><a href="#curPage"><span class="hide">LAST</span></a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                </article>
            </section>
        </main>
<%@ include file="./_bottom.jsp" %>