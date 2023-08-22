<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../resources/css/1.main.css">
        <link rel="stylesheet" href="../resources/css/2.register.css?after">
        <link rel="stylesheet" href="../resources/css/reset.css">
        <script src="https://kit.fontawesome.com/dbb376a4c5.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <title>회원가입</title>
    </head>
    <body>
        <header class="sticky-top navbar navbar-expand-lg" style="padding-top: 0px;">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
        </header>
        <main style="margin-top: 5rem;">
            <div id="main_left">

            </div>
            <div id="main_middle">
                <h2><b>회원가입</b></h2>
                <button class="buyerRegister" onclick="buyerRegister();">일반 회원가입</button>
                <button class="sellerRegister" onclick="sellerRegister();">사업자 회원가입</button>
                <hr>
                <div class="form">
                    <div id="buyer" class="container" style="display:block">
                        <form action="/memberInfo/registerBuyer.do" method="post" onsubmit="return buyerCheckAdditional();">
                            <ul>
                                <li style="display: flex; justify-content: center;">
                                    <label style="font-size: xx-large;">일반 회원가입</label>
                                </li>
                                <li>
                                    <label for="buyer_name">이름</label>
                                    <input type="text" id="buyer_name" name="memberName" required>
                                    <label class="valid"></label>
                                </li>
                                <li>
                                    <label for="buyer_id">아이디</label>
                                    <input type="text" id="buyer_id" name="memberId" required>
                                    <input type="button" value="중복 체크" class="buyerCheckSameId">
                                    <label class="buyerCheckId valid"></label>
                                </li>
                                <li>
                                    <label for="buyer_pw">비밀번호</label>
                                    <input type="password" id="buyer_pw" name="memberPw" required>
                                    <label class="valid"></label>
                                </li>
                                <li>
                                    <label for="buyer_pw_check">비밀번호 확인</label>
                                    <input type="password" id="buyer_pw_check" name="memberPwCheck" required>
                                    <label class="buyerCheckPw valid"></label>
                                </li>
                                <li>
                                    <label for="buyer_email">이메일</label>
                                    <input type="email" id="buyer_email" name="memberEmail" required>
                                    <label class="valid"></label>
                                </li>
                                <li>
                                    <label for="buyer_phone">휴대폰 번호</label>
                                    <input type="tel" id="buyer_phone" name="memberPhone" placeholder="예)01012341234" required>
                                    <label class="valid"></label>
                                </li>
                                <li>
                                    <label for="buyer_postcode">주소</label>
                                    <input type="text" id="buyer_postcode" name="memberPostcode" placeholder="우편번호" required style="width: 100px;">
                                    <label class="valid"></label>
                                    <input type="button" onclick="buyer_execDaumPostcode()" value="우편번호 찾기"><br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="text" id="buyer_address" name="memberAddress" placeholder="주소" required style="width: 85%;"><br><label class="valid"></label><br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="text" id="buyer_detailAddress" name="memberAddressDetail" placeholder="상세주소" required>
                                    <label class="valid"></label>
                                </li>
                            </ul>
                                                        
                            <br><br><br><br><br><br><br><br>
                            <input type="hidden" name="memberType" value="buyer">
                            <input type="submit" onclick="buyerValid();" value="일반 회원가입">
                        </form>
                    </div>
                    <div id="seller" class="container" style="display:none">
                        <form action="/memberInfo/registerSeller.do" method="post" onsubmit="return sellerCheckAdditional();">
                            <ul>
                                <li style="display: flex; justify-content: center;">
                                    <label style="font-size: xx-large;">사업자 회원가입</label>
                                </li>
                                <li>
                                    <label for="seller_no">사업자 등록 번호</label>
                                    <input type="text" id="seller_no" name="sellerNo" required>
                                    <input type="button" value="인증" class="checkSellerNo">
                                    <label class="sellerNo valid"></label>
                                </li>
                                <li>
                                    <label for="seller_name">상호명</label>
                                    <input type="text" id="seller_name" name="memberName" required>
                                    <label class="valid"></label>
                                </li>
                                <li>
                                    <label for="seller_accountNo">계좌번호</label>
                                    <select id="select_bank" name="memberBank">
                                        <option hidden="" disabled="disabled" selected="selected" value="">은행 선택</option>
                                        <option value="kookmin">국민</option>
                                        <option value="shinhan">신한</option>
                                        <option value="kakao">카카오뱅크</option>
                                        <option value="woori">우리</option>
                                        <option value="hana">하나</option>
                                        <option value="nonghyup">농협</option>
                                        <option value="industrial">기업</option>
                                    </select><br>
                                    <label class="selectBank valid"></label>
                                    <input type="text" id="seller_accountNo" name="memberAccount" required>
                                    <label class="valid"></label>
                                </li>
                                <li>
                                    <label for="seller_id">아이디</label>
                                    <input type="text" id="seller_id" name="memberId" required>
                                    <input type="button" value="중복 체크" class="sellerCheckSameId">
                                    <label class="sellerCheckId valid"></label>
                                </li>
                                <li>
                                    <label for="seller_pw">비밀번호</label>
                                    <input type="password" id="seller_pw" name="memberPw" required>
                                    <label class="valid"></label>
                                </li>
                                <li>
                                    <label for="seller_pw_check">비밀번호 확인</label>
                                    <input type="password" id="seller_pw_check" name="memberPwCheck" required>
                                    <label class="sellerCheckPw valid"></label>
                                </li>
                                <li>
                                    <label for="seller_email">이메일</label>
                                    <input type="email" id="seller_email" name="memberEmail" required>
                                    <label class="valid"></label>
                                </li>
                                <li>
                                    <label for="seller_phone">대표 번호</label>
                                    <input type="tel" id="seller_phone" name="memberPhone" placeholder="예)01012341234" required>
                                    <label class="valid"></label>
                                </li>
                                <li>
                                    <label for="seller_postcode">주소</label>
                                    <input type="text" id="seller_postcode" name="memberPostcode" placeholder="우편번호" required style="width: 100px;">
                                    <label class="valid"></label>
                                    <input type="button" onclick="seller_execDaumPostcode()" value="우편번호 찾기"><br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="text" id="seller_address" name="memberAddress" placeholder="주소" required style="width: 85%;"><br><label class="valid"></label><br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="text" id="seller_detailAddress" name="memberAddressDetail" placeholder="상세주소" required>
                                    <label class="valid"></label>
                                </li>
                            </ul>
                            <br>
                            <input type="hidden" name="memberType" value="seller">
                            <input type="submit" onclick="sellerValid();" value="사업자 회원가입">
                        </form>
                    </div>
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
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
            document.querySelector(".buyerCheckSameId").addEventListener("click", () => {
                const idVal = document.querySelector("#buyer_id");
                if(idVal.value == "") {
                    document.querySelector(".buyerCheckId").innerText = "아이디를 입력하세요";
                } else {
                	var data = {'memberId':idVal.value,'memberType':"buyer"};
                	$.ajax({
                        type : 'POST',
                        url : 'checkId.do',
                        data : data,
                        dataType : 'text',
                        success : function (data) {alert(data);
                            if(data == "false"){
                            	document.querySelector(".buyerCheckId").innerText = "사용 가능";
                            } else {
                            	document.querySelector(".buyerCheckId").innerText = "중복된 아이디입니다";
                            }
                            
                            }
                        });
                }
            })
            document.querySelector(".sellerCheckSameId").addEventListener("click", () => {
                const idVal = document.querySelector("#seller_id");
                if(idVal.value == "") {
                    document.querySelector(".sellerCheckId").innerText = "아이디를 입력하세요";
                } else {
                    document.querySelector(".sellerCheckId").innerText = "사용 가능";
                }
            })
            document.querySelector(".checkSellerNo").addEventListener("click", () => {
                const idVal = document.querySelector("#seller_no");
                if(idVal.value == "") {
                    document.querySelector(".sellerNo").innerText = "사업자 번호를 입력하세요";
                } else {
                    document.querySelector(".sellerNo").innerText = "등록가능한 사업자입니다";
                }
            })
			
            function buyerRegister() {
            	document.querySelector("#buyer").style.display = "block";
            	document.querySelector("#seller").style.display = "none";
            }
            
            function sellerRegister() {
            	document.querySelector("#buyer").style.display = "none";
            	document.querySelector("#seller").style.display = "block";
            }

            function buyerCheckAdditional() {
                if(document.querySelector(".buyerCheckPw").innerText == "일치" &&
                document.querySelector(".buyerCheckId").innerText == "사용 가능") {
                    return true;
                } else return false;
            }
            function sellerCheckAdditional() {
                if(document.querySelector(".sellerNo").innerText == "등록가능한 사업자입니다" &&
                document.querySelector(".sellerCheckId").innerText == "사용 가능" &&
                document.querySelector(".sellerCheckPw").innerText == "일치" &&
                document.querySelector("select").value != "") {
                    return true;
                } else return false;
            }

            function buyerValid() {
                const inputTag = document.querySelectorAll("#buyer input[required]");
                for(let i = 0; i < inputTag.length; i++) {
                    if(inputTag[i].value == "") {
                        switch(i) {
                            case 0: inputTag[i].nextSibling.nextSibling.innerText = "이름을 입력하세요.";
                                break;
                            case 1: document.querySelector(".buyerCheckId").innerText = "아이디를 입력하세요.";
                                break;
                            case 2: inputTag[i].nextSibling.nextSibling.innerText = "비밀번호를 입력하세요.";
                                break;
                            case 3: inputTag[i].nextSibling.nextSibling.innerText = "비밀번호를 입력하세요.";
                                break;
                            case 4: inputTag[i].nextSibling.nextSibling.innerText = "이메일을 입력하세요.";
                                break;
                            case 5: inputTag[i].nextSibling.nextSibling.innerText = "휴대폰번호를 입력하세요.";
                                break;
                            case 6: inputTag[i].nextSibling.nextSibling.innerText = "우편번호를 입력하세요.";
                                break;
                            case 7: inputTag[i].nextSibling.nextSibling.innerText = "주소를 입력하세요.";
                                break;
                            case 8: inputTag[i].nextSibling.nextSibling.innerText = "상세주소를 입력하세요.";
                                break;
                        }
                    } else {
                        inputTag[i].nextSibling.nextSibling.innerText = "";
                    }
                }

                if(inputTag[1].value != "" && document.querySelector(".buyerCheckId").innerText != "사용 가능") {
                    document.querySelector(".buyerCheckId").innerText = "중복체크하세요";
                }

                if(inputTag[2].value != "") {
                    if(inputTag[3].value != inputTag[2].value) {
                        document.querySelector(".buyerCheckPw").innerText = "불일치";
                    } else document.querySelector(".buyerCheckPw").innerText = "일치";
                }
                
            }

            function sellerValid() {
                const inputTag = document.querySelectorAll("#seller input[required]");console.log(inputTag);
                for(let i = 0; i < inputTag.length; i++) {
                    if(inputTag[i].value == "") {
                        switch(i) {
                            case 0: document.querySelector(".sellerNo").innerText = "사업자번호를 입력하세요.";
                                break;
                            case 1: inputTag[i].nextSibling.nextSibling.innerText = "상호명을 입력하세요.";
                                break;
                            case 2: inputTag[i].nextSibling.nextSibling.innerText = "계좌번호를 입력하세요.";
                                break;
                            case 3: document.querySelector(".sellerCheckId").innerText = "아이디를 입력하세요.";
                                break;
                            case 4: inputTag[i].nextSibling.nextSibling.innerText = "비밀번호를 입력하세요.";
                                break;
                            case 5: inputTag[i].nextSibling.nextSibling.innerText = "비밀번호를 입력하세요.";
                                break;
                            case 6: inputTag[i].nextSibling.nextSibling.innerText = "이메일을 입력하세요.";
                                break;
                            case 7: inputTag[i].nextSibling.nextSibling.innerText = "대표 번호를 입력하세요.";
                                break;
                            case 8: inputTag[i].nextSibling.nextSibling.innerText = "우편번호를 입력하세요.";
                                break;
                            case 9: inputTag[i].nextSibling.nextSibling.innerText = "주소를 입력하세요.";
                                break;
                            case 10: inputTag[i].nextSibling.nextSibling.innerText = "상세주소를 입력하세요.";
                                break;
                        }
                    } else {
                        if(i==0 && document.querySelector(".sellerNo").innerText != "등록가능한 사업자입니다") {
                            document.querySelector(".sellerNo").innerText = "";
                        } else inputTag[i].nextSibling.nextSibling.innerText = "";
                    }
                }

                if(document.querySelector("select").value == "") {
                    document.querySelector(".selectBank").innerText = "은행선택하세요";
                } else document.querySelector(".selectBank").innerText = "";

                if(inputTag[3].value != "" && document.querySelector(".sellerCheckId").innerText != "사용 가능") {
                    document.querySelector(".sellerCheckId").innerText = "중복체크하세요";
                }

                if(inputTag[0].value != "" && document.querySelector(".sellerNo").innerText != "등록가능한 사업자입니다") {
                    document.querySelector(".sellerNo").innerText = "인증하세요";
                }

                if(inputTag[4].value != "") {
                    if(inputTag[5].value != inputTag[4].value) {
                        document.querySelector(".sellerCheckPw").innerText = "불일치";
                    } else document.querySelector(".sellerCheckPw").innerText = "일치";
                }
                
            }

            function buyer_execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수

                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }
                        
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('buyer_postcode').value = data.zonecode;
                        document.getElementById("buyer_address").value = addr;
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById("buyer_detailAddress").focus();
                    }
                }).open();
            }
            function seller_execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        
                        var addr = ''; // 주소 변수

                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }
                        
                        document.getElementById('seller_postcode').value = data.zonecode;
                        document.getElementById("seller_address").value = addr;
                        document.getElementById("seller_detailAddress").focus();
                    }
                }).open();
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </body>
</html>