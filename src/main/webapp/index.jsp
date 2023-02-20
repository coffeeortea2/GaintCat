<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- Bootstrap 使用 CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
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
	  <jsp:param name="memberName" value="<%=memberName%>" />
	  <jsp:param name="memberAuthority" value="<%=memberAuthority%>" />
	</jsp:include>
	<!-- Menu Section End -->

	<!-- Slider Section Start -->
	<div class="banner-carousel banner-carousel-1 mb-0">

		<div class="banner-carousel-item"
			style="background-image: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0)), url(images/slider-main/banner01.jpg)">
			<div class="slider-content">
				<div class="container h-100">
					<div class="row align-items-center h-100">
						<div class="col-md-12 text-end">
							<h2 class="slide-title" data-animation-in="slideInLeft">
								All Dog & Cat Merry & Bright toys, <br>clothing, collars,
								beds & more
							</h2>
							<h3 class="slide-sub-title" data-animation-in="slideInRight">Save
								up to 50%</h3>
							<p data-animation-in="slideInLeft" data-duration-in="1.2">
								<a href="services.html" class="slider btn btn-primary">Purchases
									Now</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="banner-carousel-item"
			style="background-image: url(images/slider-main/bg2.jpg)">
			<div class="slider-content text-right">
				<div class="container h-100">
					<div class="row align-items-center h-100">
						<div class="col-md-12 text-end">
							<h2 class="slide-title-box" data-animation-in="slideInDown">Gaint
								cat</h2>
							<h3 class="slide-title" data-animation-in="fadeIn">Shop
								weekend prices on gifts your pet will love.</h3>
							<h3 class="slide-sub-title" data-animation-in="slideInRight">The
								Savings Don't Stop!</h3>
							<p data-animation-in="slideInRight">
								<a href="services.html" class="slider btn btn-primary border">Buy
									Now!</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="banner-carousel-item"
			style="background-image: url(images/slider-main/bg3.jpg)">
			<div class="slider-content text-right">
				<div class="container h-100">
					<div class="row align-items-center h-100">
						<div class="col-md-12 text-end">
							<h2 class="slide-title" data-animation-in="slideInDown">Simply
								Nourish® Limited</h2>
							<h3 class="slide-sub-title" data-animation-in="fadeIn">
								Ingredient Diet Adult Dry Dog Food - Salmon & Sweet Potato</h3>
							<div data-animation-in="slideInLeft">
								<a href="contact.html" class="slider btn btn-primary"
									aria-label="contact-with-us">Buy Now!</a> <a href="about.html"
									class="slider btn btn-primary border"
									aria-label="learn-more-about-us">Learn more</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- Slider Section End -->

	<section id="news" class="news dark-bg">
		<div class="container">
			<div class="row text-center">
				<div class="col-12">
					<div class="section-sub-title" style="color: #600030">NEWS</div>
				</div>
			</div>
			<!--/ Title row end -->

			<div class="row">
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="latest-post">
						<div class="latest-post-media">
							<a href="news-single.html" class="latest-post-img"> <img class="img-fluid" src="images/news/news1.jpg" alt="img">
							</a>
						</div>
						<div class="post-body">
							<h4 class="post-title">
								<a href="news-single.html" class="d-inline-block">We Just
									Completes $17.6 million Medical Clinic in Mid-Missouri</a>
							</h4>
							<div class="latest-post-meta">
								<span class="post-item-date"> <i class="fa fa-clock-o"></i>
									July 20, 2017
								</span>
							</div>
						</div>
					</div>
					<!-- Latest post end -->
				</div>
				<!-- 1st post col end -->

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="latest-post">
						<div class="latest-post-media">
							<a href="news-single.html" class="latest-post-img"> <img class="img-fluid" src="images/news/news2.jpg" alt="img">
							</a>
						</div>
						<div class="post-body">
							<h4 class="post-title">
								<a href="news-single.html" class="d-inline-block">Thandler
									Airport Water Reclamation Facility Expansion Project Named</a>
							</h4>
							<div class="latest-post-meta">
								<span class="post-item-date"> <i class="fa fa-clock-o"></i>
									June 17, 2017
								</span>
							</div>
						</div>
					</div>
					<!-- Latest post end -->
				</div>
				<!-- 2nd post col end -->

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="latest-post">
						<div class="latest-post-media">
							<a href="news-single.html" class="latest-post-img"> <img class="img-fluid" src="images/news/news3.jpg" alt="img">
							</a>
						</div>
						<div class="post-body">
							<h4 class="post-title">
								<a href="news-single.html" class="d-inline-block">Silicon
									Bench and Cornike Begin Construction Solar Facilities</a>
							</h4>
							<div class="latest-post-meta">
								<span class="post-item-date"> <i class="fa fa-clock-o"></i>
									Aug 13, 2017
								</span>
							</div>
						</div>
					</div>
					<!-- Latest post end -->
				</div>
				<!-- 3rd post col end -->
			</div>
			<!--/ Content row end -->

		</div>
		<!--/ Container end -->
	</section>

<!-- About Us Start -->
	<section id="main-container" class="main-container text-white bg-dark">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section-sub-title">About Us</div>
					Founded in 2021 by pet parents who believe that every pet
						deserves unconditional love and care. Being in the pet industry
						for over 20 years we've learned that being a pet owner takes a lot
						of work. We are here to help you give your pet the personal
						attention and guidance you need to give your furry family members
						a healthy and happy life! Our pets are always there when we need
						them most, and it's our passion to be there for our pets when they
						need us most. Our team's dedication to providing our customers
						with excellent service and knowledge is what we strive for in our
						pet community. We are always here when you need us from 9 am to 5
						pm PST, seven days a week.
				</div>

				<div class="col-lg-6 mt-5 mt-lg-0">
					<div id="page-slider" class="page-slider small-bg">
						<div class="item"
							style="background-image: url(images/slider-pages/slide-page1.jpg)"></div>
					</div>
					<!-- Page slider end-->
				</div>
				<!-- Col end -->
			</div>
			<!-- Content row end -->
		</div>
		<!-- Container end -->
	</section>
	<!-- About Us End -->

<!-- Section KPI Start -->
<section id="number" class="facts-area">
  <div class="container">
    <div class="facts-wrapper">
      <div class="row">
        <div class="col-md-4 col-sm-6 ts-facts">
          <div class="ts-facts-img"><i class="fa-solid fa fa-line-chart" style="font-size:40px;"></i></div>
          <div class="ts-facts-content">
            <h2 class="ts-facts-num"><span class="counterUp" data-count="3756">0</span></h2>
            <h3 class="ts-facts-title">Financial Sound</h3>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 ts-facts mt-5 mt-sm-0">
          <div class="ts-facts-img"><i class="fa-solid fa fa-users" style="font-size:40px;"></i></div>
          <div class="ts-facts-content">
            <h2 class="ts-facts-num"><span class="counterUp" data-count="634527">0</span></h2>
            <h3 class="ts-facts-title"> Number of users</h3>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 ts-facts mt-5 mt-md-0">
          <div class="ts-facts-img"><i class="fa-solid fa fa-globe" style="font-size:40px;"></i></div>
          <div class="ts-facts-content">
            <h2 class="ts-facts-num"><span class="counterUp" data-count="44">0</span></h2>
            <h3 class="ts-facts-title">Global Distributors</h3>
          </div>
        </div>
      </div> 
    </div>
  </div>
</section>
<!--Section KIP End-->
<!-- footer Section Start -->
<%@ include file="includeFile/footer.jsp"%>
<!-- footer Section End -->

<!-- JavaScript Files -->
<!-- initialize jQuery Library -->
<script src="./js/jquery.min.js"></script>
<script src="./js/jquery-ui.min.js"></script>
<!-- Slick -->
<script src="./js/slick.min.js"></script>
<script src="./js/slick-animation.min.js"></script>
<!-- Template custom -->
<script src="./js/script.js"></script>
<script src="./js/index.js"></script>
</body>
<!-- Body Inner End -->
</html>