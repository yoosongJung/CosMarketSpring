<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/dbb376a4c5.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="../../resources/css/1.main.css">
        <link rel="stylesheet" href="../../resources/css/12.shoppingBasket.css">
        <link rel="stylesheet" href="../../resources/css/reset.css">
        <title>ShoppingBasket</title>
    </head>
    <body>
    	<c:if test="${memberType eq null }"><jsp:forward page="/memberInfo/login.do"/></c:if>
        <header class="sticky-top navbar navbar-expand-lg" style="padding-top: 0px;">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
        </header>
        <main>
            <div id="main_left">

            </div>
            <div id="main_middle">
                <h2><b>장바구니</b></h2>
                <hr>
                <table>
                    <tr>
                        <th></th>
                        <th></th>
                        <th>상품명</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th>판매상태</th>
                    </tr>
                    <tr id="no1">
                        <td><input type="checkbox"></td>
                        <td><button onclick="deleted(this.value);" value="no1"><i class="fa-solid fa-star" style="color: #f0e247; font-size: x-large;"></i></button></td>
                        <td><a href="../../product/detail.html">랑콤 토니끄 꽁포르 200ml</a></td>
                        <td>39,000원</td>
                        <td><input type="number" value="2"></td>
                        <td>판매중</td>
                    </tr>
                    <tr id="no2">
                        <td><input type="checkbox"></td>
                        <td><button onclick="deleted(this.value);" value="no2"><i class="fa-solid fa-star" style="color: #f0e247; font-size: x-large;"></i></button></td>
                        <td><a href="../../product/detail.html">디올 옴므 에프터 셰이브 로션 100m</a></td>
                        <td>17,000원</td>
                        <td><input type="number" value="1"></td>
                        <td>판매중</td>
                    </tr>
                </table>
                <button class="order success" onclick="toPay();">결제하기</button>
            </div>
            <div id="main_right">
                <div>
                    <table>
                        <tr><th>최근 본 상품</th></tr>
                        <tr><td><a href="#"><img src="../../resources/images/main/sidebar_recent1.jpg" alt=""></a><p class="arrow_box">조말론 와일드 블루벨 코롱 30ml<br><br>39,900원</p></td></tr>
                        <tr><td><a href="#"><img src="../../resources/images/main/sidebar_recent2.jpg" alt=""></a><p class="arrow_box">비오템 옴므 아쿠아파워 클렌저 125ml<br><br>15,900원</p></td></tr>
                        <tr><td><a href="#"><img src="../../resources/images/main/sidebar_recent3.jpg" alt=""></a><p class="arrow_box">구찌 길티 뿌르 옴므 오드 뜨왈렛 스프레이 50ml<br><br>106,900원</p></td></tr>
                    </table>
                    <button id="toTheTop" style="font-weight: bold; background-color: #2e95e9; color: white;">top  <i class="fa-solid fa-arrow-up"></i></button>
                </div>
            </div>
        </main>
        <footer class="navbar navbar-expand-lg">
            <div id="footer" class= "container-fluid">
                <div class="logo">
                    <a href="#"><img src="../../resources/images/main/logo.PNG" alt=""></a>
                </div>
                <div class="footer footer1">
                    <ul>
                        <li>회사명 : (주)코스마켓</li>
                        <li>대표이사 : 정유송</li>
                        <li>사업자등록번호 : 12-123-12345</li>
                        <li>주소 : 서울시 종로구 청계빌딩2층</li>
                    </ul>
                </div>
                <div class="footer footer2">
                    <ul>
                        <li><a href="..//admin/companyIntro.do">회사소개</a></li>
                        <li><a href="..//admin/companyHistory.do">회사연혁</a></li>
                        <li><a href="">이용약관</a></li>
                        <li><a href="">개인정보취급방침</a></li>
                    </ul>
                </div>
            </div>
        </footer>
        <script>
            function toPay() {
                const check = document.querySelectorAll("input[type=checkbox]");
                let count = 0;
                for( let i = 0; i < check.length; i++) {
                    if(check[i].checked) {
                        count++;
                    }
                }
                if(count == 0) {
                    alert("구매 원하시는 상품을 최소 1개 이상 선택해주세요");
                } else location.href = "../../product/payment.html";
            }

            function deleted(value) {
                const final = confirm("체크 해제 시 장바구니에서 사라집니다. 진행하시겠습니까?");
                if(final) {
                    document.querySelector("#" + value).remove();
                }
            }


            document.querySelector("#toTheTop").addEventListener("click", function() {
                            document.documentElement.scrollTop = 0;
                        })
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </body>
</html>