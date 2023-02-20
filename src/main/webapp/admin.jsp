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
} else {
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
    <jsp:param name="memberName" value="<%=memberName%>" />
    <jsp:param name="memberAuthority" value="<%=memberAuthority%>" />
  </jsp:include>
  <!-- Menu Section End -->

  <div class="checkout-bg d-flex">
    <!-- Sidebar Start -->
    <div class="pe-4 pb-3">
      <nav class="navbar-dark">

        <div class="d-flex ms-4 mb-4">

          <div>
            <img class="rounded-circle" src="images/members/nn.jpg" alt=""
              style="width: 40px; height: 40px;">
            <div class="end-0 bottom-0 p-1"></div>
          </div>

          <!-- 會員頭像區 -->
          <div class="ms-3" style="color: #fff">
            <span style="font-size: 14px;">Member</span>
            <h6 class="mb-0" style="color: #fff; font-size: 18px;"><%=memberName%></h6>
          </div>

        </div>

        <div class="navbar-nav">
          <a href="form.html" class="nav-link active"><i
            class="fa fa-user-circle me-2"></i>Distributor</a> <a
            href="index.html" class="nav-item nav-link"><i
            class="fa fa-tachometer-alt me-2"></i>Product</a> <a
            href="widget.html" class="nav-item nav-link"><i
            class="fa fa-th me-2"></i>Member</a>
        </div>
      </nav>
    </div>
    <!-- Sidebar End -->

    <!-- Content Start -->
    <div class="content">
      <!-- Navbar Start -->
      <nav class="navbar navbar-expand  navbar-dark sticky-top px-4 py-0">

        <div class="navbar-nav align-items-center ms-auto">

          <div class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle"
              data-bs-toggle="dropdown"> <i class="fa fa-envelope me-lg-2"></i>
              <span class="d-none d-lg-inline-flex">Message</span>
            </a>
          </div>

          <div class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle"
              data-bs-toggle="dropdown"> <i class="fa fa-bell me-lg-2"></i>
              <span class="d-none d-lg-inline-flex">Notificatin</span>
            </a>
          </div>

          <div class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle"
              data-bs-toggle="dropdown"> <img
              class="rounded-circle me-lg-2" src="images/members/nn.jpg"
              style="width: 40px; height: 40px;"> <span
              class="d-none d-lg-inline-flex"><%=memberName%></span>
            </a>
            <div
              class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
              <a href="#" class="dropdown-item">My Profile</a> <a href="#"
                class="dropdown-item">Settings</a> <a href="#"
                class="dropdown-item">Log Out</a>
            </div>
          </div>
        </div>
      </nav>
      <!-- Navbar End -->

      <!-- Form Start -->
      <div class="container-fluid pt-4 px-4">
        <div class="row g-4">
          <form method="get" action="process/memdata.jsp">
            <!-- 基本資料 -->
            <div class="col-sm-12 col-xl-6">
              <div class="rounded h-100 p-4 bg-secondary">
                <p
                  style="color: #ffe7e3; font-size: 38px; font-weight: bold; padding-top: 15px;">
                  Basic Info</p>
                <div class="col-6">
                  <div class="form-floating">
                    <input type="text" class="form-control" id="name"
                      placeholder="Name" name="name"> <label for="name">User
                      Name <span class="text-danger">*</span>
                    </label>
                  </div>
                </div>

                <div class="col-6">
                  <div class="form-floating">
                    <input type="password" class="form-control" id="password"
                      placeholder="Password" name="password"> <label
                      for="password">Password <span class="text-danger">*</span>
                    </label>
                  </div>
                </div>

                <div class="col-12">
                  <div class="form-floating">
                    <input type="email" class="form-control" id="email"
                      placeholder="email" name="email"> <label for="email">Email<span
                      class="text-danger">*</span></label>
                  </div>
                </div>

                <div class="col-12">
                  <div class="form-floating">
                    <input type="text" class="form-control" id="address_1"
                      placeholder="address" name="address_1"> <label
                      for="address_1">Address 1</label>
                  </div>
                </div>

                <div class="col-5">
                  <div class="form-floating">
                    <input type="text" class="form-control" id="city"
                      placeholder="city" name="city"> <label for="city">City
                      / State</label>
                  </div>
                </div>

                <div class="col-2">
                  <div class="form-floating">
                    <input type="text" class="form-control" id="zip_code"
                      placeholder="zip" name="zip_code"> <label
                      for="zip_code">Zip Code</label>
                  </div>
                </div>

                <div class="col-5">
                  <div class="form-floating">
                    <input type="text" class="form-control" id="country"
                      placeholder="country" name="country"> <label
                      for="country">Country</label>
                  </div>
                </div>

                <span style="color: #e5e2e1; font-size: 13px;">We'll
                  never share your personal data with anyone else.</span>
              </div>
            </div>

            <!-- 完整資料開始 -->
            <div class="col-sm-12 col-xl-6">
              <div class="bg-secondary rounded h-100 p-4">
                <h6 class="mb-4 form-label">Complete your profile</h6>
                <!-- 地址2 -->
                <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="address_2"
                    placeholder="address" name="address_2"> <label
                    for="address_2">Address 2</label>
                </div>
                <!-- 電話 -->
                <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="phone"
                    placeholder="phone" name="phone"> <label for="phone">Phone</label>
                </div>
                <!-- 大頭照上傳 -->
                <span style="color: #e5e2e1; font-size: 13px;">Upload
                  your photo</span>

                <div class="mb-3">
                  <input class="form-control" type="file" id="formFile">
                </div>

                <hr>
                <!-- 寵物 -->
                <h6 class="mb-4 form-label">What kind of pets do you have?</h6>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox"
                    id="pet" value="dog"> <label
                    class="form-check-label" for="dog">Dog</label>
                </div>

                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox"
                    id="pet" value="cat"> <label
                    class="form-check-label" for="cat">Cat</label>
                </div>

                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox"
                    id="pet" value="bird"> <label
                    class="form-check-label" for="bird">Bird </label>
                </div>

                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox"
                    id="pet" value="others"> <label
                    class="form-check-label" for="others">Others
                  </label>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>

              </div>
            </div>
          </form>
        </div>

      </div>

    </div>
    <!-- Form End -->
  </div>
  <!-- Content End -->

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