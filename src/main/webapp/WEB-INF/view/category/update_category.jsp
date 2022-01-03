<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/vendor/bootstrap/css/bootstrap.min.css">
<meta name=?viewport? content=?width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="robots" content="all,follow">
<!-- gLightbox gallery-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/vendor/glightbox/css/glightbox.min.css">
<!-- Range slider-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/vendor/nouislider/nouislider.min.css">
<!-- Choices CSS-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/vendor/choices.js/public/assets/styles/choices.min.css">
<!-- Swiper slider-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/vendor/swiper/swiper-bundle.min.css">
<!-- Google fonts-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@300;400;700&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Martel+Sans:wght@300;400;800&amp;display=swap">
<!-- theme stylesheet-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/style.default.css" id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/static/img/favicon.png">'

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

<html>
    <head>
    <title>Document</title>
</head>
<body>
        <div class="container bg-light">
            <!--  Modal -->
                <section class="py-5">
                    <div class="container">
                        <div class="row mb-5">
                            <div class="col-lg-6">
                                <!-- PRODUCT SLIDER-->
                                <form:form modelAttribute="category" method="post" action="${pageContext.request.contextPath}/category/update">
                                <div class="row">
                                    <div class="col-md-6 d-flex justify-content-center">
                                        <table border="0" cellpadding="5" class="">
                                            <tr>
                                                <td>ID: </td>
                                                <td>${category.id}
                                                    <form:hidden path="id"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row m-sm-0">
                                    <div class="col-sm-2 p-sm-0 order-2 order-sm-1 mt-2 mt-sm-0 px-xl-2">
                                        <div class="swiper product-slider-thumbs">
                                            <div class="swiper-wrapper">
                                                <div class="swiper-slide h-auto swiper-thumb-item mb-3"><img class="w-100" src="<%=request.getContextPath()%>/static/img/product-detail-1.jpg" alt="..."></div>
                                                <div class="swiper-slide h-auto swiper-thumb-item mb-3"><img class="w-100" src="<%=request.getContextPath()%>/static/img/product-detail-2.jpg" alt="..."></div>
                                                <div class="swiper-slide h-auto swiper-thumb-item mb-3"><img class="w-100" src="<%=request.getContextPath()%>/static/img/product-detail-3.jpg" alt="..."></div>
                                                <div class="swiper-slide h-auto swiper-thumb-item mb-3"><img class="w-100" src="<%=request.getContextPath()%>/static/img/product-detail-4.jpg" alt="..."></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-10 order-1 order-sm-2">
                                        <div class="swiper product-slider">
                                            <div class="swiper-wrapper">
                                                <div class="swiper-slide h-auto"><a class="glightbox product-view" href="<%=request.getContextPath()%>/static/img/product-detail-1.jpg" data-gallery="gallery2" data-glightbox="Product item 1"><img class="img-fluid" src="<%=request.getContextPath()%>/static/img/product-detail-1.jpg" alt="..."></a></div>
                                                <div class="swiper-slide h-auto"><a class="glightbox product-view" href="<%=request.getContextPath()%>/static/img/product-detail-2.jpg" data-gallery="gallery2" data-glightbox="Product item 2"><img class="img-fluid" src="<%=request.getContextPath()%>/static/img/product-detail-2.jpg" alt="..."></a></div>
                                                <div class="swiper-slide h-auto"><a class="glightbox product-view" href="<%=request.getContextPath()%>/static/img/product-detail-3.jpg" data-gallery="gallery2" data-glightbox="Product item 3"><img class="img-fluid" src="<%=request.getContextPath()%>/static/img/product-detail-3.jpg" alt="..."></a></div>
                                                <div class="swiper-slide h-auto"><a class="glightbox product-view" href="<%=request.getContextPath()%>/static/img/product-detail-4.jpg" data-gallery="gallery2" data-glightbox="Product item 4"><img class="img-fluid" src="<%=request.getContextPath()%>/static/img/product-detail-4.jpg" alt="..."></a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- PRODUCT DETAILS-->
                            <div class="col-lg-6">
                                <ul class="list-inline mb-2 text-sm">
                                    <li class="list-inline-item m-0"><i class="fas fa-star small text-warning"></i></li>
                                    <li class="list-inline-item m-0 1"><i class="fas fa-star small text-warning"></i></li>
                                    <li class="list-inline-item m-0 2"><i class="fas fa-star small text-warning"></i></li>
                                    <li class="list-inline-item m-0 3"><i class="fas fa-star small text-warning"></i></li>
                                    <li class="list-inline-item m-0 4"><i class="fas fa-star small text-warning"></i></li>
                                </ul>
                                <div class="row align-items-center mb-4">
                                    <div class="col-sm-7 pr-sm-0">
                                        <div class="border d-flex align-items-center  py-1 px-3 bg-white border-white"><span class="small text-uppercase text-gray mr-4 pr-4 no-select">Category</span>
                                            <div class="p-3">
                                                <form:input class="form-control border-0 shadow-0 p-0" type="text" path="categoryName" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-5">
                                        <button class="btn btn-dark btn-sm w-100 h-100 d-flex align-items-center justify-content-center px-0">Update</button></div>
                                </div>
                        </div>
                        <!-- DETAILS TABS-->
                        <ul class="nav nav-tabs border-0" id="myTab" role="tablist">
                            <li class="nav-item"><a class="nav-link text-uppercase active" id="-tab" data-bs-toggle="tab" href="#" role="tab" aria-controls="" aria-selected="true">Description</a></li>
                        </ul>
                        <div class="tab-content mb-5" id="myTabContent">
                            <div class="tab-pane fade show active" id="" role="tabpanel" aria-labelledby="-tab">
                                <div class="p-4 p-lg-5 bg-white">
                                    <h6 class="text-uppercase">Product  </h6>

                                    <div class="row align-items-stretch mb-4">
                                        <div class="col-sm-8 mt-1 pr-sm-0">
                                            <div class="border mt-2 d-flex align-items-center py-4 px-3 bg-white border-white"><span class="small text-uppercase text-gray no-select">Category</span>
                                                    <form:textarea cssClass="form-control border-0 shadow-0 p-0" cssStyle="margin-left: 20px" path="description" />
                                            </div>
                                        </div>
                                    </div>
                                    </p>
                                </div>
                            </div>
                        </div>
                        </form:form>
                </section>
            <!-- JavaScript files-->
            <script src="<%=request.getContextPath()%>/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="<%=request.getContextPath()%>/static/vendor/glightbox/js/glightbox.min.js"></script>
            <script src="<%=request.getContextPath()%>/static/vendor/nouislider/nouislider.min.js"></script>
            <script src="<%=request.getContextPath()%>/static/vendor/swiper/swiper-bundle.min.js"></script>
            <script src="<%=request.getContextPath()%>/static/vendor/choices.js/public/assets/scripts/choices.min.js"></script>
            <script src="<%=request.getContextPath()%>/static/js/front.js"></script>
            <script>
                // ------------------------------------------------------- //
                //   Inject SVG Sprite -
                //   see more here
                //   https://css-tricks.com/ajaxing-svg-sprite/
                // ------------------------------------------------------ //
                // function injectSvgSprite(path) {
                //
                //     var ajax = new XMLHttpRequest();
                //     ajax.open("GET", path, true);
                //     ajax.send();
                //     ajax.onload = function(e) {
                //         var div = document.createElement("div");
                //         div.className = 'd-none';
                //         div.innerHTML = ajax.responseText;
                //         document.body.insertBefore(div, document.body.childNodes[0]);
                //     }
                // }
                // this is set to BootstrapTemple website as you cannot
                // inject local SVG sprite (using only 'icons/orion-svg-sprite.svg' path)
                // while using file:// protocol
                // pls don't forget to change to your domain :)
                <%--injectSvgSprite('https://bootstraptemple.com/<%=request.getContextPath()%>/static/icons/orion-svg-sprite.svg');--%>

            </script>
            <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        </div>
        </div>
</body>
</html>