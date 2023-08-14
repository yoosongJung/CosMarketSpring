<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../resources/css/1.main.css">
        <link rel="stylesheet" href="../resources/css/reset.css">
        <script src="https://kit.fontawesome.com/dbb376a4c5.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="../resources/css/16.companyIntro.css">
        <title>CompanyIntro</title>
    </head>
    <body>
        <header class="sticky-top navbar navbar-expand-lg" style="padding-top: 0px;">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
        </header>
        <main>
            <div class="section" id="section1">
                <p class="p1">전세계의 다양한 화장품들을</p>
            </div>
            <div class="section" id="section2">
                <p class="p2">안전하고 빠르게 거래할 수 있는 곳</p>
            </div>
            <div class="section" id="section3">
                <p class="p3"><label>CosMarket</label>이 새로운 혁신입니다</p>
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
            window.onload = function(){
                const elm = document.querySelectorAll('.section');
                const elmCount = elm.length;
                elm.forEach(function(item, index){
                    item.addEventListener('mousewheel', function(event){
                    event.preventDefault();
                    let delta = 0;

                    if (!event) event = window.event;
                    if (event.wheelDelta) {
                        delta = event.wheelDelta / 120;
                        if (window.opera) delta = -delta;
                    } 
                    else if (event.detail)
                        delta = -event.detail / 3;

                    let moveTop = window.scrollY;
                    let elmSelector = elm[index];

                    // wheel down : move to next section
                    if (delta < 0){
                        if (elmSelector !== elmCount-1){
                        try{
                            moveTop = window.pageYOffset + elmSelector.nextElementSibling.getBoundingClientRect().top;
                        }catch(e){}
                        }
                    }
                    // wheel up : move to previous section
                    else{
                        if (elmSelector !== 0){
                        try{
                            moveTop = window.pageYOffset + elmSelector.previousElementSibling.getBoundingClientRect().top;
                        }catch(e){}
                        }
                    }

                    const body = document.querySelector('html');
                    window.scrollTo({top:moveTop, left:0, behavior:'smooth'});
                    });
                });
    }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </body>
</html>