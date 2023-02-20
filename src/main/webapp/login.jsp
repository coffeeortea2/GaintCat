<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
HttpSession memberSession = request.getSession();
if(memberSession.getAttribute("member_id") != null) {
	response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Basic Page Needs -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Construction Html5 Template">
<link rel="icon" type="image/png" href="images/favicon.png">
<title>::: Gaint Cat ::: 大喵萌寵</title>
<!-- CSS -->
<!-- Bootstrap 使用 CDN-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<!-- FontAwesome -->
<link rel="stylesheet" href="./css/fontawesome.min.css">
<link rel="stylesheet" href="./css/solid.min.css">
<link rel="stylesheet" href="./css/fontawesome-brands-icons.css">
<!-- Animation (純 CSS 物件滑動特效) -->
<link rel="stylesheet" href="./css/animate.css">
<!-- slick (首頁大圖輪播) -->
<link rel="stylesheet" href="./css/slick.css">
<link rel="stylesheet" href="./css/slick-theme.css">
<!-- Template styles-->
<link rel="stylesheet" href="css/style.css">
</head>

<!-- Body Inner Start -->
<body>
	<!-- Menu Section Start -->
	<jsp:include page="includeFile/menu.jsp">
	  <jsp:param name="memberName" value="" />
	</jsp:include>
	<!-- Menu Section End -->

	<!-- Sign Up Start -->
	<div class="container-fluid">
		<div class="row h-100 justify-content-center"
			style="min-height: 100vh;">
			<div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
				<form action="login" method="post" id="loginForm" class="needs-validation" novalidate>
					<div class="secondarybg p-4 p-sm-5 my-4 mx-3">
						<div class="d-flex align-items-center justify-content-between mb-3">
							<i class="fa fa-user-edit" style="font-size: 48px; color: #0abde3;"></i>
							<h3 style="color: #fff; text-transform: capitalize;">Login</h3>
						</div>
						<c:if test="${not empty requestScope.message}">
						<div class="alert alert-danger">${requestScope.message}</div>
						</c:if>
						<div class="form-floating mb-3">
							<input type="email" class="form-control" id="account" name="email" placeholder="name@example.com" required>
							<label for="account">Email address</label>
							<div id="emailValid" class="invalid-feedback"></div>
						</div>
						<div class="form-floating mb-3">
							<input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
							<label for="password">Password</label>
							<div id="passwordValid" class="invalid-feedback"></div>
						</div>
						<!-- <div style="color: #9ca7b2">
							<input type="radio" id="me" name="authority" value="mem">
							  <label for="me">Member</label> 
							<input type="radio" id="ad" name="authority" value="admin">   
							<label for="ad">Administrator</label><br>  
						</div> -->
						<div class="d-flex align-items-center justify-content-between mb-4">
							<!-- <div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Check me out</label>
							</div> -->
							<a href="javascript:void(0)" style="color: #0abde3">Forgot Password ?</a>
						</div>

						<button type="button" id="login-btn" class="btn btn-primary py-3 w-100 mb-4">Sign In</button>
						<!-- p class="text-center mb-0">Already have an Account? <a href="" style="color:#0abde3">Sign In</a></p-->
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Sign Up End -->
	<%@ include file="includeFile/footer.jsp"%>
	<!-- footer Section End -->

	<!-- JavaScript Files -->
	<!-- initialize jQuery Library -->
	<script src="./js/jquery.min.js"></script>
	<script src="./js/jquery-ui.min.js"></script>
	<!-- Slick
	<script src="./js/slick.min.js"></script>
	<script src="./js/slick-animation.min.js"></script> -->
	<!-- Template custom -->
	<script type="text/javascript">
	  $(document).ready(function () {
		  $('#login-btn').on('click', function() {
			  const loginForm = document.querySelector('#loginForm');
			  if(formValidity(loginForm)) {
				  loginForm.submit();
			  }
		  });
	  });
	
	  // 表單驗證
	  function formValidity(loginForm) {
		  const email = loginForm.querySelector('#account');
		  const password = loginForm.querySelector('#password');
		  
		  const emailInvalid = loginForm.querySelector('#emailValid');
		  const passwordInvalid = loginForm.querySelector('#passwordValid');
		  
		  if (email.validity.valueMissing) {
			  emailInvalid.innerText = 'Please Input Your email Account';
		  }
		  
		  if (password.validity.valueMissing) {
			  passwordInvalid.innerText = 'Please Input password';
		  }
		  
		  loginForm.classList.add('was-validated');
		  return loginForm.checkValidity();
	  }
	</script>
</body>
<!-- Body Inner End -->
</html>