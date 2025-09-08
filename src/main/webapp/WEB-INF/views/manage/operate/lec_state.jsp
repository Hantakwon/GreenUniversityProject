<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<%@ include file="./_top.jsp" %>
            <section id="admin-index" class="main-mini-box">
                <nav>
                    <h3>수강 현황</h3>
                    <p>
                        학사운영<strong>수강 현황</strong>
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
                                <col width="7%">
                                <col width="5%">
                                <col width="10%">
                                <col width="7%">
                                <col width="5%">
                                <col width="10%">
                                <col width="">
                                <col width="15%">
                                <col width="">
                                <col width="">
                                <col width="5%">
                                <col width="10%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>년도</th>
                                    <th>학기</th>
                                    <th>학번</th>
                                    <th>이름</th>
                                    <th>학년</th>
                                    <th>학과</th>
                                    <th>과목코드</th>
                                    <th>과목명</th>
                                    <th>구분</th>
                                    <th>교수</th>
                                    <th>학점</th>
                                    <th>수강 신청일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>2025</td>
                                    <td>1</td>
                                    <td>202001230</td>
                                    <td>홍길동</td>
                                    <td>1</td>
                                    <td>컴퓨터공학과</td>
                                    <td>3025112</td>
                                    <td>프로그래밍 개론</td>
                                    <td>전공선택</td>
                                    <td>김컴공</td>
                                    <td>3</td>
                                    <td>2025-01-01</td>
                                </tr>
                                <tr>
                                    <td>2025</td>
                                    <td>1</td>
                                    <td>202001230</td>
                                    <td>홍길동</td>
                                    <td>1</td>
                                    <td>컴퓨터공학과</td>
                                    <td>3025112</td>
                                    <td>프로그래밍 개론</td>
                                    <td>전공선택</td>
                                    <td>김컴공</td>
                                    <td>3</td>
                                    <td>2025-01-01</td>
                                </tr>
                                <tr>
                                    <td>2025</td>
                                    <td>1</td>
                                    <td>202001230</td>
                                    <td>홍길동</td>
                                    <td>1</td>
                                    <td>컴퓨터공학과</td>
                                    <td>3025112</td>
                                    <td>프로그래밍 개론</td>
                                    <td>전공선택</td>
                                    <td>김컴공</td>
                                    <td>3</td>
                                    <td>2025-01-01</td>
                                </tr>
                                <tr>
                                    <td>2025</td>
                                    <td>1</td>
                                    <td>202001230</td>
                                    <td>홍길동</td>
                                    <td>1</td>
                                    <td>컴퓨터공학과</td>
                                    <td>3025112</td>
                                    <td>프로그래밍 개론</td>
                                    <td>전공선택</td>
                                    <td>김컴공</td>
                                    <td>3</td>
                                    <td>2025-01-01</td>
                                </tr>
                                <tr>
                                    <td>2025</td>
                                    <td>1</td>
                                    <td>202001230</td>
                                    <td>홍길동</td>
                                    <td>1</td>
                                    <td>컴퓨터공학과</td>
                                    <td>3025112</td>
                                    <td>프로그래밍 개론</td>
                                    <td>전공선택</td>
                                    <td>김컴공</td>
                                    <td>3</td>
                                    <td>2025-01-01</td>
                                </tr>
                                <tr>
                                    <td>2025</td>
                                    <td>1</td>
                                    <td>202001230</td>
                                    <td>홍길동</td>
                                    <td>1</td>
                                    <td>컴퓨터공학과</td>
                                    <td>3025112</td>
                                    <td>프로그래밍 개론</td>
                                    <td>전공선택</td>
                                    <td>김컴공</td>
                                    <td>3</td>
                                    <td>2025-01-01</td>
                                </tr>
                                <tr>
                                    <td>2025</td>
                                    <td>1</td>
                                    <td>202001230</td>
                                    <td>홍길동</td>
                                    <td>1</td>
                                    <td>컴퓨터공학과</td>
                                    <td>3025112</td>
                                    <td>프로그래밍 개론</td>
                                    <td>전공선택</td>
                                    <td>김컴공</td>
                                    <td>3</td>
                                    <td>2025-01-01</td>
                                </tr>
                                <tr>
                                    <td>2025</td>
                                    <td>1</td>
                                    <td>202001230</td>
                                    <td>홍길동</td>
                                    <td>1</td>
                                    <td>컴퓨터공학과</td>
                                    <td>3025112</td>
                                    <td>프로그래밍 개론</td>
                                    <td>전공선택</td>
                                    <td>김컴공</td>
                                    <td>3</td>
                                    <td>2025-01-01</td>
                                </tr>
                                <tr>
                                    <td>2025</td>
                                    <td>1</td>
                                    <td>202001230</td>
                                    <td>홍길동</td>
                                    <td>1</td>
                                    <td>컴퓨터공학과</td>
                                    <td>3025112</td>
                                    <td>프로그래밍 개론</td>
                                    <td>전공선택</td>
                                    <td>김컴공</td>
                                    <td>3</td>
                                    <td>2025-01-01</td>
                                </tr>
                                <tr>
                                    <td>2025</td>
                                    <td>1</td>
                                    <td>202001230</td>
                                    <td>홍길동</td>
                                    <td>1</td>
                                    <td>컴퓨터공학과</td>
                                    <td>3025112</td>
                                    <td>프로그래밍 개론</td>
                                    <td>전공선택</td>
                                    <td>김컴공</td>
                                    <td>3</td>
                                    <td>2025-01-01</td>
                                </tr>                                                                                                                                                                                                                                                                                                                                
                               

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