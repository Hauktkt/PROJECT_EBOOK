<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="giaodien.css">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</head>
<body style="margin: 0px;">
    <header class="headr-css">
        <div class="search-main-menu">
            <form id="blog-post-search" class="search-form" action="" method="get">
                <input type="text" placeholder="Tên ebook..." name="ch" value="" class="search-field" autocomplete="off">
                <input type="submit" value="Search">
                
            <input type="hidden" name="post_type" value="wp-manga"><ul id="ui-id-1" tabindex="0" class="ui-menu ui-widget ui-widget-content ui-autocomplete ui-front" unselectable="on" style="display: none;"></ul></form>
        </div>
        <div class="main-nav">
            <div class="mm-nav">
                <div class="img-nav">
                    <a class="logo" href="../index.jsp" title="EBOOK - HOME">
                        <img data-perfmatters-preload="" width="200" height="100" class="img-responsive"
                        src="https://img.upanh.tv/2023/11/30/Screenshot-2023-11-30-112757_preview_rev_1.png" alt="Screenshot-2023-11-30-112757_preview_rev_1.png" alt="Ebook Truyện">
                    </a>
        
                </div>
        
                <div class="main-menu">
                    <ul class="item-menu">
                        <li id="item-mn-1" class="item-1">
                            <a href="../index.jsp" aria-current="page"><i class="fa-solid fa-house"></i> 
                                HOME</a>
                        </li>
                        <li id="item-mn-2" class="item-2">
                            <a href="../all_recent_book.jsp"><i class="fas fa-book-open"></i>
                                RECENT BOOK</a>
                        </li>
                        <li id="item-mn-3" class="item-3">
                            <a href="../all_new_book.jsp"><i class="fas fa-book-open"></i>
                                NEW BOOK</a>
                        </li>
                        <li id="item-mn-4" class="item-4">
                            <a href="../all_old_book.jsp"><i class="fas fa-book-open"></i>
                                OLD BOOK</a>
                        </li>
                    </ul>
                </div>
                
                <div class="search-nav">
                    <div class="search-navigation_wrap">
                        <a href="javascript:;" class="search-open" title="Tìm kiếm" style="visibility: hidden;"> 
                            <i class="icon ion-ios-search" style="color: red;"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="nav-bottom">
            <div class="sub-nav_content" style="visibility: hidden;"> 
                <a class="sub-nav_content_a" href=""><i class="fas fa-info-circle"></i> THÔNG TIN HỖ TRỢ</a></li>
                <a class="sub-nav_content_a" href=""><i class="far fa-question-circle"></i> CÂU HỎI THƯỜNG GẶP</a></li>
            </div>

            <c:if test="${not empty userobj}">
                <div class="c-modal_item">
                    <!-- Button trigger modal -->
                    <a href ="checkout.jsp" style="visibility: hidden;"><i class="fa-solid fa-cart-plus fa-2x" title="Giỏ hàng"></i> </a>
                    <a href="home.jsp" class="btn-active-modal" style="margin-right: 10px;">
                    	<i class="fa-solid fa-user" style="padding-right: 10px;"></i>${userobj.name}
                    </a>
                    <a data-toggle="modal" data-target="#exampleModalCenter" class="btn-active-modal" style="margin-right: 50px;color: #666;">Logout <i class="fa-solid fa-right-to-bracket"></i></a>
                </div>
            </c:if>
            <c:if test="${empty userobj}">
                <div class="c-modal_item">
                    <!-- Button trigger modal -->
                    <a href="login.jsp" class="btn-active-modal" style="margin-right: 10px;">Đăng nhập</a>
                    <a href="register.jsp" class="btn-active-modal" style="margin-right: 50px;">Đăng ký</a>
                </div>
            </c:if>

        </div>
        <!-- Logout modal -->

		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content" style="border-radius: 50px;background: radial-gradient(white,95%, black);">
					<div class="modal-header" style="justify-content: center;">
						<h5 class="modal-title" id="exampleModalLongTitle"> <i class="fa-regular fa-bell fa-2x"></i><i class="fa-regular fa-bell fa-2x"></i><i class="fa-regular fa-bell fa-2x"></i></h5>
					</div>
					<div class="modal-body">
						<div class="text-center">
							<h5 style="padding-bottom:20px">  Do You Want To Logout?</h5>
							<a href="../logout" type="button" class="btn btn-primary btn-center">Logout <i class="fa-solid fa-right-to-bracket"></i></a>
							<button type="button" class="btn btn-secondary btn-center"
								data-dismiss="modal">Close <i class="fa-solid fa-xmark"></i></button>
						</div>
					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>
		
		
		<!-- End Logout modal -->
    </header>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function() {
            $('a.search-open').click(function() {
                $(this).toggleClass('active');
                $('.search-main-menu').toggleClass('active');
            });
        });
    </script>
</body>
</html>