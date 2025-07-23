<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <meta charset="utf-8" />
          <title>Fruitables - Vegetable Website Template</title>
          <meta content="width=device-width, initial-scale=1.0" name="viewport" />
          <meta content="" name="keywords" />
          <meta content="" name="description" />

          <!-- Google Web Fonts -->
          <link rel="preconnect" href="https://fonts.googleapis.com" />
          <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
          <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
            rel="stylesheet" />

          <!-- Icon Font Stylesheet -->
          <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
          <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />

          <!-- Libraries Stylesheet -->
          <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
          <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />

          <!-- Customized Bootstrap Stylesheet -->
          <link href="/client/css/bootstrap.min.css" rel="stylesheet" />

          <!-- Template Stylesheet -->
          <link href="/client/css/style.css" rel="stylesheet" />
        </head>

        <body>
          <jsp:include page="../layout/header.jsp" />

          <!-- Hero Start -->
          <jsp:include page="../layout/banner.jsp" />
          <!-- Hero End -->

          <!-- Featurs Section Start -->
          <jsp:include page="../layout/feature.jsp" />
          <!-- Featurs Section End -->

          <!-- Fruits Shop Start-->
          <div class="container-fluid fruite py-5">
            <div class="container py-5">
              <div class="tab-class text-center">
                <div class="row g-4">
                  <div class="col-lg-4 text-start">
                    <h1>Our Organic Products</h1>
                  </div>
                  <div class="col-lg-8 text-end">
                    <ul class="nav nav-pills d-inline-flex text-center mb-5">
                      <li class="nav-item">
                        <a class="d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill" href="#tab-1">
                          <span class="text-dark" style="width: 130px">All Products</span>
                        </a>
                      </li>
                    </ul>
                  </div>
                </div>
                <div class="tab-content">
                  <div id="tab-1" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                      <div class="col-lg-12">
                        <div class="row g-4">
                          <c:forEach var="product" items="${products}">

                            <div class="col-md-6 col-lg-4 col-xl-3">
                              <a href="/product/${product.id}">
                                <div class="rounded position-relative fruite-item">
                                  <div class="fruite-img">
                                    <img src="/images/product/${product.image}" class="img-fluid w-100 rounded-top"
                                      alt="${product.name}" style="height: 180px; object-fit: cover;" />
                                  </div>
                                  <div class="text-white bg-secondary px-2 py-1 rounded position-absolute"
                                    style="top: 8px; left: 8px; font-size: 0.75rem;">
                                    ${product.factory}
                                  </div>
                                  <div class="p-3 border border-secondary border-top-0 rounded-bottom">
                                    <h4
                                      style="height: 2.2em; overflow: hidden; line-height: 1.1em; margin-bottom: 0.75rem;">
                                      ${product.name}
                                    </h4>
                                    <p
                                      style="height: 2.4em; overflow: hidden; font-size: 0.85rem; line-height: 1.2em; margin-bottom: 1rem;">
                                      ${product.shortDesc}
                                    </p>
                                    <div class="d-flex justify-content-between flex-lg-wrap" style="gap: 0.5rem;">
                                      <p class="text-dark fs-6 fw-bold mb-0">
                                        <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫"
                                          groupingUsed="true" />
                                      </p>
                                      <form action="/add-product-to-cart/${product.id}" method="post">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <button type="submit"
                                          class="btn border border-secondary rounded-pill px-2 text-primary"
                                          style="font-size: 0.8rem; padding-top: 0.25rem; padding-bottom: 0.25rem;">
                                          <i class="fa fa-shopping-bag me-1 text-primary"></i>
                                          Add to cart
                                        </button>
                                      </form>
                                    </div>
                                  </div>
                                </div>
                              </a>

                            </div>


                          </c:forEach>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- Fruits Shop End-->

          <!-- Footer -->
          <jsp:include page="../layout/footer.jsp" />
          <!-- JavaScript Libraries -->
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
          <script src="client/lib/easing/easing.min.js"></script>
          <script src="client/lib/waypoints/waypoints.min.js"></script>
          <script src="client/lib/lightbox/js/lightbox.min.js"></script>
          <script src="client/lib/owlcarousel/owl.carousel.min.js"></script>

          <!-- Template Javascript -->
          <script src="client/js/main.js"></script>
        </body>

        </html>