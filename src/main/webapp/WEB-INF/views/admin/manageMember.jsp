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
        <link rel="stylesheet" href="../resources/css/20.manager_member.css">
        <title>Manager_Member</title>
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
                        <td style="background-color: white;"><a href="/admin/manageMember.do">회원관리</a></td>
                    </tr>
                    <tr>
                        <td><a href="/admin/manageProduct.do">상품관리</a></td>
                    </tr>
                    <tr>
                        <td><a href="/admin/manageWrite.do">게시판관리</a></td>
                    </tr>
                </table>
            </div>
            <div id="main_middle">
                <h2><b>회원 관리</b></h2>
                <hr>
                <div class="search">
                    <select id="" style="width: 20%;" onchange="findType(this.value);">
                        <option value="all">전체</option>
                        <option value="seller">사업자</option>
                        <option value="buyer">일반</option>
                    </select>
                    <span>
                        <input type="text" id="" placeholder="이름/상호명을 입력해주세요" style="width: 250px;">
                        <button id="findName" onclick="findName();"><i class="fa-solid fa-magnifying-glass" style="color: blue;"></i></button>
                    </span>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>유형</th>
                            <th>아이디</th>
                            <th>이름/상호명</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="no111">
                            <td>111</td>
                            <td>일반</td>
                            <td>jystwo</td>
                            <td>신짱구</td>
                            <td><button class="out" onclick="out(no111);">탈퇴처리</button></td>
                        </tr>
                        <tr id="no110" style="background-color: rgb(184, 113, 184);">
                            <td>110</td>
                            <td>사업자</td>
                            <td>country12</td>
                            <td>주식회사 화장품나라</td>
                            <td><button class="out" onclick="out(no110);">탈퇴처리</button></td>
                        </tr>
                        <tr id="no109" style="background-color: rgb(184, 113, 184);">
                            <td>109</td>
                            <td>사업자</td>
                            <td>cos</td>
                            <td>(주) 코스메틱</td>
                            <td><button class="out" onclick="out(no109);">탈퇴처리</button></td>
                        </tr>
                        <tr id="no108">
                            <td>108</td>
                            <td>일반</td>
                            <td>gildong</td>
                            <td>홍길동</td>
                            <td><button class="out" onclick="out(no108);">탈퇴처리</button></td>
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
                if(value == "buyer") {
                    for(var i = tr.length-1; i >= 0; i--) {
                        if(tr[i].childNodes[3].innerText == "사업자") {
                            tr[i].remove();
                        }
                    }
                } else if(value == "seller") {
                    for(var i = tr.length-1; i >= 0; i--) {
                        if(tr[i].childNodes[3].innerText == "일반") {
                            tr[i].remove();
                        }
                    }
                }
            }

            function findName() {
                const inputVal = document.querySelector(".search input").value;
                const tr = document.querySelectorAll("#main_middle tbody tr");
                for(var i = 0; i < tr.length; i++) {
                    if(!tr[i].childNodes[7].innerText.includes(inputVal)) {
                        tr[i].remove();
                    }
                }
            }

            function out(value) { 
                const type = value.childNodes[3].innerText;
                const id = value.childNodes[5].innerText;
                const name = value.childNodes[7].innerText;

                const final = confirm(type + "\n" + id + "/" + name + "\n탈퇴처리 하시겠습니까?");
                if(final) {
                    value.remove();
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </body>
</html>