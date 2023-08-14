<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <link rel="stylesheet" href="../../resources/css/4.myPage.css">
        <title>MyPage_info</title>
    </head>
    <body>
    	<c:if test="${memberType eq null }"><jsp:forward page="/memberInfo/login.do"/></c:if>
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
                        <td style="background-color: white;"><a href="/member/myInfo.do?memberId=${memberId}&memberType=${memberType}">회원정보</a></td>
                    </tr>
                    <c:if test="${memberType eq 'buyer' }">
	                    <tr>
	                        <td><a href="/buyer/orderHistory.do">주문내역</a></td>
	                    </tr>
	                    <tr>
	                        <td><a href="/buyer/actHistory.do">내 활동내역</a></td>
	                    </tr>
                    </c:if>
                    <c:if test="${memberType eq 'seller' }">
	                    <tr>
	                        <td><a href="/seller/manageProduct.do">상품관리</a></td>
	                    </tr>
	                    <tr>
	                        <td><a href="/seller/addProduct.do">상품등록</a></td>
	                    </tr>
	                    <tr>
	                        <td><a href="/seller/manageOrderDelivery.do">주문/발송 관리</a></td>
	                    </tr>
                    </c:if>
                    <tr>
                        <td><a href="/member/delete.do">회원탈퇴</a></td>
                    </tr>
                </table>
            </div>
            <div id="main_middle">
            	
                <h2><b>회원정보</b></h2>
                <hr>
                <div class="changeForm">
                    <form action="/member/update.do" method="post" onsubmit="return finalCheck();">
                    <input type="hidden" name="memberId" value="${memberId }">
                    <input type="hidden" name="memberType" value="${memberType }">
                        <ul>
                            <li>
                                <label>아이디</label>
                                <input type="text" id="user_id" name="memberId" value="${member.memberId }" disabled>
                            </li>
                            <li>
                                <label>현재 비밀번호</label>
                                <input type="password" id="user_pw_now" name="memberPw" required>
                                <label class="valid"></label>
                            </li>
                            <li>
                                <label>변경 비밀번호</label>
                                <input type="password" id="user_pw_new" name="memberPwNew" required>
                                <label class="valid"></label>
                            </li>
                            <li>
                                <label>변경 비밀번호 확인</label>
                                <input type="password" id="user_pw_new_check" name="memberPwNewCheck" required>
                                <label class="valid" style="color: red; font-weight: bold;"></label>
                            </li>
                            <li>
                                <label>이메일</label>
                                <input type="email" id="user_email" name="memberEmail" required value="${member.memberEmail }">
                                <label class="valid"></label>
                            </li>
                            <li>
                                <label>휴대폰 번호</label>
                                <input type="tel" id="user_phone" name="memberPhone" required value="${member.memberPhone }">
                                <label class="valid"></label>
                            </li>
                            <li>
                                <label>주소</label>
                                <input type="text" id="user_postcode" name="memberPostcode" placeholder="우편번호" required style="width: 100px;" value="${member.memberPostcode }">
                                <label class="valid"></label>
                                <input type="button" onclick="execDaumPostcode()" value="우편번호"><br><br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="text" id="user_address" name="memberAddress" placeholder="주소" required style="width: 50%;" value="${member.memberAddress }">
                                <label class="valid"></label><br><br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="text" id="user_detailAddress" name="memberAddressDetail" placeholder="상세주소" required value="${member.memberAddressDetail }">
                                <label class="valid"></label>
                            </li>
                            <c:if test="${memberType eq 'seller' }">
                            	<li>
                                    <label for="seller_accountNo">계좌번호</label>
                                    <select id="select_bank" name="memberBank">
                                        <option value="kookmin" ${member.memberBank == 'kookmin' ? 'selected="selected"' : ''}>국민</option>
                                        <option value="shinhan" ${member.memberBank == 'shinhan' ? 'selected="selected"' : ''}>신한</option>
                                        <option value="kakao" ${member.memberBank == 'kakao' ? 'selected="selected"' : ''}>카카오뱅크</option>
                                        <option value="woori" ${member.memberBank == 'woori' ? 'selected="selected"' : ''}>우리</option>
                                        <option value="hana" ${member.memberBank == 'hana' ? 'selected="selected"' : ''}>하나</option>
                                        <option value="nonghyup" ${member.memberBank == 'nonghyup' ? 'selected="selected"' : ''}>농협</option>
                                        <option value="industrial" ${member.memberBank == 'industrial' ? 'selected="selected"' : ''}>기업</option>
                                    </select><br>
                                    <label class="selectBank valid"></label>
                                    <input type="text" id="seller_accountNo" name="memberAccount" value="${member.memberAccount }" required>
                                    <label class="valid"></label>
                                </li>
                            </c:if>
                        </ul>
                        <br><br>
                        <button type="submit"><i class="fa-solid fa-shoe-prints fa-fade fa-lg"></i>
                            &nbsp;&nbsp;&nbsp;회원정보 <br>&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-shoe-prints fa-fade fa-lg"></i>&nbsp;&nbsp; 수정</button>
                    </form>
                </div>
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
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
            
            function finalCheck() {
                const pw = document.querySelector("#user_pw_new")
                const pw2 = document.querySelector("#user_pw_new_check")
                if(pw.value == pw2.value) {
                    return true;
                } else {
                    pw2.nextSibling.nextSibling.innerText = "비밀번호 불일치";
                    return false;
                }
            }

            function execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        
                        var addr = ''; // 주소 변수

                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }
                        
                        document.getElementById('user_postcode').value = data.zonecode;
                        document.getElementById("user_address").value = addr;
                        document.getElementById("user_detailAddress").focus();
                    }
                }).open();
            }
            
            document.querySelector("#toTheTop").addEventListener("click", function() {
                document.documentElement.scrollTop = 0;
            })
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </body>
</html>