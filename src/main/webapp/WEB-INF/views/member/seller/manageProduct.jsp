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
        <link rel="stylesheet" href="../../resources/css/4_4.manageProduct.css">
        <title>ManageProduct</title>
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
                        <td style="background-color: white;"><a href="/seller/manageProduct.do">상품관리</a></td>
                    </tr>
                    <tr>
                        <td><a href="/seller/addProduct.do">상품등록</a></td>
                    </tr>
                    <tr>
                        <td><a href="/seller/manageOrderDelivery.do">주문/발송 관리</a></td>
                    </tr>
                    <tr>
                        <td><a href="/member/delete.do">회원탈퇴</a></td>
                    </tr>
                </table>
            </div>
            <div id="main_middle">
                <h2><b>상품 관리</b></h2>
                <hr>
                <div class="search">
                    <input type="text" placeholder="상품명을 입력해주세요">
                    <button id="findProduct" onclick="findProduct();"><i class="fa-solid fa-magnifying-glass" style="color: blue;"></i></button>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>상품명</th>
                            <th>가격</th>
                            <th>판매상태</th>
                            <th>재고</th>
                            <th>등록일</th>
                            <th>네이버</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>4</td>
                            <td><a href="/seller/addProduct.do">내추럴 뷰티 에센셜 오일 100ml</a></td>
                            <td>27,000</td>
                            <td style="color: green; font-weight: 900;">판매중</td>
                            <td>997</td>
                            <td>2023-04-17</td>
                            <td class="showPrice1"><button onclick="premium(this);" value="showPrice1">조회</button></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td><a href="/seller/addProduct.do">타차 더 실크 크림 50ml</a></td>
                            <td>35,000</td>
                            <td style="color: green; font-weight: 900;">판매중</td>
                            <td>81</td>
                            <td>2023-04-17</td>
                            <td class="showPrice2"><button onclick="premium(this);" value="showPrice2">조회</button></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><a href="/seller/addProduct.do">조르지오 아르마니 마이웨이 플로럴 오 드 퍼퓸 리필 150ml</a></td>
                            <td>56,000</td>
                            <td style="color: red; font-weight: 900;">품절</td>
                            <td>-</td>
                            <td>2023-03-30</td>
                            <td><button onclick="noPremium();">조회</button></td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td><a href="/seller/addProduct.do">샤넬 루쥬 알뤼르 렉스트레 립스틱 - 812 베이지 brut 2g</a></td>
                            <td>72,800</td>
                            <td style="color: green; font-weight: 900;">판매중</td>
                            <td>157</td>
                            <td>2023-03-30</td>
                            <td><button onclick="noPremium();">조회</button></td>
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
            function findProduct() {
                const inputVal = document.querySelector(".search input").value;
                console.log(inputVal);
                const tr = document.querySelectorAll("#main_middle tbody tr");
                for(var i = 0; i < tr.length; i++) {
                    
                    if(!tr[i].childNodes[3].innerText.includes(inputVal)) {
                        tr[i].remove();
                    }
                    
                }
            }

            function premium(btnTag) {
                const priceTag = document.querySelector("." + btnTag.value);
                priceTag.removeChild(btnTag);
                priceTag.append("33,000원");
            }

            function noPremium() {
                const goPre = confirm("슈퍼 프리미엄 회원이 아닙니다.프리미엄 페이지로 이동하시겠습니까?");
                if(goPre) {
                    location.href = "../common/premium.html";
                }
            }
            document.querySelector("#toTheTop").addEventListener("click", function() {
                document.documentElement.scrollTop = 0;
            })
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </body>
</html>