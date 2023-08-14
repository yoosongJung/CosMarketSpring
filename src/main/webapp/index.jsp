<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./resources/css/1.main.css">
        <link rel="stylesheet" href="./resources/css/reset.css">
        <script src="https://kit.fontawesome.com/dbb376a4c5.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <title>메인페이지</title>
    </head>
    <body>
        <header class="sticky-top navbar navbar-expand-lg" style="padding-top: 0px;">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
        </header>
        <main>
            <div id="main_left">

            </div>
            <div id="main_middle">
                <div class="bg-video">
                    <video class="bg-video__content" autoplay muted loop>
                        <source src="./resources/images/mainBackground.mp4" type="video/mp4" />
                    </video>
                </div>
                <div>
                    <table style="width: 100%;">
                        <tr>
                            <td class="dropdown">
                                <button class="dropbtn">명품 화장품</button>
                                <div class="dropdown-content">
                                <a href="./product/list.html">샤넬</a>
                                <a href="./product/list.html">구찌</a>
                                <a href="./product/list.html">몽블랑</a>
                                <a href="./product/list.html">톰포드</a>
                                <a href="./product/list.html">마크제이콥스</a>
                                </div>
                            </td>
                            <td class="dropdown">
                                <button class="dropbtn">명품 향수</button>
                                <div class="dropdown-content">
                                <a href="./product/list.html">페라가모</a>
                                <a href="./product/list.html">페라리</a>
                                <a href="./product/list.html">에르메스</a>
                                <a href="./product/list.html">켈빈클라인</a>
                                <a href="./product/list.html">입생로랑</a>
                                </div>
                            </td>
                            <td class="dropdown">
                                <button class="dropbtn">국내 화장품</button>
                                <div class="dropdown-content">
                                <a href="./product/list.html">올리브영</a>
                                <a href="./product/list.html">이니스프리</a>
                                <a href="./product/list.html">스킨푸드</a>
                                </div>
                            </td>
                            <td class="dropdown">
                                <button class="dropbtn">맘&베이비</button>
                                <div class="dropdown-content">
                                <a href="./product/list.html">몽디에스</a>
                                <a href="./product/list.html">아토팜</a>
                                <a href="./product/list.html">일리윤</a>
                                <a href="./product/list.html">함소아</a>
                                </div>
                            </td>
                            <td class="dropdown">
                                <button class="dropbtn">해외배송</button>
                                <div class="dropdown-content">
                                <a href="./product/list.html">로레알</a>
                                <a href="./product/list.html">랑콤</a>
                                <a href="./product/list.html">입생로랑</a>
                                <a href="./product/list.html">비쉬</a>
                                <a href="./product/list.html">샤넬</a>
                                </div>
                            </td>
                            <td class="dropdown">
                                <button class="dropbtn">BEST</button>
                                <div class="dropdown-content">
                                <a href="./product/list.html">이니스프리</a>
                                <a href="./product/list.html">아리따움</a>
                                <a href="./product/list.html">샤넬</a>
                                <a href="./product/list.html">토니모리</a>
                                <a href="./product/list.html">입생로랑</a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel" style="width: 80%; margin: 20px auto;">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="./resources/images/main/carousel1.jpg" style="width: 100%; height: 20rem;" class="d-block w-100" alt="광고문구1">
                        </div>
                        <div class="carousel-item">
                            <img src="./resources/images/main/carousel2.jpg" style="width: 100%; height: 20rem;" class="d-block w-100" alt="광고문구2">
                        </div>
                        <div class="carousel-item">
                            <img src="./resources/images/main/carousel3.jpg" style="width: 100%; height: 20rem;" class="d-block w-100" alt="광고문구3">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
                <br>
                <div class="popularBrand">
                    <p style="box-shadow: -5px -5px 20px 0px #2e95e9, 5px 5px 20px 0px #2e95e9; width: 15%; font-size: large;font-family: 'Nanum Pen Script', cursive; font-weight: 800; color: #0a2b47; text-align: center; border-radius: 5px; background-color: #fff;">인기 브랜드</p>
                    <div class="container text-center my-3">
                        <div class="row mx-auto my-auto justify-content-center">
                            <div id="recipeCarousel" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner" role="listbox">
                                    <div class="carousel-item active">
                                        <div class="col-md-3">
                                            <div class="card">
                                                <div class="card-img">
                                                    <img src="./resources/images/popularBrand/popularBrand1.png" style="height: 10rem;" class="img-fluid">
                                                </div>
                                                <div class="card-img-overlay"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <div class="col-md-3">
                                            <div class="card">
                                                <div class="card-img">
                                                    <img src="./resources/images/popularBrand/popularBrand2.jpg" style="height: 10rem;" class="img-fluid">
                                                </div>
                                                <div class="card-img-overlay"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <div class="col-md-3">
                                            <div class="card">
                                                <div class="card-img">
                                                    <img src="./resources/images/popularBrand/popularBrand3.png" style="height: 10rem;" class="img-fluid">
                                                </div>
                                                <div class="card-img-overlay"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <div class="col-md-3">
                                            <div class="card">
                                                <div class="card-img">
                                                    <img src="./resources/images/popularBrand/popularBrand4.png" style="height: 10rem;" class="img-fluid">
                                                </div>
                                                <div class="card-img-overlay"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <div class="col-md-3">
                                            <div class="card">
                                                <div class="card-img">
                                                    <img src="./resources/images/popularBrand/popularBrand5.png" style="height: 10rem;" class="img-fluid">
                                                </div>
                                                <div class="card-img-overlay"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <div class="col-md-3">
                                            <div class="card">
                                                <div class="card-img">
                                                    <img src="./resources/images/popularBrand/popularBrand6.jpg" style="height: 10rem;" class="img-fluid">
                                                </div>
                                                <div class="card-img-overlay"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <a class="carousel-control-prev bg-transparent w-aut" href="#recipeCarousel" role="button" data-bs-slide="prev" style="width: 7%;">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                </a>
                                <a class="carousel-control-next bg-transparent w-aut" href="#recipeCarousel" role="button" data-bs-slide="next" style="width: 7%;">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                </a>
                            </div>
                        </div>		
                    </div>
                </div>
                <br>
                <div class="topProduct">
                    <p style="box-shadow: #FFF 0 -1px 4px, #ff0 0 -2px 10px, #ff8000 0 -10px 20px, red 0 -15px 40px, 5px 5px 15px 5px rgba(0,0,0,0); width: 15%; font-size: large;font-family: 'Nanum Pen Script', cursive; font-weight: 800; text-align: center; color: red; border-radius: 5px; background-color: #fff;">Top Product</p>
                    <div class="container itemlist" style="width: 75%;">
                        <div class="row" style="margin-bottom: 20px;">
                            <div class="col-md-4 col-sm-12">
                                <a href="./product/detail.html">
                                    <div class="card" style="width: auto;">
                                        <img src="./resources/images/topProduct/topProduct1.jpg" class="card-img-top">
                                        <div class="card-body">
                                            <h6 class="card-title"><b>[1+1] 랑콤 블랑 엑스퍼트 더블 앰플 30ml</b></h6>
                                            <p class="card-text"><small><s>소비자가 120,000원</s></small> <br><b>88,000원</b></p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4 col-sm-12">
                                <a href="./product/detail.html">
                                    <div class="card" style="width: auto;">
                                        <img src="./resources/images/topProduct/topProduct2.jpg" class="card-img-top">
                                        <div class="card-body">
                                            <h6 class="card-title"><b>구찌 뱀부 오드 퍼퓸 스프레이 50ml</b></h6>
                                            <p class="card-text"><small><s>소비자가 122,000원</s></small> <br><b>115,000원</b></p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4 col-sm-12">
                                <a href="./product/detail.html">
                                    <div class="card" style="width: auto;">
                                        <img src="./resources/images/topProduct/topProduct3.jpg" class="card-img-top">
                                        <div class="card-body">
                                            <h6 class="card-title"><b>샤넬 루쥬 알뤼르 잉크 립컬러-148 libere 6ml</b></h6>
                                            <p class="card-text"><small><s>소비자가 76,000원</s></small> <br><b>71,800원</b></p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-sm-12 ">
                                <a href="./product/detail.html">
                                    <div class="card" style="width: auto;">
                                        <img src="./resources/images/topProduct/topProduct4.jpg" class="card-img-top">
                                        <div class="card-body">
                                            <h6 class="card-title"><b>입생로랑 루쥬 쀠르 꾸뛰르 - 49 트로피칼 핑크 3.8g</b></h6>
                                            <p class="card-text"><small><s>소비자가 55,500원</s></small> <br><b>49,700원</b></p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4 col-sm-12">
                                <a href="./product/detail.html">
                                    <div class="card" style="width: auto;">
                                        <img src="./resources/images/topProduct/topProduct5.jpg" class="card-img-top">
                                        <div class="card-body">
                                            <h6 class="card-title"><b>몽블랑 스타워커 오드 뜨왈렛 스프레이 75ml</b></h6>
                                            <p class="card-text"><small><s>소비자가 66,000원</s></small> <br><b>62,000원</b></p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4 col-sm-12">
                                <a href="./product/detail.html">
                                    <div class="card" style="width: auto;">
                                        <img src="./resources/images/topProduct/topProduct6.jpg" class="card-img-top">
                                        <div class="card-body">
                                            <h6 class="card-title"><b>비오템 블루 테라피 엑셀레이티드 세럼 50ml</b></h6>
                                            <p class="card-text"><small><s>소비자가 127,000원</s></small> <br><b>119,000원</b></p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <br><br>
                <div class="main_last" style="display: flex; justify-content: space-around;">
                    <div id="main_notice">
                        <p>공지사항</p>
                        <div>
                            <p>
                                <a href="/notice/list.do?currentPage=1">* 금일 로그인 오류 관련</a> <br>
                                <a href="/notice/list.do?currentPage=1">* 입금자를 찾습니다(성함 OOO)</a> <br>
                                <a href="/notice/list.do?currentPage=1">* 5월 사업자 회원가입 이벤트</a>
                            </p>
                        </div>
                    </div>
                    <div id="main_QA">
                        <p>Q&A</p>
                        <div>
                            <p>
                                <a href="./member/common/QndA.html">* 배송 문의 드립니다.</a> <br>
                                <a href="./member/common/QndA.html">* 주문 후 배송까지 몇일 걸리나요?</a> <br>
                                <a href="./member/common/QndA.html">* 구매 후 수량 변경 할 수 있나요?</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div id="main_right">
                <div>
                    <table>
                        <tr><th>최근 본 상품</th></tr>
                        <tr><td><a href="./product/detail.html"><img src="./resources/images/main/sidebar_recent1.jpg" alt=""></a><p class="arrow_box">조말론 와일드 블루벨 코롱 30ml<br><br>39,900원</p></td></tr>
                        <tr><td><a href="./product/detail.html"><img src="./resources/images/main/sidebar_recent2.jpg" alt=""></a><p class="arrow_box">비오템 옴므 아쿠아파워 클렌저 125ml<br><br>15,900원</p></td></tr>
                        <tr><td><a href="./product/detail.html"><img src="./resources/images/main/sidebar_recent3.jpg" alt=""></a><p class="arrow_box">구찌 길티 뿌르 옴므 오드 뜨왈렛 스프레이 50ml<br><br>106,900원</p></td></tr>
                    </table>
                    <button id="toTheTop" style="font-weight: bold; background-color: #2e95e9; color: white;">top  <i class="fa-solid fa-arrow-up"></i></button>
                </div>
            </div>
        </main>
        <footer class="navbar navbar-expand-lg">
            <div id="footer" class= "container-fluid">
                <div class="logo">
                    <a href="#"><img src="./resources/images/main/logo.PNG" alt=""></a>
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
                        <li><a href="/admin/companyIntro.do">회사소개</a></li>
                        <li><a href="/admin/companyHistory.do">회사연혁</a></li>
                        <li><a href="">이용약관</a></li>
                        <li><a href="">개인정보취급방침</a></li>
                    </ul>
                </div>
            </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <script>
            function navSearch() {
                if(document.querySelector("#nav2 input").value != "") {
                    location.href="./product/list.html";
                }
            }

            var items = document.querySelectorAll('.popularBrand .carousel .carousel-item')
                items.forEach((el) => {
                    var minPerSlide = 4
                    var next = el.nextElementSibling
                    for (var i = 1; i < minPerSlide; i++) {
                        if (!next) {
                            next = items[0]
                        }
                        var cloneChild = next.cloneNode(true)
                        el.appendChild(cloneChild.children[0])
                        next = next.nextElementSibling
                    }
                })
            document.querySelector("#toTheTop").addEventListener("click", function() {
                document.documentElement.scrollTop = 0;
            })
        </script>
    </body>
</html>