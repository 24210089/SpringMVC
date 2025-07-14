<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
          <link href="/css/styles.css" rel="stylesheet" />
          <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
          Sau đó, thêm đoạn mã script sau để xử lý logic.
          <script>
            $(document).ready(() => {
              // 1. Lắng nghe sự kiện 'change' trên thẻ input file
              $("#avatarFile").change(function (e) {
                // 2. Lấy file người dùng vừa chọn và tạo một URL tạm thời
                const imgURL = URL.createObjectURL(e.target.files[0]);

                // 3. Gán URL tạm thời vào thuộc tính 'src' của thẻ img
                $("#avatarPreview").attr("src", imgURL);

                // 4. Thay đổi CSS để hiển thị thẻ img lên
                $("#avatarPreview").css({
                  display: "block",
                });
              });
            });
          </script>
        </head>

        <body class="sb-nav-fixed">
          <jsp:include page="../layout/header.jsp" />
          <div id="layoutSidenav">
            <jsp:include page="../layout/sidebar.jsp" />
            <div id="layoutSidenav_content">
              <main>
                <div class="container-fluid px-4">
                  <h1 class="mt-4">Dashboard</h1>
                  <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active">
                      <a href="/admin/product">Product</a>
                    </li>
                    <li class="breadcrumb-item active">Create</li>
                  </ol>
                  <div class="container-fluid">
                    <div class="row">
                      <div class="col-12 d-flex justify-content-center align-items-center">
                        <h3>Create a product</h3>
                      </div>
                      <div class="col-md-6 col-12 mx-auto">
                        <form:form method="post" action="/admin/product/create" modelAttribute="newProduct"
                          enctype="multipart/form-data">
                          <div class="row g-3 my-3">
                            <div class="col">
                              <label class="form-label is-invalid">Name:</label>
                              <c:set var="errorName">
                                <form:errors path="name" />
                              </c:set>

                              <form:input type="text" class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                path="name" />
                              <form:errors path="name" cssClass="invalid-feedback" />
                            </div>
                            <div class="col">
                              <label class="form-label is-invalid">Price:</label>
                              <c:set var="errorPrice">
                                <form:errors path="price" />
                              </c:set>
                              <form:input type="number" class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                                path="price" />
                              <form:errors path="price" cssClass="invalid-feedback" />
                            </div>
                          </div>

                          <div class="mb-3">
                            <label class="form-label is-invalid">Detail Description:</label>
                            <c:set var="errorDetailDesc">
                              <form:errors path="detailDesc" />
                            </c:set>
                            <form:textarea class="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}"
                              path="detailDesc" rows="3" />
                            <form:errors path="detailDesc" cssClass="invalid-feedback" />
                          </div>
                          <div class="row g-3 my-3">
                            <div class="col">
                              <label class="form-label is-invalid">Short Description:</label>
                              <c:set var="errorShortDesc">
                                <form:errors path="shortDesc" />
                              </c:set>
                              <form:textarea class="form-control ${not empty errorShortDesc ? 'is-invalid' : ''}"
                                path="shortDesc" rows="2" />
                              <form:errors path="shortDesc" cssClass="invalid-feedback" />
                            </div>
                            <div class="col">
                              <label class="form-label is-invalid">Quantity:</label>
                              <c:set var="errorQuantity">
                                <form:errors path="quantity" />
                              </c:set>
                              <form:input type="number"
                                class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}" path="quantity" />
                              <form:errors path="quantity" cssClass="invalid-feedback" />
                            </div>
                          </div>
                          <div class="row g-3 my-3">
                            <div class="col">
                              <label class="form-label">Factory:</label>
                              <form:select class="form-select" path="factory">
                                <form:option value="">-- Select Factory --</form:option>
                                <form:option value="APPLE">Apple</form:option>
                                <form:option value="ASUS">Asus</form:option>
                                <form:option value="LENOVO">Lenovo</form:option>
                                <form:option value="DELL">Dell</form:option>
                                <form:option value="LG">LG</form:option>
                                <form:option value="ACER">Acer</form:option>
                              </form:select>
                            </div>
                            <div class="col">
                              <label class="form-label">Target:</label>
                              <form:select class="form-select" path="target">
                                <form:option value="">-- Select Target --</form:option>
                                <form:option value="GAMING">Gaming</form:option>
                                <form:option value="SINHVIEN-VANPHONG">Sinh viên - Văn phòng</form:option>
                                <form:option value="THIET-KE-DO-HOA">Thiết kế đồ họa</form:option>
                                <form:option value="MONG-NHE">Mỏng nhẹ</form:option>
                                <form:option value="DOANH-NHAN">Doanh nhân</form:option>
                              </form:select>
                            </div>
                          </div>

                          <div class="mb-3">
                            <label for="productImgFile" class="form-label">Image:</label>
                            <input class="form-control" type="file" id="productImgFile" accept=".png, .jpg, .jpeg"
                              name="productImgFile" />
                            <div class="col-12 mb-3">
                              <img style="max-height: 250px; display: none" alt="Xem trước avatar" id="avatarPreview" />

                            </div>
                            <div class="col-12 mb-3"></div>
                            <div class="col-12 mb-5">
                              <a href="/admin/product" class="btn btn-secondary">Cancel</a>
                              <button type="submit" class="btn btn-primary">
                                Create
                              </button>
                            </div>
                        </form:form>
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