<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../../resources/css/1.main.css">
        <link rel="stylesheet" href="../../resources/css/4_1.orderHistory.css">
        <link rel="stylesheet" href="../../resources/css/reset.css">
        <script src="https://kit.fontawesome.com/dbb376a4c5.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <title>OrderHistory</title>
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
                        <td style="background-color: white;"><a href="/buyer/orderHistory.do">주문내역</a></td>
                    </tr>
                    <tr>
                        <td><a href="/buyer/actHistory.do">내 활동내역</a></td>
                    </tr>
                    <tr>
                        <td><a href="/member/delete.do">회원탈퇴</a></td>
                    </tr>
                </table>
            </div>
            <div id="main_middle">
                <h2><b>주문 내역</b></h2>
                <hr>
                <select id="periodOrderHistory" onchange="period(this.value);">
                    <option value="all">전체</option>
                    <option value="2023">2023</option>
                    <option value="2022">2022</option>
                </select>
                <table>
                    <thead>
                        <tr>
                            <th>주문 번호</th>
                            <th>상품명</th>
                            <th>주문 날짜</th>
                            <th>배송 상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>20234526</td>
                            <td><a href="../../product/detail.html">조말론 와일드 블루벨 코롱 30ml</a></td>
                            <td>2023-06-04</td>
                            <td style="color: orange; font-weight: bold;">배송 준비</td>
                        </tr>
                        <tr>
                            <td>20235356</td>
                            <td><a href="../../product/detail.html">비오템 옴므 아쿠아 세트</a></td>
                            <td>2023-05-17</td>
                            <td style="color: rgb(29, 128, 234); font-weight: bold;">배송 중 </td>
                        </tr>
                        <tr>
                            <td>22436444</td>
                            <td><a href="../../product/detail.html">겔랑 아베이 로얄 아이 알 세럼 20ml</a></td>
                            <td>2023-05-15</td>
                            <td style="color: rgb(12, 157, 14); font-weight: bold;">배송 완료</td>
                        </tr>
                    </tbody>
                </table>
                <nav aria-label="...">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item active" aria-current="page">
                            <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
                    <div class="deliveryStatusInfo">
                        <p>
                            <span>* 결제 완료 : 결제가 완료 된 상태입니다.</span><br>
                            <span style="color: orange; font-weight: bold;">* 배송 준비 : 상품을 준비 중입니다.</span><br>
                            <span style="color: rgb(29, 128, 234); font-weight: bold;">* 배송 중 : 택배사를 통해 상품이 배송 중입니다.</span><br>
                            <span style="color: rgb(12, 157, 14); font-weight: bold;">* 배송 완료 : 주문하신 상품이 댁으로 안전하게 배송되었습니다.</span>
                        </p>
                    </div>
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
            function period(value) {
                if(value == "2022") {
                    document.querySelector("#main_middle tbody").remove();
                }
            }
            document.querySelector("#toTheTop").addEventListener("click", function() {
                document.documentElement.scrollTop = 0;
            })
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </body>
</html>