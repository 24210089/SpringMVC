<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <style>
          .dropdown-toggle.no-arrow::after {
            display: none;
          }

          .user-dropdown {
            min-width: 250px;
            right: 0 !important;
            left: auto !important;
            transform: none !important;
          }

          .user-info {
            padding: 15px 20px;
            border-bottom: 1px solid #dee2e6;
            background-color: #f8f9fa;
          }

          .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #e3e6ea;
          }

          .user-dropdown .dropdown-item {
            padding: 10px 20px;
            transition: all 0.3s ease;
          }

          .user-dropdown .dropdown-item:hover {
            background-color: #f8f9fa;
            transform: translateX(5px);
          }
        </style>
        <!-- Spinner Start -->
        <div id="spinner"
          class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
          <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->

        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
          <div class="container px-0">
            <nav class="navbar navbar-light bg-white navbar-expand-xl">
              <a href="/" class="navbar-brand">
                <h1 class="text-primary display-6">LaptopShop</h1>
              </a>
              <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarCollapse">
                <span class="fa fa-bars text-primary"></span>
              </button>
              <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                <div class="navbar-nav me-auto">
                  <a href="/" class="nav-item nav-link active">Trang Chủ</a>
                  <a href="/products" class="nav-item nav-link">Sản phẩm</a>
                </div>
                <div class="d-flex m-3 me-0">
                  <!-- Hiển thị icon giỏ hàng chỉ khi đã đăng nhập -->
                  <c:if test="${not empty pageContext.request.userPrincipal}">
                    <a href="#" class="position-relative me-4 my-auto">
                      <i class="fa fa-shopping-bag fa-2x"></i>
                      <span
                        class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                        style="top: -5px; left: 15px; height: 20px; min-width: 20px">
                        ${sessionScope.sum}
                      </span>
                    </a>
                  </c:if>

                  <!-- Hiển thị dropdown user chỉ khi đã đăng nhập -->
                  <c:if test="${not empty pageContext.request.userPrincipal}">
                    <div class="nav-item dropdown">
                      <a href="#" class="nav-link dropdown-toggle my-auto no-arrow" data-bs-toggle="dropdown">
                        <i class="fas fa-user fa-2x"></i>
                      </a>
                      <div class="dropdown-menu dropdown-menu-end user-dropdown bg-white shadow border">
                        <!-- Thông tin người dùng -->
                        <div class="user-info d-flex align-items-center">
                          <c:choose>
                            <c:when test="${not empty currentUser and not empty currentUser.avatar}">
                              <img src="/images/avatar/${currentUser.avatar}" alt="Avatar" class="user-avatar me-2">
                            </c:when>
                            <c:otherwise>
                              <img src="/images/avatar-default.jpg" alt="Avatar" class="user-avatar me-2">
                            </c:otherwise>
                          </c:choose>
                          <div>
                            <div class="fw-bold small">
                              <c:choose>
                                <c:when test="${not empty currentUser}">
                                  <c:out value="${currentUser.fullName}" />
                                </c:when>
                                <c:otherwise>
                                  <c:out value="${pageContext.request.userPrincipal.name}" />
                                </c:otherwise>
                              </c:choose>
                            </div>
                            <c:if test="${not empty currentUser}">
                              <div class="text-muted small">
                                <c:out value="${currentUser.email}" />
                              </div>
                            </c:if>
                          </div>
                        </div>
                        <!-- Menu items -->
                        <a href="/account" class="dropdown-item py-2">
                          <i class="fas fa-user-cog me-2"></i>Quản lý tài khoản
                        </a>
                        <a href="/order-history" class="dropdown-item py-2">
                          <i class="fas fa-history me-2"></i>Lịch sử mua hàng
                        </a>
                        <div class="dropdown-divider"></div>
                        <form action="/logout" method="post">
                          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                          <button class="dropdown-item py-2 text-danger">
                            <i class="fas fa-sign-out-alt me-2"></i>Đăng xuất
                          </button>
                        </form>

                      </div>
                    </div>
                  </c:if>

                  <!-- Hiển thị nút đăng nhập khi chưa đăng nhập -->
                  <c:if test="${empty pageContext.request.userPrincipal}">
                    <a href="/login" class="btn btn-outline-primary">Đăng nhập</a>
                    <a href="/register" class="btn btn-outline-primary mx-2">Đăng ký</a>
                  </c:if>
                </div>
              </div>
            </nav>
          </div>
        </div>
        <!-- Navbar End -->

        <!-- Modal Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-fullscreen">
            <div class="modal-content rounded-0">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body d-flex align-items-center">
                <div class="input-group w-75 mx-auto d-flex">
                  <input type="search" class="form-control p-3" placeholder="keywords"
                    aria-describedby="search-icon-1" />
                  <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Modal Search End -->