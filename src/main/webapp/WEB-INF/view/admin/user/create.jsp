<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <!-- ✅ THÊM DÒNG NÀY -->
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <meta charset="utf-8" />
          <meta http-equiv="X-UA-Compatible" content="IE=edge" />
          <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
          <meta name="description" content="" />
          <meta name="author" content="" />
          <title>Dashboard - Laptop Shop</title>
          <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
          <link href="/css/styles.css" rel="stylesheet" />
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
          <script>
            $(document).ready(() => {
              const avatarFile = $("#avatarFile");
              avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr("src", imgURL);
                $("#avatarPreview").css({ display: "block" });
              });
            });
          </script>
          <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
                            <form:form action="/admin/user/create" method="post" modelAttribute="newUser"
                              enctype="multipart/form-data">
                              <div class="row g-3 my-3">
                                <div class="col">
                                  <c:set var="errorEmail">
                                    <form:errors path="email" cssClass="invalid-feedback" />
                                  </c:set>
                                  <label for="email" class="form-label is-invalid">Email</label>
                                  <form:input type="email" class="form-control ${not empty errorEmail?'is-invalid':''}"
                                    id="email" path="email" />
                                  ${errorEmail}
                                </div>
                                <div class="col">
                                  <c:set var="errorPassword">
                                    <form:errors path="password" cssClass="invalid-feedback" />
                                  </c:set>
                                  <label for="password" class="form-label is-invalid">Password</label>
                                  <form:input type="password"
                                    class="form-control ${not empty errorPassword?'is-invalid':''}" id="password"
                                    path="password" />
                                  ${errorPassword}
                                </div>
                              </div>
                              <div class="row g-3">
                                <div class="col">
                                  <c:set var="errorFullName">
                                    <form:errors path="fullName" cssClass="invalid-feedback" />
                                  </c:set>
                                  <label for="fullName" class="form-label is-invalid">Full Name</label>
                                  <form:input type="text"
                                    class="form-control ${not empty errorFullName?'is-invalid':''}" id="fullName"
                                    path="fullName" />
                                  ${errorFullName}
                                </div>
                                <div class="col">
                                  <c:set var="errorPhone">
                                    <form:errors path="phone" cssClass="invalid-feedback" />
                                  </c:set>
                                  <label for="phone" class="form-label is-invalid">Phone</label>
                                  <form:input type="tel" class="form-control ${not empty errorPhone?'is-invalid':''}"
                                    id="phone" path="phone" />
                                  ${errorPhone}
                                </div>
                              </div>
                              <div class="mb-3 my-3">
                                <label for="address" class="form-label">Address</label>
                                <form:textarea class="form-control" id="address" path="address" rows="3" />
                              </div>
                              <div class="row g-3">
                                <div class="col">
                                  <label for="role" class="form-label"> Role </label>
                                  <form:select class="form-select form-control" id="role" path="role.name"
                                    required="true">
                                    <form:option value="admin">Admin</form:option>
                                    <form:option value="user">User</form:option>
                                  </form:select>
                                </div>
                                <div class="col">
                                  <label for="avatarFile" class="form-label">Avatar</label>
                                  <input type="file" class="form-control" id="avatarFile" name="hoidanitFile"
                                    accept="image/*" />
                                </div>
                              </div>
                              <div class="col-12 mb-3">
                                <img style="max-height: 250px; display: none" alt="avatar preview" id="avatarPreview" />
                              </div>
                              <div class="d-flex justify-content-start my-3">
                                <button type="submit" class="btn btn-primary">
                                  Create
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
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
          <script src="js/scripts.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
            crossorigin="anonymous"></script>
          <script src="assets/demo/chart-area-demo.js"></script>
          <script src="assets/demo/chart-bar-demo.js"></script>
          <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
            crossorigin="anonymous"></script>
          <script src="js/datatables-simple-demo.js"></script>
        </body>

        </html>