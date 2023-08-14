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
        <link rel="stylesheet" href="../../resources/css/4_5.addProduct.css">
        <script src="../../resources/js/summernote/summernote-lite.js"></script>
        <script src="../../resources/js/summernote/lang/summernote-ko-KR.js"></script>
        <link rel="stylesheet" href="../../resources/js/summernote/summernote-lite.css">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
        <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
        <title>AddProduct</title>
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
                        <td style="background-color: white;"><a href="/seller/addProduct.do">상품등록</a></td>
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
                <h2><b>상품 등록</b></h2>
                <hr>
                <table>
                    <tr>
                        <th>카테고리 선택</th>
                        <td>
                            <select id="categories">
                                <option hidden="" disabled="disabled" selected="selected" value="">카테고리 선택</option>
                                <option value="">명품화장품</option>
                                <option value="">명품향수</option>
                                <option value="">국내화장품</option>
                                <option value="">맘&베이비</option>
                                <option value="">해외배송상품</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>상품명</th>
                        <td>
                            <input type="text" id="addPName">
                        </td>
                    </tr>
                    <tr>
                        <th>상품 이미지</th>
                        <td>
                            <div id="imgArea">

                            </div>
                            <input type="file" id="addPImg" onchange="loadFile(this);">
                        </td>
                    </tr>
                    <tr>
                        <th>판매 상태</th>
                        <td>
                            <input type="radio" class="btn-check" name="options-outlined" id="success-outlined" autocomplete="off" checked>
                            <label class="btn btn-outline-success" for="success-outlined">&nbsp;판매중&nbsp;</label>
                            &nbsp;&nbsp;
                            <input type="radio" class="btn-check" name="options-outlined" id="danger-outlined" autocomplete="off">
                            <label class="btn btn-outline-danger" for="danger-outlined">&nbsp;품절&nbsp;</label>
                        </td>
                    </tr>
                    <tr>
                        <th>판매가</th>
                        <td><input type="number" id="addPPrice">원</td>
                    </tr>
                    <tr>
                        <th>판매 재고</th>
                        <td><input type="number" id="addPPrice">개</td>
                    </tr>
                    <tr>
                        <th>상품 설명</th>
                        <td>
                            <div class="container">
                                <textarea class="summernote" name="content"></textarea>    
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>브랜드</th>
                        <td><input type="text" id="addBrand"></td>
                    </tr>
                    <tr>
                        <th>배송정보</th>
                        <td>
                            <input type="radio" id="select" name="delivery"><label for="select">&nbsp;택배&nbsp;</label>
                            <input type="radio" id="select2" name="delivery"><label for="select2">&nbsp;우편(소포/등기)&nbsp;</label>
                            <input type="radio" id="select3" name="delivery"><label for="select3">&nbsp;화물배달&nbsp;</label>
                        </td>
                    </tr>
                </table>
                <button class="addProduct success"><a href="/seller/manageProduct.do">등록하기</a></button>
                <button class="addProduct cancel"><a href="/seller/manageProduct.do">돌아가기</a></button>
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
                $(document).ready(function() {
                    $('.summernote').summernote({
                            height: 300,                 // set editor height
                            minHeight: null,             // set minimum height of editor
                            maxHeight: null,             // set maximum height of editor
                            focus: false                  // set focus to editable area after initializing summernote
                    });
                });


            function loadFile(input) {
                const container = document.querySelector("#imgArea");
                const file = input.files[0];
                const newImage = document.createElement("img");
                newImage.setAttribute("class", "img");
                newImage.src = URL.createObjectURL(file);
                newImage.style.width = "80%";
                newImage.style.height = "80%";
                newImage.style.objectFit = "contain";
                container.appendChild(newImage);
                
            }


            document.querySelector("#toTheTop").addEventListener("click", function() {
                document.documentElement.scrollTop = 0;
            })
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </body>
</html>