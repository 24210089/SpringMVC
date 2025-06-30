<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <title>Update id = ${user.id}</title>
  </head>
  <body>
    <div class="container mt-5">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <h3 class="text-center mb-4">UPDATE USER</h3>
          <form action="/admin/user/update" method="post">
            <div class="mb-3">
              <label for="id" class="form-label">ID</label>
              <input
                type="text"
                class="form-control"
                id="id"
                name="id"
                value="${user.id}"
                readonly
              />
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">Email</label>
              <input
                type="email"
                class="form-control"
                id="email"
                name="email"
                value="${user.email}"
              />
            </div>
            <div class="mb-3">
              <label for="fullName" class="form-label">Full Name</label>
              <input
                type="text"
                class="form-control"
                id="fullName"
                name="fullName"
                value="${user.fullName}"
              />
            </div>
            <div class="mb-3">
              <label for="address" class="form-label">Address</label>
              <textarea
                class="form-control"
                name="address"
                id="address"
                rows="3"
              >
${user.address}</textarea
              >
            </div>
            <div class="mb-3">
              <label for="phone" class="form-label">Phone</label>
              <input
                type="tel"
                class="form-control"
                name="phone"
                id="phone"
                value="${user.phone}"
              />
            </div>
            <div class="d-flex justify-content-center gap-3">
              <a href="/admin/user" class="btn btn-secondary">Cancel</a>
              <button type="submit" class="btn btn-primary">Update</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
