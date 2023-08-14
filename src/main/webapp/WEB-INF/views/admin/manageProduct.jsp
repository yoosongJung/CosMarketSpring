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
        <link rel="stylesheet" href="../resources/css/reset.css">
        <link rel="stylesheet" href="../resources/css/1.main.css">
        <link rel="stylesheet" href="../resources/css/21.manager_product.css">
        <title>Manager_Product</title>
    </head>
    <body>
        <header class="sticky-top navbar navbar-expand-lg" style="padding-top: 0px;">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
        </header>
        <main>
            <div id="main_left">
                <table>
                    <tr>
                        <th>관리자 페이지</th>
                    </tr>
                    <tr>
                        <td><a href="/admin/sellerRecognize.do">사업자 가입승인</a></td>
                    </tr>
                    <tr>
                        <td><a href="/admin/manageMember.do">회원관리</a></td>
                    </tr>
                    <tr>
                        <td style="background-color: white;"><a href="/admin/manageProduct.do">상품관리</a></td>
                    </tr>
                    <tr>
                        <td><a href="/admin/manageWrite.do">게시판관리</a></td>
                    </tr>
                </table>
            </div>
            <div id="main_middle">
                <h2><b>상품 관리</b></h2>
                <hr>
                <span class="search">
                    <input type="text" id="" placeholder="상호명을 입력해주세요" style="width: 250px;">
                    <button id="findName" onclick="findName();"><i class="fa-solid fa-magnifying-glass" style="color: blue;"></i></button>
                </span>
                <table>
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>상품명</th>
                            <th>가격</th>
                            <th>판매상태</th>
                            <th>재고</th>
                            <th>상호명</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="no214">
                            <td>214</td>
                            <td>내추럴 뷰티 에센셜 오일 100ml</td>
                            <td>27,000</td>
                            <td>판매중</td>
                            <td>997</td>
                            <td>(주) 화장품나라</td>
                            <td><button onclick="out(no214);">삭제</button></td>
                        </tr>
                        <tr id="no213">
                            <td>213</td>
                            <td>타차 더 실크 크림 50ml</td>
                            <td>35,000</td>
                            <td>판매중</td>
                            <td>81</td>
                            <td>(주) 화장품나라</td>
                            <td><button onclick="out(no213);">삭제</button></td>
                        </tr>
                        <tr id="no212">
                            <td>212</td>
                            <td>조르지오 아르마니 마이웨이 플로럴 오 드 퍼퓸 리필 150ml</td>
                            <td>56,000</td>
                            <td>품절</td>
                            <td>-</td>
                            <td>아르마니 직영점</td>
                            <td><button onclick="out(no212);">삭제</button></td>
                        </tr>
                        <tr id="no211">
                            <td>211</td>
                            <td>샤넬 루쥬 알뤼르 렉스트레 립스틱 - 812 베이지 brut 2g</td>
                            <td>72,800</td>
                            <td>판매중</td>
                            <td>157</td>
                            <td>샤넬공식판매처</td>
                            <td><button onclick="out(no211);">삭제</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="main_right">
                
            </div>
        </main>
        <footer class="navbar navbar-expand-lg">
            <div id="footer" class= "container-fluid">
                <div class="logo">
                    <a href="#"><img src="../resources/images/main/logo.PNG" alt=""></a>
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
        <script>
            function findName() {
                const inputVal = document.querySelector(".search input").value;
                const tr = document.querySelectorAll("#main_middle tbody tr");
                for(var i = 0; i < tr.length; i++) {
                    if(!tr[i].childNodes[11].innerText.includes(inputVal)) {
                        tr[i].remove();
                    }
                }
            }

            function out(value) { console.log(value);
                const name = value.childNodes[11].innerText;
                const pName = value.childNodes[3].innerText;

                const final = confirm(name + "\n" + pName + "\n상품을 삭제하시겠습니까?");
                if(final) {
                    value.remove();
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </body>
</html>