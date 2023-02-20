<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.net.CookieStore"%>
<%@page import="com.google.gson.Gson, com.google.gson.reflect.TypeToken, java.net.URLDecoder"%>
<%@page import="bean.CartData, model.CartControlService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
Cookie[] cookies = request.getCookies();
int cartQty = 0;
if (cookies != null) {
	String cartString = "";
	for(Cookie cookie : cookies) {
		if (cookie.getName().equals("cartData")) {
			cartString += cookie.getValue();
			break;
		}
	}
	if (cartString != "") {
		CartControlService cartControlService = new CartControlService();
		ArrayList<CartData> arrayListData = cartControlService.cartJsonStringConverToArrayList(cartString);
		for(CartData cart : arrayListData) {
			cartQty += cart.getQuantity();
		}
	}
}
%>
    <!-- Header start -->
    <header id="header" class="header-one">
      <!-- Navigation Start-->
      <div class="site-navigation">
        <!-- Container Start-->
        <div class="container">
        <!--/ Row Start-->
          <div class="row">
          <!--/ Col Start-->
            <div class="col-lg-12">
              <nav class="navbar navbar-expand-lg navbar-dark p-0">
                <button class="navbar-toggler" type="button"
                  data-toggle="collapse" data-target=".navbar-collapse"
                  aria-controls="navbar-collapse" aria-expanded="false"
                  aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="logo col-lg-3 text-center text-lg-left ">
                  <div class="logo text-lg-left ">
                    <a class="d-block" href="index.jsp">
                     <img src="images/logo.png" alt="Gaint Cat">
                    </a>
                  </div>
                </div>
                <div id="navbar-collapse" class="collapse navbar-collapse">
                  <ul class="nav navbar-nav mr-auto">
                    <li class="nav-item"><a class="nav-link" href="shopGrid">Products</a></li>
                    <li class="nav-item dropdown"><a href="#"
                      class="nav-link dropdown-toggle" data-toggle="dropdown">Pet Services <i class="fa fa-angle-down ms-1"></i>
                    </a>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="projects-single.html">Adoption</a></li>
                      </ul></li>
                    <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                    
                    <% if(request.getParameter("memberName") == "") { %>
                    <li class="nav-item">
                      <a class="nav-link" href="login.jsp"><i class="fa-solid fa-circle-user"></i>Login</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="signup"><i class="fa-solid fa-user-plus"></i> Sign Up</a>
                    </li>
                    <% } else { %>
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="javascript:void(0)" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Hi! <%=request.getParameter("memberName")%> <i class="fa fa-angle-down ms-1"></i>
                      </a>
                      <ul class="dropdown-menu" role="menu">
                        <% if(request.getParameter("memberAuthority").equals("admin")) { %>
                        <li><a class="dropdown-item border-bottom-0" href="admin.jsp">Admin Page</a></li>
                        <% } else { %>
                        <li><a class="dropdown-item border-bottom-0" href="member.jsp">Member Page</a></li>
                        <% } %>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="logout">Log Out</a></li>
                      </ul>
                    </li>
                    <% } %>
                    <li class="nav-item"><a class="nav-link" href="cart"><i class="fa fa-shopping-cart"></i><span class="ms-2 header-cart-qty"><%=(cartQty != 0) ? cartQty : ""%></span></a></li>
                    <!--<li class="nav-item"><a class="nav-link" href="#"><i class="fa fa-heart"></i><span> 1</span></a></li>-->
                  </ul>
                </div>
              </nav>
            </div>
            <!--/ Col end -->
            </div>
          <!--/ Row end -->
          <!-- Site search Start-->
          <div class="nav-search">
            <span id="search"><i class="fa fa-search"></i></span>
          </div>
          <div class="search-block" style="display: none">
            <label for="search-field" class="w-100 mb-0"> <input
              type="text" class="form-control" id="search-field"
              placeholder="Type what you want and enter">
            </label> <span class="search-close">&times;</span>
          </div>
          <!-- Site search end -->
        </div>
        <!-- Container end -->
      </div>
      <!-- Navigation end -->
    </header>
    <!-- Header end -->