<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form"%>
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
    <title>Table User ${user.id}</title>
  </head>
  <body>
    <div class="container mt-5">
      <div class="row">
        <div class="col-12 mx-auto">
          <div class="d-flex justify-content-center">
            <h3>User Detail ${user.id}</h3>
          </div>
          <hr />
          <div class="card" style="width: 60%">
            <div class="card-header">User Information</div>
            <ul class="list-group list-group-flush">
              <li class="list-group-item">ID: ${user.id}</li>
              <li class="list-group-item">Email: ${user.email}</li>
              <li class="list-group-item">Full Name: ${user.fullName}</li>
              <li class="list-group-item">Address: ${user.address}</li>
            </ul>
          </div>
          <a href="/admin/user" class="btn btn-success mt-3">Back</a>
        </div>
      </div>
    </div>
  </body>
</html>
