<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="/css/style.css" rel="stylesheet" />
    <title>Admin Form</title>
  </head>
  <body>
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
                  <label for="password" class="form-label">Password</label>
                  <form:input
                    type="password"
                    class="form-control"
                    id="password"
                    path="password"
                    required="true"
                  />
                </div>
                <div class="mb-3">
                  <label for="fullName" class="form-label">Full Name</label>
                  <form:input
                    type="text"
                    class="form-control"
                    id="fullName"
                    path="fullName"
                    required="true"
                  />
                </div>
                <div class="mb-3">
                  <label for="address" class="form-label">Address</label>
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
  </body>
</html>
