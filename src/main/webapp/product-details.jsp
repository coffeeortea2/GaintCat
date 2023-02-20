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
<!-- CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" href="./css/fontawesome.min.css">
<link rel="stylesheet" href="./css/solid.min.css">
<link rel="stylesheet" href="./css/fontawesome-brands-icons.css">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
<!-- JavaScript Files -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<style>
#addToCard {
    padding: 13px 28px;
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
  
  <c:set var="productDetail" value="${requestScope.productDetail}" />
  <!-- Product Details Section Begin -->
  <section class="product-details spad">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 col-md-6">
          <div class="product-details-pic">
            <div class="product-details-pic-item">
              <img class="product-details-pic-item--large" src="images/product/<c:out value="${productDetail.big_img1}" />" alt="">
            </div>
            <div class="product-details-pic-slider owl-carousel">
              <img data-imgbigurl="images/product/details/<c:out value="${productDetail.big_img2}" />" src="images/product/details/<c:out value="${productDetail.big_img2}" />" alt="<c:out value="${productDetail.title}" />">
              <img data-imgbigurl="images/product/details/<c:out value="${productDetail.big_img3}" />" src="images/product/details/<c:out value="${productDetail.big_img3}" />" alt="<c:out value="${productDetail.title}" />">
              <img data-imgbigurl="images/product/details/<c:out value="${productDetail.big_img4}" />" src="images/product/details/<c:out value="${productDetail.big_img4}" />" alt="<c:out value="${productDetail.title}" />">
              <img data-imgbigurl="images/product/details/<c:out value="${productDetail.big_img5}" />" src="images/product/details/<c:out value="${productDetail.big_img5}" />" alt="<c:out value="${productDetail.title}" />">
            </div>
          </div>
        </div>
        <div class="col-lg-6 col-md-6">
          <div class="product-details-text">
            <h3><c:out value="${productDetail.title}" /></h3>
            <div class="product-details-rating">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star-half-o"></i>
            </div>
            <div class="product-details-price">$<c:out value="${productDetail.price}" /></div>
            <p><c:out value="${productDetail.detail}" /></p>
            <div class="product-details-quantity">
              <div class="quantity">
                <div class="pro-qty">
                  <select id="quantity" name="quantity" class="form-select" style="height: 100%">
                    <c:set var="maxQty" value="${productDetail.inventory ge 10 ? 10 : productDetail.inventory}" />
                    <c:forEach var="i" begin="1" end="${maxQty}">
                    <option value="${i}" ${i eq 1 ? "selected" : "" }>${i}</option>
                    </c:forEach>
                  </select>
                </div>
              </div>
            </div>
            <button type="button" class="btn btn-info" id="addToCard" data-pid="${productDetail.id}">ADD TO CARD</button>
            <a href="#" class="heart-icon"><i class="fa-regular fa-heart"></i></a>
            <ul>
              <li><b>Availability</b> <span><c:out value="${productDetail.inventory eq 0 ? 'Out Of Stock' : 'In Stock'}" /></span></li>
              <li><b>Shipping</b> <span>Free Shipping</span></li>
              <li><b>Weight</b> <span><c:out value="${productDetail.weight}" /> pounds</span></li>
              <li><b>Share on</b>
                <span class="share">
                  <a href="#"><i class="fab fa-facebook-f"></i></a>
                  <a href="#"><i class="fab fa-twitter"></i></a>
                  <a href="#"><i class="fab fa-instagram"></i></a>
                  <a href="#"><i class="fab fa-github"></i></a>
                </span>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="row mt-4">
        <div class="col-lg-12">
          <div class="detail-section mt-4 pb-2">
            <h4 class="mb-3 pb-2 border-bottom border-secondary text-warning-emphasis">Product Description</h4>
            <p><c:out value="${productDetail.detail}" /></p>
          </div>
          <div class="detail-section pt-3">
            <h4 class="mb-3 pb-2 border-bottom border-secondary text-warning-emphasis">Product Information</h4>
            <table class="table table-bordered">
              <tr>
                <th class="bg-body-secondary w-25">Product Dimensions</th>
                <td>
                  <c:out value="${productDetail.length}" /> x
                  <c:out value="${productDetail.width}" /> x
                  <c:out value="${productDetail.height}" /> inches
                </td>
              </tr>
              <tr>
                <th class="bg-body-secondary w-25">Item Weight</th>
                <td>
                  <c:out value="${productDetail.weight}" /> pounds
                </td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
  </section>
  
  <!-- Product Details Section End -->
  <%@ include file="includeFile/footer.jsp"%>
  <%@ include file="includeFile/toast.html"%>
  
  <script src="js/script.js"></script>
  <script src="js/jquery-ui.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script type="text/javascript">
	$(document).ready(function () {
		/*---------------------------------
	    Product Details Pic Slider
	    ----------------------------------*/
	    $(".product-details-pic-slider").owlCarousel({
			loop: false,
			margin: 20,
			items: 4,
			dots: true,
			autoHeight: false,
			autoplay: false
		});
		
		/*------------------
		Single Product
		--------------------*/
		$('.product-details-pic-slider img').on('click', function () {
			var imgurl = $(this).data('imgbigurl');
			var bigImg = $('.product-details-pic-item--large').attr('src');
			if (imgurl != bigImg) {
				$('.product-details-pic-item--large').attr({ src: imgurl });
			}
		});
		
		/*-------------------
		Add To Cart
		--------------------- */
		$('#addToCard').on('click', function() {
			let pid = $(this).data('pid');
			let qty = $('#quantity').val();
			const toastElement = $('#liveToast');
			if (/^-?\d+$/.test(qty)) {
				$.ajax({
					method: 'GET',
					url: './addToCart?pid=' + pid + '&qty=' + qty,
					dataType: 'json'
				}).done(function(data) {
					toastElement.addClass('bg-success text-white');
					toastElement.find('.toast-body').html('<i class="fa-solid fa-circle-check"></i> Item added to cart');
					let totalQqty = 0;
					$.each(data, function(index, obj) {
						totalQqty += obj.quantity;
					});
					$('.header-cart-qty').html(totalQqty);
				});
			} else {
				toastElement.addClass('bg-danger text-white');
				toastElement.find('.toast-body').html('<i class="fa-solid fa-circle-xmark"></i> Please enter a number greater than 0');
			}
			const toast = new bootstrap.Toast(toastElement);
			toast.show();
		});
	});
  </script>
</body>
<!-- Body Inner End -->
</html>