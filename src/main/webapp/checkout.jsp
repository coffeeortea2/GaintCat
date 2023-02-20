<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
Object memberNameSession = session.getAttribute("name");
Object memberAuthoritySession = session.getAttribute("authority");
String memberName = "";
String memberAuthority = "";
if(memberNameSession != null) {
	memberName = memberNameSession.toString();
	memberAuthority = memberAuthoritySession.toString();
} else {
	response.sendRedirect("login.jsp");
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" href="./css/fontawesome.min.css">
<link rel="stylesheet" href="./css/solid.min.css">
<link rel="stylesheet" href="./css/fontawesome-brands-icons.css">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/jquery-ui.min.css" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<style type="text/css">
.checkout-bg {
      padding-top: 20px;
  }
::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #707070 !important;
  opacity: 1 !important; /* Firefox */
}

:-ms-input-placeholder { /* Internet Explorer 10-11 */
  color: #707070 !important;
}

::-ms-input-placeholder { /* Microsoft Edge */
  color: #707070 !important;
}
</style>

</head>

<!-- Body Inner Start -->
<body>
  <!-- Menu Section Start -->
  <jsp:include page="includeFile/menu.jsp">
    <jsp:param name="memberName" value="<%=memberName%>" />
    <jsp:param name="memberAuthority" value="<%=memberAuthority%>" />
  </jsp:include>
  <!-- Menu Section End -->
  
  <!-- Breadcrumb Section Begin -->
  <section class="breadcrumb-section set-bg" data-setbg="images/banner01.jpg">
    <div class="col-lg-12 text-center">
      <div class="breadcrumb-text">
        <h2>Checkout</h2>
      </div>
    </div>
  </section>
  <!-- Breadcrumb Section End -->
  
  <!-- Checkout Section Begin -->
  <c:set var="orderData" value="${requestScope.orderData}" />
  <c:set var="countryData" value="${requestScope.countryData}" />
  
  <section class="checkout-bg">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 form-label">
          <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a class="link-dark" href="index.jsp">Home</a></li>
              <li class="breadcrumb-item"><a class="link-dark" href="cart">Shopping Cart</a></li>
              <li class="breadcrumb-item active" aria-current="page">Checkout</li>
            </ol>
          </nav>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-8 col-12">
          <h2 style="color:#ffe7e3;">Billing Details</h2>
          <form action="#" method="post" id="checkout-form" class="row g-3 form-floating needs-validation" novalidate>
            <div class="col-md-12">
              <label for="sname" class="form-label">Name <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="sname" name="name" placeholder="Your name" value="${orderData.name}" required>
              <div id="nameValid" class="invalid-feedback"></div>
            </div>
            <div class="col-md-12">
              <label for="semail" class="form-label">Email <span class="text-danger">*</span></label>
              <input type="email" class="form-control" id="semail" name="email" placeholder="name@example.com" value="${orderData.email}" required>
              <div id="emailValid" class="invalid-feedback"></div>
            </div>
            <div class="col-md-12">
              <label for="sphone" class="form-label">Phone <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="sphone" name="phone" placeholder="Phone number" value="${orderData.phone}" required>
              <div id="phoneValid" class="invalid-feedback"></div>
            </div>
            <div class="col-md-12">
              <label for="saddress1" class="form-label">Address <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="saddress1" name="address1" placeholder="1234 Main St" value="${orderData.address1}" required>
              <div id="addressValid" class="invalid-feedback"></div>
            </div>
            <div class="col-md-12">
              <label for="saddress2" class="form-label">Address 2 (Optional)</label>
              <input type="text" class="form-control" id="saddress2" name="address2" placeholder="Apartment or suite"value="${orderData.address2}">
            </div>
            <div class="col-md-4">
              <label for="scountry" class="form-label">Country <span class="text-danger">*</span></label>
              <select class="form-control" id="scountry" name="country" required>
                <option disabled>Select Country</option>
                <c:forEach var="country" items="${countryData}">
                <option value="${country.countryCode}" ${orderData.countryCode eq country.countryCode ? "selected" : ""}>
                ${country.countryName}
                </option>
                </c:forEach>
              </select>
              <div id="countryValid" class="invalid-feedback"></div>
            </div>
            <div class="col-md-5">
              <label for="scity" class="form-label">City / State <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="scity" name="city" value="${orderData.city}" required>
              <div id="cityValid" class="invalid-feedback"></div>
            </div>
            <div class="col-md-3">
              <label for="szip" class="form-label">Zip Code <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="szip" name="zip" value="${orderData.zipCode}" required>
              <div id="zipValid" class="invalid-feedback"></div>
            </div>
          </form>
        </div>
        <div class="col-lg-4 col-12">
          <div class="checkout-order">
            <div class="border-bottom border-secondary mb-3">
              <h3 style="color:#df9c94">Your Order</h3>
              <ul class="list-group list-group-flush">
                <c:forEach var="data" items="${orderData.cartData}">
                  <li class="list-group-item bg-transparent px-0 border-0">
                    <img src="images/product/${data.small_img}" alt="${data.title}" class="img-thumbnail d-inline-block align-middle" style="width:70px">
                    <div class="ms-2 me-auto d-inline-block align-middle" style="width: calc(100% - 95px);">
                      <div class="fw-bold text-truncate">${data.title}</div>
                      <div class="d-inline item-quantity">X ${data.quantity}</div>
                      <div class="d-inline float-end item-subtotal">$${data.price * data.quantity}</div>
                    </div>
                  </li>
                </c:forEach>
              </ul>
            </div>
            <div class="border-bottom border-secondary mb-3">
              <ul class="list-group list-group-flush">
                <li class="list-group-item bg-transparent px-0 border-0 lh-sm d-flex justify-content-between">
                  <span>Subtotal</span><span class="subtotal">$${orderData.subtotal}</span>
                </li>
                <li class="list-group-item bg-transparent px-0 border-0 lh-sm d-flex justify-content-between">
                  <span>Shipping Cost</span><span class="shipping-cost">$${orderData.shippingCost}</span>
                </li>
                <!-- <li class="list-group-item bg-transparent px-0 border-0 lh-sm d-flex justify-content-between">
                  <span>Discount</span><span class="discount">-$50.00</span>
                </li> -->
              </ul>
            </div>
            <div class="mb-3">
              <p class="d-flex justify-content-between fs-5 fw-blod text-dark">
                <span>Total</span><span class="total-price">$${orderData.total}</span>
              </p>
            </div>
            <button type="button" class="site-btn" id="creat-order-btn">PLACE ORDER</button>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Checkout Section End -->
  
  <%@ include file="includeFile/footer.jsp"%>
  
  <!-- Javascript Files -->
  <script src="js/script.js"></script>
  <script src="js/jquery-ui.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function () {
	  $('#creat-order-btn').on('click', function() {
		  const orderForm = document.querySelector('#checkout-form');
		  let validity = formValidity(orderForm);
		  if(validity) {
			  let fd = new FormData(orderForm);
			  $.ajax({
				  method: 'POST',
				  url: './newOrder',
				  data: fd,
				  contentType: false,
				  processData: false
			  }).done(function(response) {
				  if(response == "success") {
					  alert("Tnank you for your order!");
					  location.replace('index.jsp');
				  } else {
					  alert("Please try again!");
				  }
			  });
		  }
	  });
  });
  
  // 表單驗證
  function formValidity(orderForm) {
	  const name = orderForm.querySelector('#sname');
	  const email = orderForm.querySelector('#semail');
	  const phone = orderForm.querySelector('#sphone');
	  const address = orderForm.querySelector('#saddress1');
	  const country = orderForm.querySelector('#scountry');
	  const city = orderForm.querySelector('#scity');
	  const zip = orderForm.querySelector('#szip');
	  
	  const nameInvalid = orderForm.querySelector('#nameValid');
	  const emailInvalid = orderForm.querySelector('#emailValid');
	  const phoneInvalid = orderForm.querySelector('#phoneValid');
	  const addressInvalid = orderForm.querySelector('#addressValid');
	  const countryInvalid = orderForm.querySelector('#countryValid');
	  const cityInvalid = orderForm.querySelector('#cityValid');
	  const zipInvalid = orderForm.querySelector('#zipValid');
	  
	  if (name.validity.valueMissing) {
		  nameInvalid.innerText = 'Please Input Your Name';
	  }
	  
	  if (email.validity.valueMissing) {
		  emailInvalid.innerText = 'Please Input email';
	  }
	  else if (email.validity.typeMismatch) {
		  emailInvalid.innerText = 'email format error';
	  }
	  
	  if (phone.validity.valueMissing) {
		  phoneInvalid.innerText = 'Please Input Phone Number';
	  }
	  
	  if (address.validity.valueMissing) {
		  addressInvalid.innerText = 'Please Input Shipping Address';
	  }
	  
	  if (country.validity.valueMissing) {
		  countryInvalid.innerText = 'Please Select Country';
	  }
	  
	  if (city.validity.valueMissing) {
		  cityInvalid.innerText = 'Please Input Shipping City';
	  }
	  
	  if (zip.validity.valueMissing) {
		  zipInvalid.innerText = 'Please Input Zip Code';
	  }
	  
	  orderForm.classList.add('was-validated');
	  return orderForm.checkValidity();
  } 
  </script>
</body>
<!-- Body Inner End -->
</html>