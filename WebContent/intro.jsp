<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
<%@ include file="include/include-header.jspf" %>
</head>
<body id="body" data-spy="scroll" data-target=".navbar" data-offset="50">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#body">MINI</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><b>회원가입</b></a></li>
        <li class="dropdown">
          <a id="loginBox" class="dropdown-toggle" data-toggle="dropdown" href="#"><b>로그인</b>
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><input type="text" id="memId" name="memId" class="form-control" placeholder="아이디"></li>
            <li><input type="password" id="memPwd" name="memPwd" class="form-control" placeholder="비밀번호"></li>
            <li class="text-center"><a href="#"><b id="btnLogin">로그인</b></a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="img/ny.jpg" alt="New York" width="1200" height="700">
        <div class="carousel-caption">
          <h3>당신의 모임도 글로벌 NO.1 모임앱 BAND로 시작하세요.</h3>
          <p><a href="#">이런 밴드 어때요? ></a></p>
        </div>      
      </div>

      <div class="item">
        <img src="img/chicago.jpg" alt="Chicago" width="1200" height="700">
        <div class="carousel-caption">
          <h3>Chicago</h3>
          <p>Thank you, Chicago - A night we won't forget.</p>
        </div>      
      </div>
    
      <div class="item">
        <img src="img/la.jpg" alt="Los Angeles" width="1200" height="700">
        <div class="carousel-caption">
          <h3>LA</h3>
          <p>Even though the traffic was a mess, we had the best time playing at Venice Beach!</p>
        </div>      
      </div>
      
      <div class="item">
        <img src="img/chicago.jpg" alt="Chicago" width="1200" height="700">
        <div class="carousel-caption">
          <h3>Chicago</h3>
          <p>Thank you, Chicago - A night we won't forget.</p>
        </div>      
      </div>
    
      <div class="item">
        <img src="img/la.jpg" alt="Los Angeles" width="1200" height="700">
        <div class="carousel-caption">
          <h3>LA</h3>
          <p>Even though the traffic was a mess, we had the best time playing at Venice Beach!</p>
        </div>      
      </div>
     
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>

<!-- Container (The Band Section) -->
<div id="band" class="container text-center">
  <h3><img src="img/intro_1.jpg"/></h3>
  <p><em>당신의 모임도 글로벌 NO.1 모임앱 BAND로 시작하세요.</em></p>
  <p><a href="#"><img src="img/btn_link.gif"/></a></p>
  <br>
  <div class="row">
  	<div class="col-sm-4">
      <p class="text-center"><strong>밴드 멤버들끼리</strong></p><br>
      밴드 멤버들끼리 우리만의 공간에서 더 다양한 이야기를 나눠보세요.
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>모임 계획부터 후기까지</strong></p><br>
      복잡한 모임 관리는 밴드에 맡기고, 함께 하는 즐거움을 만끽하세요.
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>어떤 모임도 OK!</strong></p><br>
      함께 하는 친구, 가족, 동료들과 밴드로 모여보세요.
      1,000명이 넘는 모임도 가능!
    </div>
  </div>
</div>


<!-- Footer -->
<footer class="text-center">
  <a class="up-arrow" href="#body" data-toggle="tooltip" title="TO TOP">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a><br><br>
  <p>
  	<a href="http://blog.naver.com/bandapp">블로그</a>&nbsp;&nbsp;&nbsp;
  	<a href="http://band.us/press">보도자료</a>&nbsp;&nbsp;&nbsp;
  	<a href="https://partners.band.us/partners/ko/main.nhn">파트너</a>&nbsp;&nbsp;&nbsp;
  	<a href="https://ad.band.us/ad/ko/main.nhn?deviceType=desktop">광고</a>&nbsp;&nbsp;&nbsp;
  	<a href="http://band.us/policy/terms">이용약관</a>&nbsp;&nbsp;&nbsp;
  	<a href="http://band.us/policy/privacy"><b>개인정보처리방침</b></a>&nbsp;&nbsp;&nbsp;
  	<a href="http://band.us/policy/youthpolicy">청소년 보호정책</a>&nbsp;&nbsp;&nbsp;
  	<a href="http://band.us/policy/operating">운영정책</a>&nbsp;&nbsp;&nbsp;
  	<a href="http://band.us/policy/usurpation">권리침해 신고안내</a>&nbsp;&nbsp;&nbsp;
  	<a href="https://developers.band.us/">개발자</a>&nbsp;&nbsp;&nbsp;
  	<a href="http://band.us/cs/#!/help">도움말</a>
  </p> 
</footer>

<script>
	$(document).ready(function(){
		// Initialize Tooltip
		$('[data-toggle="tooltip"]').tooltip(); 
		
		// Add smooth scrolling to all links in navbar + footer link
		$(".navbar a, footer a[href='#body']").on('click', function(event) {
		
		  // Make sure this.hash has a value before overriding default behavior
		  if (this.hash !== "") {
		
		    // Prevent default anchor click behavior
		    event.preventDefault();
		
		    // Store hash
		    var hash = this.hash;
		
		    // Using jQuery's animate() method to add smooth page scroll
		    // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
		    $('html, body').animate({
		      scrollTop: $(hash).offset().top
		    }, 900, function(){
		 
		      // Add hash (#) to URL when done scrolling (default click behavior)
		      window.location.hash = hash;
		    });
		  } // End if
		});
		
		$("#loginBox").click(function() {
		 $("#memId").focus();
		});
  
		
		$("#btnLogin").click(function() {
			location.href = "loginProc.jsp?id="+$("#memId").val();
		});
	
	});

	
</script>

</body>
</html>
