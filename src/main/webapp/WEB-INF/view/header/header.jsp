<div class="row">
    <header class="header bg-white">
        <div class="container px-lg-3">
            <nav class="navbar navbar-expand-lg navbar-light py-3 px-lg-0"><a class="navbar-brand" href="index.html"><span class="fw-bold text-uppercase text-dark">Roshaab</span></a>
                <button class="navbar-toggler navbar-toggler-end" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <!-- Link--><a class="nav-link active" href="index.html">Home</a>
                        </li>
                        <li class="nav-item">
                            <!-- Link--><a class="nav-link" href="shop.html">Shop</a>
                        </li>
                        <li class="nav-item">
                            <!-- Link--><a class="nav-link" href="detail.html">Product detail</a>
                        </li>
                        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="pagesDropdown" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
                            <div class="dropdown-menu mt-3 shadow-sm" aria-labelledby="pagesDropdown"><a class="dropdown-item border-0 transition-link" href="index.html">Homepage</a><a class="dropdown-item border-0 transition-link" href="shop.html">Category</a><a class="dropdown-item border-0 transition-link" href="detail.html">Product detail</a><a class="dropdown-item border-0 transition-link" href="cart.html">Shopping cart</a><a class="dropdown-item border-0 transition-link" href="checkout.html">Checkout</a></div>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/cart/shoppingCart"> <i class="bi bi-cart4"></i>Cart<small class="text-gray fw-normal">(<span id="cart-size"></span>)</small></a></li>
                        <li class="nav-item"><a class="nav-link" href="#!"> <i class="bi bi-heart-fill"></i><small class="text-gray fw-normal"> (<span id="fav-product-size"></span>)</small></a></li>
                        <li class="nav-item"><a class="nav-link" href="#!"> <i class="bi bi-person"></i>Login</a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>

</div>