<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="../../resources/css/reset.css">
        <link rel="stylesheet" href="../../resources/css/1.main.css">
        <link rel="stylesheet" href="../../resources/css/4_6.manageOrderDelivery.css">
        <title>ManageOrderDelivery</title>
    </head>
    <body>
        <header class="sticky-top navbar navbar-expand-lg" style="padding-top: 0px;">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
        </header>
        <main>
            <div id="main_left">
                <table>
                    <tr>
                        <th>마이페이지</th>
                    </tr>
                    <tr>
                        <td><a href="/member/myInfo.do?memberId=${memberId}&memberType=${memberType}">회원정보</a></td>
                    </tr>
                    <tr>
                        <td><a href="/seller/manageProduct.do">상품관리</a></td>
                    </tr>
                    <tr>
                        <td><a href="/seller/addProduct.do">상품등록</a></td>
                    </tr>
                    <tr>
                        <td style="background-color: white;"><a href="/seller/manageOrderDelivery.do">주문/발송 관리</a></td>
                    </tr>
                    <tr>
                        <td><a href="/member/delete.do">회원탈퇴</a></td>
                    </tr>
                </table>
            </div>
            <div id="main_middle">
                <h2><b>주문/발송 관리</b></h2>
                <hr>
                <table>
                    <tr>
                        <th></th>
                        <th>주문번호</th>
                        <th style="width: 30%;">상품명</th>
                        <th>수량</th>
                        <th>택배사</th>
                        <th>송장번호</th>
                        <th>주문인</th>
                        <th>전화번호</th>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>20234125</td>
                        <td>조르지오 아르마니 마이웨이 플로럴 오 드 퍼퓸 리필 스프레이 50ml</td>
                        <td>2</td>
                        <td>
                            <select class="deliveryCompany">
                                <option value="CJGLS">CJ대한통운</option>
                                <option value="LOTTEGLOBAL">롯데글로벌</option>
                                <option value="HANJIN">한진택배</option>
                                <option value="KGB">로젠택배</option>
                                <option value="DAESIN">대신택배</option>
                                <option value="EMS">우체국 EMS</option>
                            </select>
                        </td>
                        <td>2424534534</td>
                        <td><button onclick="addressDetail(this.value);" value="김철수"><u>김철수</u></button></td>
                        <td>000-0000-0000</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>20234432</td>
                        <td>눅스 맨 멀티-유즈 샤워 젤 200ml</td>
                        <td>1</td>
                        <td>
                            <select class="deliveryCompany">
                                <option value="CJGLS">CJ대한통운</option>
                                <option value="LOTTEGLOBAL">롯데글로벌</option>
                                <option value="HANJIN">한진택배</option>
                                <option value="KGB">로젠택배</option>
                                <option value="DAESIN">대신택배</option>
                                <option value="EMS">우체국 EMS</option>
                            </select>
                        </td>
                        <td>2364897480</td>
                        <td><button onclick="addressDetail(this.value);" value="신짱구"><u>신짱구</u></button></td>
                        <td>010-1111-1111</td>
                    </tr>
                </table>
                <button class="order success" onclick="orderConfirm(this.value);" value="승인/발송처리">주문 승인/발송</button>
                <button class="order cancel" onclick="orderConfirm(this.value);" value="주문 취소">주문 취소</button>
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
            function addressDetail(name) {
                alert("주문인 : " + name + "\n우편번호 : 01234\n주소 : 서울시 종로구\n상세주소 : 청계빌딩2층");
            }

            function orderConfirm(status) {
                const check = document.querySelectorAll("input[type=checkbox]");
                let count = 0;
                for( let i = 0; i < check.length; i++) {
                    if(check[i].checked) {
                        count++;
                    }
                }
                confirm("선택한 " + count + "건을 " + status + "하시겠습니까?");
            }



            document.querySelector("#toTheTop").addEventListener("click", function() {
                document.documentElement.scrollTop = 0;
            })
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </body>
</html>