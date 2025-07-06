<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form"%>
<!-- ✅ THÊM DÒNG NÀY -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard - Laptop Shop</title>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
      rel="stylesheet"
    />
    <link href="/css/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
      <jsp:include page="../layout/sidebar.jsp" />
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Manager Users</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
              <li class="breadcrumb-item"><a href="/admin/user">User</a></li>
              <li class="breadcrumb-item active">Create</li>
            </ol>
            <div class="container mt-5">
              <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                  <div class="card shadow">
                    <div class="card-body">
                      <h3 class="text-center mb-4">CREATE A USER</h3>

                      <!-- ✅ Mở thẻ form:form đúng cách -->
                      <form:form
                        action="/admin/user/create"
                        method="post"
                        modelAttribute="newUser"
                      >
                        <div class="mb-3">
                          <label for="email" class="form-label">Email</label>
                          <form:input
                            type="email"
                            class="form-control"
                            id="email"
                            path="email"
                            required="true"
                          />
                        </div>
                        <div class="mb-3">
                          <label for="password" class="form-label"
                            >Password</label
                          >
                          <form:input
                            type="password"
                            class="form-control"
                            id="password"
                            path="password"
                            required="true"
                          />
                        </div>
                        <div class="mb-3">
                          <label for="fullName" class="form-label"
                            >Full Name</label
                          >
                          <form:input
                            type="text"
                            class="form-control"
                            id="fullName"
                            path="fullName"
                            required="true"
                          />
                        </div>
                        <div class="mb-3">
                          <label for="address" class="form-label"
                            >Address</label
                          >
                          <form:textarea
                            class="form-control"
                            id="address"
                            path="address"
                            rows="3"
                          />
                        </div>
                        <div class="mb-3">
                          <label for="phone" class="form-label">Phone</label>
                          <form:input
                            type="tel"
                            class="form-control"
                            id="phone"
                            path="phone"
                          />
                        </div>
                        <div class="d-grid">
                          <button type="submit" class="btn btn-primary">
                            Create User
                          </button>
                        </div>
                      </form:form>
                      <!-- ✅ Đóng thẻ form:form đúng cách -->
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
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="js/scripts.js"></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="js/datatables-simple-demo.js"></script>
  </body>
</html>
