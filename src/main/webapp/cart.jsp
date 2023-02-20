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

<!-- Bootstrap 使用 CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<!-- FontAwesome -->
<link rel="stylesheet" href="./css/fontawesome.min.css">
<link rel="stylesheet" href="./css/solid.min.css">
<link rel="stylesheet" href="./css/fontawesome-brands-icons.css">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/jquery-ui.min.css">
<!-- JavaScript Files -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<style type="text/css">
  .shoping-cart {
      padding-top: 20px;
  }
  .shoping-checkout {
      margin-top: 0;
      padding-top: 30px;
  }
  .shoping-cart-item img {
      width: 100px;
      max-width: inherit;
  }
  .shoping-cart-table table tbody tr td.shoping-cart-item {
      width: 60%;
  }
  .shoping-cart-table table tbody tr td.shoping-cart-quantity {
      width: 100px;
  }
  .shoping-cart-table table tbody tr td.shoping-cart-item-close {
      width: 20px;
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
        <h2>Shopping Cart</h2>
      </div>
    </div>
  </section>
  
  <!-- Shoping Cart Section Begin -->
  <c:set var="orderData" value="${requestScope.orderData}" />
  <section class="shoping-cart spad">
    <div class="container">
      <nav style="--bs-breadcrumb-divider:'>';" aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
          <li class="breadcrumb-item active" aria-current="page">Shopping Cart</li>
        </ol>
      </nav>
      <div class="row">
        <div class="col-12 col-lg-8">
          <div class="shoping-cart-body">
            <c:forEach var="data" items="${orderData.cartData}">
            <div class="shoping-cart-item py-3 border-bottom">
              <div class="row d-flex align-items-center text-start text-md-center">
                <div class="col-12 col-md-6">
                  <div class="d-flex align-items-center">
                    <a href="javascript:void(0)" class="link-secondary mt-3 d-md-none" data-pid="${data.productId}"><i class="fa-solid fa-circle-xmark"></i></a>
                    <div class="d-flex align-items-center">
                      <a href="prdDetal?pid=${data.productId}"><img src="images/product/${data.small_img}" alt="${data.title}"></a>
                      <div class="cart-title text-start">
                        <a class="text-dark link-animated" href="prdDetal?pid=${data.productId}"><strong>${data.title}</strong></a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-12 col-md-6 mt-md-0">
                  <div class="row align-items-center">
                    <div class="col-md-3">
                      <div class="row">
                        <div class="col-6 d-md-none text-muted">Price per item</div>
                        <div class="col-6 col-md-12 text-end text-md-center">$${data.price}</div>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="row align-items-center">
                        <div class="d-md-none col-7 col-sm-9 text-muted">Quantity</div>
                        <div class="col-5 col-sm-3 col-md-12">
                          <select name="quantity" class="form-select quantity" style="height: 100%">
                            <c:set var="maxQty" value="${data.inventory ge 10 ? 10 : data.inventory}" />
                            <c:forEach var="i" begin="1" end="${maxQty}">
                            <option value="${i}" ${i eq data.quantity ? "selected" : "" }>${i}</option>
                            </c:forEach>
                          </select>
                          <input type="hidden" name="pid" value="${data.productId}">
                        </div>
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="row">
                        <div class="col-6 d-md-none text-muted">Subtotal</div>
                        <div class="col-6 col-md-12 text-end text-md-center">$${data.price * data.quantity}</div>
                      </div>
                    </div>
                    <div class="col-2 d-none d-md-block text-center">
                      <a href="javascript:void(0)" class="link-secondary" data-pid="${data.productId}"><i class="fa-solid fa-circle-xmark"></i></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            </c:forEach>
          </div>
          
          <div class="d-flex justify-content-between flex-column flex-lg-row mb-5 mb-lg-0 mt-3">
            <a href="shopGrid" class="primary-btn cart-btn"><i class="fa fa-chevron-left me-2"></i>CONTINUE SHOPPING</a>
          </div>
        </div>
        
        <div class="col-12 col-lg-4">
          <div class="shoping-checkout">
            <div class="total">Cart Total</div>
            <ul>
              <li>Subtotal <span class="order-subtotal">$${orderData.subtotal}</span></li>
              <li>Shipping Cost <span class="order-shipping-cost">$${orderData.shippingCost}</span></li>
              <li>Total <span class="order-total-price">$${orderData.total}</span></li>
            </ul>
            <a href="checkout" class="primary-btn">PROCEED TO CHECKOUT <i class="fa fa-chevron-right ms-2"></i></a>
          </div>
        </div>
      </div>
      <div class="row">
        <!-- <div class="col-lg-6">
          <div class="shoping-continue">
            <div class="shoping-discount">
              <h5>Discount Codes</h5>
              <form action="#">
                <input type="text" placeholder="Enter your coupon code">
                <button type="submit" class="shoping-discount-button">APPLY COUPON</button>
              </form>
            </div>
          </div>
        </div> -->
      </div>
    </div>
  </section>
  <!-- Shoping Cart Section End -->
  
  <%@ include file="includeFile/footer.jsp"%>
  
  <!-- Javascript Files -->
  <script src="js/script.js"></script>
  <script src="js/jquery-ui.min.js"></script>
  <script type="text/javascript">
	$(document).ready(function () {
		// 當數量切換時進行購物車資料更新處理
		$('select[name="quantity"]').on('change', function() {
			let parent = $(this).parent();
			let pid = parent.find('input[name="pid"]').val();
			let newQty = $(this).val();
			window.location.href = './updateCart?pid=' + pid + '&qty=' + newQty;
		});
		
		$('.link-secondary').on('click', function() {
			let pid = $(this).data('pid');
			window.location.href = './removeCartItem?pid=' + pid;
		});
	});
  </script>
</body>
<!-- Body Inner End -->
</html>