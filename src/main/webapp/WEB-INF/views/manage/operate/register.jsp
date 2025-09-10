<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="./_top.jsp" %>
            <section id="admin-index" class="main-mini-box">
                <nav>
                    <h3>강의 등록</h3>
                    <p>
                        학사운영<strong>강의 등록</strong>
                    </p>
                </nav>
                <h4 class="tit-h4" style="position: relative;">기본정보 입력</h4>
                <article class="">
                    <table class="board-table">
                        <colgroup>
                            <col width="20%">
                            <col width="">
                            <col width="20%">
                            <col width="">
                        </colgroup>
                        <tbody>
                            <tr class="">
                                <td class="tit">과목코드</td>
                                <td>
                                    <span>학과 코드 + 연도 + 학기 + 순번 조합 자동생성</span>
                                </td>
                                <td class="tit">개설학과</td>
                                <td>
                                    <select>
                                        <option value="1">인문사회대학</option>
                                        <option value="2">자연과학대학</option>
                                        <option value="3">공과대학</option>
                                        <option value="4">사범대학</option>
                                        <option value="5">대학원</option>
                                    </select>
                                    <select>
                                        <option value="1">국어국문학과</option>
                                        <option value="2">영어영문학과</option>
                                        <option value="3">일어일문학과</option>
                                        <option value="4">중어중문학과</option>
                                        <option value="5">역사학과</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="">
                                <td class="tit">개설학년</td>
                                <td>
                                    <select>
                                        <option value="1">1 학년</option>
                                        <option value="2">2 학년</option>
                                        <option value="3">3 학년</option>
                                        <option value="4">4 학년</option>
                                    </select>
                                </td>
                                <td class="tit">학점</td>
                                <td>
                                    <select>
                                        <option value="3">3 학점</option>
                                        <option value="2">2 학점</option>
                                        <option value="1">1 학점</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="">
                                <td class="tit">이수구분</td>
                                <td>
                                    <select>
                                        <option>전공 선택</option>
                                        <option>전공 필수</option>
                                        <option>교양 선택</option>
                                        <option>교양 필수</option>                                            
                                    </select>
                                </td>
                                <td class="tit">담당교수</td>
                                <td>
                                    <select>
                                        <option>김유신</option>
                                        <option>김춘추</option>
                                        <option>장보고</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="">
                                <td class="tit">강의명</td>
                                <td colspan="3">
                                    <input type="text" style="width: 50%" placeholder="강좌명 입력">
                                </td>
                            </tr>
                            <tr class="">
                                <td class="tit">강의 설명</td>
                                <td colspan="3">
                                    <textarea placeholder="강의 개요 및 목표, 학습 내용 등" style="width: 50%; background-color: #fff; text-align: left; resize: vertical;" rows="6"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </article>
                <h4 class="tit-h4" style="position: relative;">수업정보 입력</h4>
                <article class="">
                    <table class="board-table">
                        <tbody>
                            <tr class="">
                                <td class="tit">수업 기간</td>
                                <td colspan="3">
                                    <input type="date" value="10:00" style="width: 150px;"/>&nbsp;~
                                    <input type="date" value="12:00" style="width: 150px;"/>
                                </td>
                            </tr>
                            <tr class="">
                                <td class="tit">수업 시간</td>
                                <td colspan="3">
                                    <input type="time" value="10:00" style="width: 150px;"/>&nbsp;~
                                    <input type="time" value="12:00" style="width: 150px;"/>
                                    <div style="margin-left: 10px; vertical-align: bottom; display: inline-block;">
                                        <label class="day"><input type="checkbox">월</label>
                                        <label class="day"><input type="checkbox">화</label>
                                        <label class="day"><input type="checkbox">수</label>
                                        <label class="day"><input type="checkbox">목</label>
                                        <label class="day"><input type="checkbox">금</label>
                                    </div>                                    
                                </td>
                            </tr>
                            <tr class="">
                                <td class="tit">평가방식</td>
                                <td colspan="3">
                                    <input type="text" placeholder="출석 10%, 과제 30%, 시험 60%" style="width: 450px;"/>
                                </td>
                            </tr>
                            <tr class="">
                                <td class="tit">교재</td>
                                <td colspan="3">
                                    <input type="text" placeholder="출판사 - 도서명 - 저자 입력" style="width: 450px;"/>
                                </td>
                            </tr>
                            <tr class="">
                                <td class="tit">강의실</td>
                                <td>
                                    <input type="text" placeholder="인문관 301호" style="width: 200px;"/>
                                </td>
                                <td class="tit">최대 수강인원</td>
                                <td>
                                    <input type="number" value="" style="width: 200px;"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="submit" value="등록" style="float:right; width: 100px; background: #1a528e; color: #fff; border: 1px solid #08305a;">
                </article>

            </section>
        </main>
<%@ include file="./_bottom.jsp" %>