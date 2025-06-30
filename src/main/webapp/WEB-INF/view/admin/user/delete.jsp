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
    <title>Delete id = ${deleteUser.id}</title>
  </head>
  <body>
    <div class="container mt-5">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <form:form
            action="/admin/user/delete"
            method="post"
            modelAttribute="deleteUser"
          >
            <h3>Delete User id=${deleteUser.id}</h3>
            <div class="alert alert-danger" role="alert">
              Bạn có chắc chắn muốn xóa người dùng?
            </div>
            <form:input type="hidden" path="id" readonly="true" />
            <a href="/admin/user" class="btn btn-primary">Cancel</a>
            <button class="btn btn-danger" type="submit">Delete</button>
          </form:form>
        </div>
      </div>
    </div>
  </body>
</html>
