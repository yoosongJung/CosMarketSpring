<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/1.main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/3.login.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
        <script src="https://kit.fontawesome.com/dbb376a4c5.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <title>로그인</title>
    </head>
    <body>
        <header class="sticky-top navbar navbar-expand-lg" style="padding-top: 0px;">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
        </header>
        <main>
            <div id="main_left">

            </div>
            <div id="main_middle">
                <div class="container login-container">
                    <div class="row">
                        <div class="col-md-6 login-form-1">
                            <h3>일반회원 로그인</h3>
                            <form action="/memberInfo/login.do" method="post">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="memberId" placeholder="아이디" required value="" />
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="memberPw" placeholder="비밀번호" required value="" />
                                </div>
                                <div class="form-group">
                                	<input type="hidden" name="memberType" value="buyer">
                                    <input type="submit" class="btnSubmit" value="Login" />
                                </div>
                                <div class="form-group">
                                    <a href="./findIdPw.html" class="ForgetPwd">ID/PW 찾기</a><br><br>
                                    <a href="/memberInfo/register.do" class="ForgetPwd">회원가입</a>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-6 login-form-2">
                            <h3>사업자회원 로그인</h3>
                            <form action="/memberInfo/login.do" method="post">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="memberId" placeholder="아이디" required value="" />
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="memberPw" placeholder="비밀번호"required value="" />
                                </div>
                                <div class="form-group">
                                	<input type="hidden" name="memberType" value="seller">
                                    <input type="submit" class="btnSubmit" value="Login" />
                                </div>
                                <div class="form-group">
        
                                    <a href="./findIdPw.html" class="ForgetPwd" value="Login">ID/PW 찾기</a><br><br>
                                    <a href="/memberInfo/register.do" class="ForgetPwd" value="Login">회원가입</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="ad">
                    <a href="http://www.kh-academy.co.kr"><img src="../resources/images/ad.png" alt="광고문의"></a>
                    <i class="fa-solid fa-rectangle-ad"></i>
                </div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </body>
</html>