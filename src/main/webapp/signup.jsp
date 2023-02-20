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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<!-- FontAwesome -->
<link rel="stylesheet" href="./css/fontawesome.min.css">
<link rel="stylesheet" href="./css/solid.min.css">
<link rel="stylesheet" href="./css/fontawesome-brands-icons.css">
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
  <div class="singup-container">
    <div class="row h-100 justify-content-center" style="min-height: 100vh;">
      <div class="col-12 col-sm-12 col-md-11 col-lg-11 col-xl-11">
        <div class="secondarybg p-4 p-sm-5 my-4 mx-3">
          <div class="d-flex align-items-center justify-content-between mb-3">
            <i class="fa fa-user-plus" style="font-size: 48px; color: #0abde3;"></i>
            <h3 style="color: #fff; text-transform: capitalize;">Sign Up</h3>
          </div>
          <div class="alert alert-danger d-none" id="message-alert"></div>
          <form method="get" action="./joinUs" id="signupForm" class="row needs-validation" novalidate>
            <div class="col-12">
              <div class="form-floating">
                <input type="text" class="form-control" id="signupName" placeholder="Name" name="name" required>
                <label for="signupName">User Name <span class="text-danger">*</span></label>
                <div id="signupNameValid" class="invalid-feedback"></div>
              </div>
            </div>
            <div class="col-12">
              <div class="form-floating">
                <input type="email" class="form-control" id="signupEmail" placeholder="email" name="email" required>
                <label for="signupEmail">Email (Account)<span class="text-danger">*</span></label>
                <div id="signupEmailValid" class="invalid-feedback"></div>
              </div>
            </div>
            <div class="col-6">
              <div class="form-floating">
                <input type="password" class="form-control" id="signupPassword" placeholder="Password" name="password" required>
                <label for="signupPassword">Password <span class="text-danger">*</span></label>
                <div id="signupPasswordValid" class="invalid-feedback"></div>
              </div>
            </div>
            <div class="col-6">
              <div class="form-floating">
                <input type="password" class="form-control" id="passwordConf" placeholder="Password" name="passwordConf" required>
                <label for="passwordConf">Password Confirm <span class="text-danger">*</span></label>
                <div id="pwsConfValid" class="invalid-feedback"></div>
              </div>
            </div>
            <div class="col-12">
              <div class="form-floating">
                <input type="text" class="form-control" id="signupPhone" placeholder="Phone" name="phone">
                <label for="signupPhone">Phone</label>
                <div id="signupPhoneValid" class="invalid-feedback"></div>
              </div>
            </div>
            <div class="col-12">
              <div class="form-floating">
                <input type="text" class="form-control" id="signupAddress" placeholder="address" name="address1">
                <label for="signupAddress">Address</label>
              </div>
            </div>
            <div class="col-12">
              <div class="form-floating">
                <input type="text" class="form-control" id="signupAddress2" placeholder="address" name="address2">
                <label for="signupAddress2">Address 2 (Optional)</label>
              </div>
            </div>
            <div class="col-5">
              <div class="form-floating">
                <input type="text" class="form-control" id="signupCity" placeholder="city" name="city">
                <label for="signupCity">City / State</label>
              </div>
            </div>
            <div class="col-2">
              <div class="form-floating">
                <input type="text" class="form-control" id="signupZipCode" placeholder="Zip Code" name="zip_code">
                <label for="signupZipCode">Zip Code</label>
              </div>
            </div>
            <div class="col-5">
              <div class="form-floating">
                <select class="form-control" id="signupCountry" name="country">
                  <option selected disabled>Select Country</option>
                  <c:forEach var="country" items="${countryData}">
                  <option value="${country.id}">${country.countryName}</option>
                  </c:forEach>
                </select>
                <label for="signupCountry">Country</label>
              </div>
            </div>
            <div class="col-12">
              <button type="button" id="submit-button" class="btn btn-primary py-3 w-100 mb-4 mt-3">Sign Up</button>
              <p class="text-center mb-0">Already have an Account? <a href="login.jsp" style="color:#0abde3">Sign In</a></p>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- Sign Up End -->
  
  <!-- footer Section Start -->
  <%@ include file="includeFile/footer.jsp"%>
  <!-- footer Section End -->
  
  <!-- JavaScript Files -->
  <!-- initialize jQuery Library -->
  <script src="./js/jquery.min.js"></script>
  <script src="./js/jquery-ui.min.js"></script>
  <!-- Template custom -->
  <script src="./js/script.js"></script>
  <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', () => {
    	const memberForm = document.querySelector('#signupForm');
    	document.querySelector('#submit-button').addEventListener('click', () => {
    		(async function () {
    			let validity = await formValidity(memberForm);
    			if (validity) {
    				let url = memberForm.action;
    				let fd = new FormData(memberForm);
    				fetch(url, { //呼叫 servlet 的 url
    					method: 'POST', // 指定使用 post 方式
    					body: fd // 將 FormData 物件放入 post body 中
    				})
    				.then(response => response.text()) // 將處理完畢後的結果轉換為字串並傳出(此處只會出現 success 和 fail 兩種狀況)
    				.then(data => {
    					if (data == "success") {
    						alert('Welcome to Join Us.');
    						location.replace('member.jsp');
    					} else {
    						const alertElement = document.querySelector('#message-alert');
    						alertElement.innerHTML('Signup Fail! Please Try Again.');
    						alertElement.classList.remove('d-none');
    					}
    				});
    			}
    		})();
    	});
    });
  
    async function formValidity(form) {
		let name = form.querySelector('input#signupName');
		let email = form.querySelector('input#signupEmail');
		let password = form.querySelector('input#signupPassword');
		let passwordConf = form.querySelector('input#passwordConf');
		
		let nameInvalid = form.querySelector('div#signupNameValid');
		let emaiValid = form.querySelector('div#signupEmailValid');
		let passwordValid = form.querySelector('div#signupPasswordValid');
		let pwsConfValid = form.querySelector('div#pwsConfValid');
		
		if (name.validity.valueMissing) {
			nameInvalid.innerText = 'Please Input Your Name';
		}
		
		if (email.validity.valueMissing) {
			emaiValid.innerText = 'Please Input Email';
		}
		else if (email.validity.typeMismatch) {
			emaiValid.innerText = 'Email Type Error';
		}
		else if (await mailRepeatValidity(email.value) == false) {
			email.setCustomValidity('email already exists');
			emaiValid.innerText = email.validationMessage; // 讀取自訂義錯誤訊息
		} else {
			email.setCustomValidity('');
		}
		
		if (password.validity.valueMissing) {
			passwordValid.innerText = 'Please Input Password';
		}
		
		if (passwordConf.validity.valueMissing) {
			pwsConfValid.innerText = 'Please Confirm Password';
		}
		else if(password.value != passwordConf.value) {
			password.setCustomValidity('The passwords do not match, please re-enter');
			passwordValid.innerText = password.validationMessage;
			
			passwordConf.setCustomValidity('The passwords do not match, please re-enter');
			pwsConfValid.innerText = passwordConf.validationMessage;
		} else {
			password.setCustomValidity('');
			passwordConf.setCustomValidity('');
		}
		
		form.classList.add('was-validated');
		return form.checkValidity();
	}

	//驗證信箱是否重複
	function mailRepeatValidity(email) {
		// 將驗證結果轉為布林值，當 fetch 執行成功後使用 Promise 方法的 resolve 回傳
		// resolve: 當 fetch 執行成功時會回傳的資料
		// reject: 當 fetch 執行失敗時會回傳的資料
		// 詳細說明請參考：https://ithelp.ithome.com.tw/articles/10193346
		return new Promise((resolve, reject) => {
			fetch('./joinUs?mail=' + email, {
				method: 'GET',
			})
			.then(response => response.text()) // 回傳 success 或 fail 字串
			.then(data => {
				let result = (data.trim() == 'success') ? true : false;
				resolve(result);
			});
		});
	}
  </script>
</body>
<!-- Body Inner End -->
</html>