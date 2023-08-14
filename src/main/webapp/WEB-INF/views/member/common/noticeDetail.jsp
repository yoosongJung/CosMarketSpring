<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../../resources/css/1.main.css">
        <link rel="stylesheet" href="../../resources/css/6.notice.css">
         <link href="${pageContext.request.contextPath}/resources/css/14.QandADetail.css" rel="stylesheet" type="text/css">
         <link href="${pageContext.request.contextPath}/resources/css/6.notice.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="../../resources/css/reset.css">
        <script src="https://kit.fontawesome.com/dbb376a4c5.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <title>NoticeDetail</title>
        <style>
        	.titlePassword input {
        		text-align : center;
        		margin-right : 40px;
        	}
        	#noticeDetailBlock {
        		width: 80%;
        		margin : 0 auto;
        	}
        </style>
	</head>
	<body>
		<header class="sticky-top navbar navbar-expand-lg" style="padding-top: 0px;">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
        </header>
        <main>
        	<div id="main_left"></div>
	        <div id="main_middle">
					<label class="back"><a href="javascript:history.back();"><i class="fa-solid fa-arrow-rotate-left"></i>목록으로</a></label>
					<h2><b>공지사항 상세</b></h2>
					<hr>
	        	<div id="noticeDetailBlock">
					<div class="titlePassword">
	                    <label>&nbsp;글번호 &nbsp;</label>
	                    <input type="text" style="width: 5%;" value=${requestScope.notice.noticeNo } readonly>
	                    <label>제목</label>
	                    <input type="text" style="width: 25%;" value=${notice.noticeSubject } readonly>
	                    <label>글쓴이</label>
	                    <input type="text" style="width: 10%;" value=${notice.noticeWriter } readonly>
	                    <label>작성일</label>
	                    <input type="text" style="width: 100px;" value=${notice.noticeDate } readonly>
	                </div>
	                    <br>
						<p>${notice.noticeContent }</p>
					<div class="modify">
	                        <label>
	                            <button onclick="javascript: location.href='/notice/modify.do?noticeNo=${notice.noticeNo }'"><i class="fa-solid fa-pen-to-square"></i>글 수정</button>
	                            <button onclick="deleteCheck();"><i class="fa-solid fa-trash"></i>글 삭제</button>
	                        </label>
	               	</div>
               	</div>
			</div>
			<div id="main_right"></div>
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
		const deleteCheck = () => {
			/* const noticeNo = '${notice.noticeNo}'; */
			if(confirm("삭제 하시겠습니까?")){
				location.href = "/notice/delete.do?noticeNo=${notice.noticeNo }";
			}
		}
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>