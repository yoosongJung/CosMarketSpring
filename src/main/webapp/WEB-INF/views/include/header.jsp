<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<div class="logo">
                <a class="navbar-brand" href="../index.jsp"><img src="../resources/images/main/logo.PNG" alt=""></a>
            </div>
            <div id="nav" class="container-fluid">
                <div id="nav2">
                    <input type="text" placeholder="Search">
                    <button id="navSearch" onclick="navSearch();"><i class="fa-solid fa-magnifying-glass" style="color: #f7f7f7;"></i></button>
                </div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
						<c:if test="${memberType eq null }">
                        <li class="nav-item" style="margin-top: 13px;"><a href="/memberInfo/register.do">회원가입</a></li>
                        <li class="nav-item" style="margin-top: 13px;"><a href="/memberInfo/login.do">로그인</a></li>
                        <li class="nav-item" style="margin-top: 13px;"><a href="/member/myInfo.do?memberId=${memberId}&memberType=${memberType}">마이페이지</a></li>
                        <li class="nav-item" style="margin-top: 13px;"><a href="./member/common/premium.html">프리미엄</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                게시판
                            </a>
                            <ul class="dropdown-menu" style="background-color: skyblue;">
                                <li><a class="dropdown-item" href="/notice/list.do?currentPage=1">공지사항</a></li>
                                <li><a class="dropdown-item" href="./member/common/QndA.html">Q&A</a></li>
                                <li><a class="dropdown-item" href="./member/common/freeBoard.html">자유게시판</a></li>
                            </ul>
                        </li>
                        <li class="nav-item" style="margin-top: 13px;"><a href="/buyer/shoppingBasket.do">장바구니</a></li>
                        </c:if>
                        <c:if test="${memberType eq 'buyer' and memberId eq 'admin' }">
                        <li class="nav-item" style="margin-top: 13px;"><a href="#">${memberName }님</a></li>
                        <li class="nav-item" style="margin-top: 13px;"><a href="/memberInfo/logout.do">로그아웃</a></li>
                        <li class="nav-item" style="margin-top: 13px;"><a href="/admin/sellerRecognize.do">관리페이지</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                게시판
                            </a>
                            <ul class="dropdown-menu" style="background-color: skyblue;">
                                <li><a class="dropdown-item" href="/notice/list.do?currentPage=1">공지사항</a></li>
                                <li><a class="dropdown-item" href="./member/common/QndA.html">Q&A</a></li>
                                <li><a class="dropdown-item" href="./member/common/freeBoard.html">자유게시판</a></li>
                            </ul>
                        </li>
                        </c:if>
                        <c:if test="${memberType eq 'buyer' and memberId ne 'admin' }">
                        <li class="nav-item" style="margin-top: 13px;"><a href="#">${memberName }님</a></li>
                        <li class="nav-item" style="margin-top: 13px;"><a href="/memberInfo/logout.do">로그아웃</a></li>
                        <li class="nav-item" style="margin-top: 13px;"><a href="/member/myInfo.do?memberId=${memberId}&memberType=${memberType}">마이페이지</a></li>
                        <li class="nav-item" style="margin-top: 13px;"><a href="./member/common/premium.html">프리미엄</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                게시판
                            </a>
                            <ul class="dropdown-menu" style="background-color: skyblue;">
                                <li><a class="dropdown-item" href="/notice/list.do?currentPage=1">공지사항</a></li>
                                <li><a class="dropdown-item" href="./member/common/QndA.html">Q&A</a></li>
                                <li><a class="dropdown-item" href="./member/common/freeBoard.html">자유게시판</a></li>
                            </ul>
                        </li>
                        <li class="nav-item" style="margin-top: 13px;"><a href="/buyer/shoppingBasket.do">장바구니</a></li>
                        </c:if>
                        <c:if test="${memberType eq 'seller' }">
                        <li class="nav-item" style="margin-top: 13px;"><a href="#">${memberName }님</a></li>
                        <li class="nav-item" style="margin-top: 13px;"><a href="/memberInfo/logout.do">로그아웃</a></li>
                        <li class="nav-item" style="margin-top: 13px;"><a href="/member/myInfo.do?memberId=${memberId}&memberType=${memberType}">마이페이지</a></li>
                        <li class="nav-item" style="margin-top: 13px;"><a href="./member/common/premium.html">프리미엄</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                게시판
                            </a>
                            <ul class="dropdown-menu" style="background-color: skyblue;">
                                <li><a class="dropdown-item" href="/notice/list.do?currentPage=1">공지사항</a></li>
                                <li><a class="dropdown-item" href="./member/common/QndA.html">Q&A</a></li>
                                <li><a class="dropdown-item" href="./member/common/freeBoard.html">자유게시판</a></li>
                            </ul>
                        </li>
                        </c:if>
                    </ul>
                </div>
            </div>