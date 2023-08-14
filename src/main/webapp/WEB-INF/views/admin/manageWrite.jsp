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
        <link rel="stylesheet" href="../resources/css/22.manager_write.css">
        <title>Manager_Write</title>
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
                        <td><a href="/admin/manageProduct.do">상품관리</a></td>
                    </tr>
                    <tr>
                        <td style="background-color: white;"><a href="/admin/manageWrite.do">게시판관리</a></td>
                    </tr>
                </table>
            </div>
            <div id="main_middle">
                <h2><b>게시판 관리</b></h2>
                <hr>
                <div class="search">
                    <select id="" style="width: 20%;" onchange="findType(this.value);">
                        <option value="all">전체</option>
                        <option value="notice">공지사항</option>
                        <option value="freeBoard">자유게시판</option>
                        <option value="QandA">Q&A</option>
                    </select>
                    <span>
                        <input type="text" id="" placeholder="제목 또는 작성자를 입력해주세요" style="width: 250px;">
                        <button id="findName" onclick="findName();"><i class="fa-solid fa-magnifying-glass" style="color: blue;"></i></button>
                    </span>
                    <button onclick="javascript:location.href='../member/common/write.html'">공지사항 등록</button>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>유형</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="no1" class="notice">
                            <td>공지사항</td>
                            <td>25일 새벽 3시경 로그인 오류 안내</td>
                            <td style="color: rgb(28, 161, 28); font-weight: bold;">관리자</td>
                            <td>2023-05-25</td>
                            <td><button class="out" onclick="out(no1);">삭제</button></td>
                        </tr>
                        <tr id="no2" class="freeBoard">
                            <td>자유게시판</td>
                            <td>후기) 랑콤 비 파씰</td>
                            <td>KH02</td>
                            <td>2023-05-24</td>
                            <td><button class="out" onclick="out(no2);">삭제</button></td>
                        </tr>
                        <tr id="no3" class="notice">
                            <td>공지사항</td>
                            <td>6월 할인행사 제품</td>
                            <td style="color: rgb(28, 161, 28); font-weight: bold;">관리자</td>
                            <td>2023-05-24</td>
                            <td><button class="out" onclick="out(no3);">삭제</button></td>
                        </tr>
                        <tr id="no4" class="QandA">
                            <td>Q&A</td>
                            <td>배송 지연 관련 문의</td>
                            <td>jys</td>
                            <td>2023-05-23</td>
                            <td><button class="out" onclick="out(no4);">삭제</button></td>
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
            function findType(value) {
                const tr = document.querySelectorAll("#main_middle tbody tr");
                for(var i = tr.length-1; i >= 0; i--) {
                        if(tr[i].className != value) {
                            tr[i].remove();
                        }
                    }
            }

            function findName() {
                const inputVal = document.querySelector(".search input").value;
                const tr = document.querySelectorAll("#main_middle tbody tr");
                for(var i = 0; i < tr.length; i++) {
                    if(!tr[i].childNodes[3].innerText.includes(inputVal) && !tr[i].childNodes[5].innerText.includes(inputVal)) {
                        tr[i].remove();
                    }
                }
            }

            function out(value) { 
                const type = value.childNodes[1].innerText;
                const id = value.childNodes[5].innerText;

                const final = confirm(type + "\n" + id + " 님의 글을 삭제하시겠습니까?");
                if(final) {
                    value.remove();
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </body>
</html>