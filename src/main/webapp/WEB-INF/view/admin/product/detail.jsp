<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Product Detail - Laptop Shop</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Products</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/product">Product</a></li>
                                    <li class="breadcrumb-item active">Detail</li>
                                </ol>

                                <div class="row">
                                    <div class="col-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h5 class="mb-0">Product Detail - ID: ${products.id}</h5>
                                            </div>
                                            <div class="card-body">
                                                <div class="row">
                                                    <!-- Product Image -->
                                                    <div class="col-md-4 mb-3">
                                                        <c:choose>
                                                            <c:when test="${not empty products.image}">
                                                                <img src="/images/product/${products.image}"
                                                                    alt="${products.name}"
                                                                    class="img-fluid rounded border"
                                                                    style="max-height: 300px; width: 100%; object-fit: cover;">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="text-center border rounded p-5 bg-light">
                                                                    <i class="fas fa-image fa-3x text-muted mb-2"></i>
                                                                    <p class="text-muted">No Image</p>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>

                                                    <!-- Product Information Table -->
                                                    <div class="col-md-8">
                                                        <table class="table table-striped">
                                                            <tbody>
                                                                <tr>
                                                                    <td><strong>ID</strong></td>
                                                                    <td>${products.id}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td><strong>Name</strong></td>
                                                                    <td>${products.name}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td><strong>Price</strong></td>
                                                                    <td>
                                                                        <fmt:formatNumber value="${products.price}"
                                                                            type="currency" currencySymbol="₫"
                                                                            groupingUsed="true" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td><strong>Factory</strong></td>
                                                                    <td>${products.factory}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td><strong>Target</strong></td>
                                                                    <td>${products.target}</td>
                                                                </tr>
                                                                <c:if test="${not empty products.quantity}">
                                                                    <tr>
                                                                        <td><strong>Quantity</strong></td>
                                                                        <td>${products.quantity}</td>
                                                                    </tr>
                                                                </c:if>
                                                                <c:if test="${not empty products.sold}">
                                                                    <tr>
                                                                        <td><strong>Sold</strong></td>
                                                                        <td>${products.sold}</td>
                                                                    </tr>
                                                                </c:if>
                                                                <c:if test="${not empty products.shortDesc}">
                                                                    <tr>
                                                                        <td><strong>Short Description</strong></td>
                                                                        <td>${products.shortDesc}</td>
                                                                    </tr>
                                                                </c:if>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>

                                                <!-- Detail Description -->
                                                <c:if test="${not empty products.detailDesc}">
                                                    <div class="row mt-3">
                                                        <div class="col-12">
                                                            <h6>Detail Description:</h6>
                                                            <div class="border rounded p-3 bg-light">
                                                                ${products.detailDesc}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>

                                                <!-- Action Buttons -->
                                                <div class="row mt-4">
                                                    <div class="col-12">
                                                        <a href="/admin/product" class="btn btn-secondary">
                                                            <i class="fas fa-arrow-left"></i> Back
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>
            </body>

            </html>