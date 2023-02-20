<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="./css/jquery-ui.min.css">
<style type="text/css">
.product-item .product-item-pic {
	background-position: center;
	background-repeat: no-repeat;
}
#product-pagination span.page-link {
	margin-right: 8px;
}

#product-pagination li.active span.page-link {
	background: #249BC8;
  	border-color: #D2E9FF;
}
#price-range-select .form-check-label {
	color: #666;
}
</style>

<!-- JavaScript Files -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</head>

<!-- Body Inner Start -->
<body>
	<!-- Menu Section Start -->
	<jsp:include page="includeFile/menu.jsp">
	  <jsp:param name="memberName" value="<%=memberName%>" />
	  <jsp:param name="memberAuthority" value="<%=memberAuthority%>" />
	</jsp:include>
	<!-- Menu Section End -->
	
	<!-- Product Section Begin -->
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="images/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb-text">
						<h2>Gaint Cat</h2>
						<div class="breadcrumb-option">
							<span>Shop for Pet Products Online</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	
	<section class="container-fluid py-5 px-4 bg-white">
	  <div class="row py-3 g-lg-5">
	    <!-- Side bar start -->
	    <div class="col-lg-3 col-md-6 col-12 sidebar">
	      
	      
	      <div class="sidebar-item">
	        <h4>Category</h4>
	        <div class="accordion accordion-flush" id="accordion">
	        
	        <c:forEach var="category" items="${requestScope.categorys}" varStatus="loop">
	          <div class="accordion-item">
	            <h2 class="accordion-header" id="heading-${category.id}">
	              <button class="accordion-button" type="button" data-bs-toggle="collapse" 
	                  data-bs-target="#collapse-${category.id}"
	                  aria-expanded="${loop.index eq 0 ? true : false}"
	                  aria-controls="collapse${category.id}">
	                  ${category.name}
	              </button>
	            </h2>

	            <c:set var="showClass" value="show" />
	            <c:set var="hide" value="" />
	            <div id="collapse-${category.id}"
	                class="accordion-collapse collapse ${loop.index eq 0 ? showClass : hide}"
	                aria-labelledby="heading-${category.id}" data-bs-parent="#accordion">
	              <div class="accordion-body p-0">
	                <div class="list-group rounded-0">
	                <c:forEach var="childCategory" items="${category.childCategories}">
	                <a href="javascript:void(0)"
	                   class="list-group-item list-group-item-action category-link" 
	                   data-cateid="${childCategory.id}">
	                   ${childCategory.name}
	                </a>
	                </c:forEach>
	                </div>
	              </div>
	            </div>
	          </div>
	          </c:forEach>
	        
	        </div>
	      </div>
	      
	      <div class="sidebar-item">
	        <h4>Price Range</h4>
	        <div id="price-range-select">
	          <div class="form-check">
	            <input class="form-check-input" type="radio" name="priceRange" value="1" id="range-1">
	            <label class="form-check-label" for="range-1">&lt; $10</label>
	          </div>
	          <div class="form-check">
	            <input class="form-check-input" type="radio" name="priceRange" value="2" id="range-2">
	            <label class="form-check-label" for="range-2">$10 ~ $40</label>
	          </div>
	          <div class="form-check">
	            <input class="form-check-input" type="radio" name="priceRange" value="3" id="range-3">
	            <label class="form-check-label" for="range-3">$40 ~ $70</label>
	          </div>
	          <div class="form-check">
	            <input class="form-check-input" type="radio" name="priceRange" value="4" id="range-4">
	            <label class="form-check-label" for="range-4">$70 ~ $100</label>
	          </div>
	          <div class="form-check">
	            <input class="form-check-input" type="radio" name="priceRange" value="5" id="range-5">
	            <label class="form-check-label" for="range-5">&gt; $100</label>
	          </div>
	          <button type="button" id="price-select-btn" class="btn btn-primary">GO</button>
	        </div>
	      </div>
	      
	      <div class="sidebar-item">
	        <h4>Brands</h4>
	        <div id="brand-show">
	        
	        <c:forEach var="brands" items="${requestScope.brands}">
	        <label class="checkbox-container">
	          ${brands.brandName}
	          <input name="brand[]" type="checkbox" value="${brands.id}" class="brand-checkbox">
	          <span class="checkmark"></span>
	        </label>
	        </c:forEach>
	        
	        </div>
	      </div>
	      
	    </div>
	    <!-- Side bar end -->
	    
	    <!-- product show start -->
	    <div class="col-lg-9 col-md-6 col-12">
	      <div class="product-discount">
	        <h4 class="mb-4">Products</h4>
	        <div class="row mb-3">
	          <div class="col-12">
	            <nav aria-label="breadcrumb">
	              <ol class="breadcrumb">
	                <li class="breadcrumb-item"><a href="./">Home</a></li>
	                <li class="breadcrumb-item"><a href="shopGrid">product</a></li>
	                <li id="breadcrumb-last-child" class="breadcrumb-item active" aria-current="page">All Products</li>
	              </ol>
	            </nav>
	          </div>  
	        </div>
	        <div class="row justify-content-between mb-3">
	          <div class="col-6 col-lg-4">
	             <div class="filter-sort">
	               <span class="me-2">Sort By</span>
	               <span><select class="form-select form-select-sm" name="orderBy" id="orderBySelector">
	                 <option value="0" selected>Price: Low to High</option>
	                 <option value="1">Price: High to Low</option>
	               </select></span>
	               <input type="hidden" id="clickType" name="clickType" value="category">
	             </div>
	          </div>
	          <div class="col-6 col-lg-4">
	             <div class="filter-found text-dark text-end"><span class="fw-bold" id="total-product"></span> Products found</div>
	          </div>
	        </div>
	        <div class="row row-cols-1 row-cols-md-1 row-cols-lg-3 g-lg-5" id="product-show">
	          <!-- 產品清單 -->
	        </div>
	        
	        <div class="row justify-content-center">
	          <div class="col-12 col-lg-6">
	            <nav aria-label="Page navigation">
	              <ul class="pagination justify-content-center" id="product-pagination">
	                <!-- 數字分頁 -->
	              </ul>
	            </nav>
	          </div>
	        </div>
	      </div>
	    </div>
	    
	    <!-- product show end -->
	  </div> 
	</section>
	<%@ include file="includeFile/footer.jsp"%>
	<%@ include file="includeFile/toast.html"%>
	
	<script src="./js/jquery-ui.min.js"></script>
	<script src="./js/script.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {
		// 頁面載入後，顯示預設的商品清單
		productShowByCategory(0, 1);
		
		// 點選分類選項時切換狀態與呼叫相對應的產品清單
		$('.category-link').on('click', function() {
			// 切換分類清單的點選狀態 class
			$('.list-group-item').removeClass('active');
			$(this).addClass('active');
			
			//更新 breadcrumb 的內容
			$('#breadcrumb-last-child').text('Category: ' + $(this).text());
			
			// 提供排序選單切換時的辨識標籤，此處讓標籤記錄為 category
			$('input#clickType').val('category');
			
			// 若 brand 有選擇，則清除選擇狀態
			$('input[name="brand[]"').prop('checked', false);
			
			// 若 price range 有選擇，則清除狀態
			$('input[name="priceRange"]').prop('checked', false);
			
			// 取得點選的分類 ID，並將取得的ID導入呼叫產品清單的function中
			let cateId = $(this).data('cateid');
			productShowByCategory(cateId, 1);
		});
		
		// 選擇金額，將取得的範圍代表值導入呼叫產品清單的function中
		$('#price-select-btn').on('click', function() {
			let priceRange = $('input[name="priceRange"]:checked');
			if(priceRange.length != 0) {
				//更新 breadcrumb 的內容
				let rangeText = priceRange.parent('div').children('label').text();
				$('#breadcrumb-last-child').text('Price Range: ' + rangeText);
				
				$('input#clickType').val('price');
				$('.list-group-item').removeClass('active');
				$('input[name="brand[]"').prop('checked', false);
				productShowByPriceRange(priceRange.val(), 1);
			}
		});
		
		// 當 brand 選單被點選時，蒐集所有被點選的 brand ID，將取得的ID導入呼叫產品清單的function中
		$('.brand-checkbox').on('click', function() {
			// 若 category 有選擇，則移除 active class
			$('.list-group-item').removeClass('active');
			
			// 若 price range 有選擇，則清除狀態
			$('input[name="priceRange"]').prop('checked', false);
			
			let brandArray = [];
			let brandNameArray = [];
			$('input[name="brand[]"').each(function() {
				if($(this).prop('checked')) {
					brandNameArray.push($(this).parent('label').text().trim());
					brandArray.push($(this).val());
				}
			});
			
			//更新 breadcrumb 的內容
			$('#breadcrumb-last-child').text('Brands: ' + brandNameArray.join(', '));
			
			// 提供排序選單切換時的辨識標籤，此處讓標籤記錄為 brand
			$('input#clickType').val('brand');
			
			if (brandArray.length != 0) {
				// 將廠商 ID 陣列轉換為 string 後導入呼叫產品清單的 function 中
				productShowByBrand(brandArray.toString(), 1);
			} else {
				// 當使用者沒做任何選取則恢復預設的抓取規則
				productShowByCategory(0, 1);
			}
		});
		
		// 排序選單切換
		$('#orderBySelector').on('change', function() {
			pageChange();
		});
		
		// 數字分頁綁定點擊事件
		$(document).on('click', '#product-pagination a', function() {
			let page = $(this).data('page');
			pageChange(page);
		});
		
		// 加入購物車
		$(document).on('click', '.addToCart', function() {
			let pid = $(this).data('pid');
			addToCart(pid);
		});
	});
	
	// 商品加入購物車 (未完成)
	function addToCart(pid) {
		$.ajax({
			method: 'GET',
			url: './addToCart?pid=' + pid + '&qty=1',
			dataType: 'json'
		}).done(function(data) {
			const toastElement = $('#liveToast');
			toastElement.addClass('bg-success text-white');
			toastElement.find('.toast-body').html('<i class="fa-solid fa-circle-check"></i> Item added to cart');
			const toast = new bootstrap.Toast(toastElement);
			toast.show();
			
			let totalQqty = 0;
			$.each(data, function(index, obj) {
				totalQqty += obj.quantity;
			});
			$('.header-cart-qty').html(totalQqty);
		});
	}
	
	// 數字分頁切換
	function pageChange(page = "") {
		let pageForShow = (page == "") ? 1 : page;
		let clickType = $('input#clickType').val();
		if (clickType == 'category') {
			const activeCategory = $('.list-group-item.active');
			const cateId = (activeCategory.length != 0) ? activeCategory.data('cateid') : 0;
			productShowByCategory(cateId, pageForShow);
		} else if(clickType == 'brand') {
			let brandArray = [];
			$('input[name="brand[]"').each(function() {
				if($(this).prop('checked')) {
					brandArray.push($(this).val());
				}
			});
			productShowByBrand(brandArray.toString(), pageForShow);
		} else {
			let priceRange = $('input[name="priceRange"]:checked').val();
			productShowByPriceRange(priceRange, pageForShow);
		}
	}
	
	// 透過產品分類取得產品清單 (頁面載入時預設執行這個 method)
	// 傳入參數:
	// category: 分類ID
	// page: 所在頁數
	function productShowByCategory(category = "", page = 1) {
		let sort = $('#orderBySelector').val();
		$.ajax({
			method: 'GET',
			url: './getPrd/category?category=' + category + '&sort=' + sort + '&page=' + page,
			dataType: 'json'
		}).done(function(data) {
			productListShow(data.products);
			paginationShow(data.totalPage, page);
			$("#total-product").html(data.totalRow);
		});
	}
	
	// 透過售價範圍取得產品清單
	// 傳入參數:
	// range: 售價範圍代表值
	// page: 所在頁數
	function productShowByPriceRange(range, page = 1) {
		let sort = $('#orderBySelector').val();
		$.ajax({
			method: 'GET',
			url: './getPrd/priceRange?range=' + range + '&sort=' + sort + '&page=' + page,
			dataType: 'json'
		}).done(function(data) {
			productListShow(data.products);
			paginationShow(data.totalPage, page);
			$("#total-product").html(data.totalRow);
		});
	}
	
	// 透過廠商清單取得產品清單
	// 傳入參數:
	// brand: 廠商ID 所組合成的字串
	// page: 所在頁數
	function productShowByBrand(brand, page = 1) {
		let sort = $('#orderBySelector').val();
		$.ajax({
			method: 'GET',
			url: './getPrd/brand?brand=' + brand + '&sort=' + sort + '&page=' + page,
			dataType: 'json'
		}).done(function(data) {
			productListShow(data.products);
			paginationShow(data.totalPage, page);
			$("#total-product").html(data.totalRow);
		});
	}
	
	// 將產品清單 json 資料轉換為 HTML 元素放入畫面之中
	function productListShow(data) {
		let productShow = $('#product-show');
		let productHTML = '';
		let socialLink = '<ul class="product-item-pic-hover">';
		socialLink += '<li><a href="javascript:void(0)"><i class="fa fa-heart"></i></a></li>';
		socialLink += '<li><a href="javascript:void(0)"><i class="fa fa-retweet"></i></a></li>';
		socialLink += '<li><a href="javascript:void(0)" class="addToCart"><i class="fa fa-shopping-cart"></i></a></li>';
		socialLink += '</ul>';
		let i = 0;
		$.each(data, function() {
			productHTML += '<div class="col">';
			productHTML += '<div class="product-item">';
			productHTML += '<div class="product-item-pic set-bg" style="background-image: url(images/product/' + data[i].small_img + ')">';
			productHTML += '<ul class="product-item-pic-hover">';
			productHTML += '<li><a href="javascript:void(0)"><i class="fa fa-heart"></i></a></li>';
			productHTML += '<li><a href="javascript:void(0)"><i class="fa fa-retweet"></i></a></li>';
			productHTML += '<li><a href="javascript:void(0)" class="addToCart" data-pid="' + data[i].id + '"><i class="fa fa-shopping-cart"></i></a></li>';
			productHTML += '</ul>';
			productHTML += '</div>';
			productHTML += '<div class="product-item-text">';
			productHTML += '<h6 class="product-title">';
			productHTML += '<a href="prdDetal?pid=' + data[i].id + '">' + data[i].title + '</a>';
			productHTML += '</h6>';
			productHTML += '<h5 class="product-price">$' + data[i].price + '</h5>';
			productHTML += '</div>';
			productHTML += '</div>';
			productHTML += '</div>';
			i++;
		});
		productShow.html(productHTML);
	}
	
	// 產生數字分頁
	function paginationShow(totalPage, activePage) {
		let previous = activePage - 1;
		let next = activePage + 1;
		let paginationHTML = "";
		
		if (totalPage == 1 || previous == 0) {
			paginationHTML += '<li class="page-item disabled"><span class="page-link">&laquo;</span></li>';
		} else {
			paginationHTML += '<li class="page-item"><a href="javascript:void(0)" class="page-link" data-page="' + previous + '">&laquo;</a></li>';
		}
		
		for (let i = 1; i <= totalPage; i++) {
			if (i == activePage) {
				paginationHTML += '<li class="page-item active" aria-current="page"><span class="page-link">' + i + '</span></li>';
			} else {
				paginationHTML += '<li class="page-item"><a class="page-link" href="javascript:void(0)" data-page="' + i + '">' + i + '</a></li>';
			}
		}
		
		if (next > totalPage) {
			paginationHTML += '<li class="page-item disabled"><span class="page-link">&raquo;</span></li>';
		} else {
			paginationHTML += '<li class="page-item"><a href="javascript:void(0)" class="page-link" data-page="' + next + '">&raquo;</a></li>';
		}
		
		$('#product-pagination').html(paginationHTML);
	}
	</script>
</body>
<!-- Body Inner End -->
</html>