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
        <link rel="stylesheet" href="../resources/css/19.manager_recognize.css">
        <title>Manager_Recognize</title>
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
                        <td style="background-color: white;"><a href="/admin/sellerRecognize.do">사업자 가입승인</a></td>
                    </tr>
                    <tr>
                        <td><a href="/admin/manageMember.do">회원관리</a></td>
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
                <h2><b>사업자 가입 승인</b></h2>
                <hr>
                <table>
                    <tr>
                        <th>No.</th>
                        <th>아이디</th>
                        <th>사업자명</th>
                        <th>사업자번호</th>
                        <th></th>
                    </tr>
                    <tr id="no2">
                        <td>2</td>
                        <td>jystwo</td>
                        <td>비오템 본사직영</td>
                        <td>206-81-24367</td>
                        <td><button class="ok" onclick="ok(this.value);" value="no2">승인</button><button class="no" onclick="no(this.value)" value="no2">거절</button></td>
                    </tr>
                    <tr id="no1">
                        <td>1</td>
                        <td>shin20</td>
                        <td>주식회사 화장품나라</td>
                        <td>211-23-25683</td>
                        <td><button class="ok" onclick="ok(this.value);" value="no1">승인</button><button class="no" onclick="no(this.value)" value="no1">거절</button></td>
                    </tr>
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
            function ok(value) {
                const name = document.querySelector("#"+value).childNodes[5].innerText;
                const number = document.querySelector("#"+value).childNodes[7].innerText;

                const final = confirm(name + "\n" + number + "\n최종승인 하시겠습니까?");
                if(final) {
                    document.querySelector("#"+value).remove();
                }
            }

            function no(value) {
                const name = document.querySelector("#"+value).childNodes[5].innerText;
                const number = document.querySelector("#"+value).childNodes[7].innerText;

                const final = confirm(name + "\n" + number + "\n승인 거절 하시겠습니까?");
                if(final) {
                    document.querySelector("#"+value).remove();
                }
            }

            
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </body>
</html>