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
    <title>Table User</title>
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col-12 mx-auto">
          <div class="d-flex justify-content-between">
            <h3>Table User</h3>
            <a href="/admin/user/create" class="btn btn-primary"
              >Create new user</a
            >
          </div>
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Name</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="user" items="${users}">
                <tr>
                  <th>${user.id}</th>
                  <td>${user.email}</td>
                  <td>${user.fullName}</td>
                  <td>
                    <a href="/admin/user/${user.id}" class="btn btn-success"
                      >View</a
                    >
                    <a
                      href="/admin/user/update/${user.id}"
                      class="btn btn-warning"
                      >Update</a
                    >
                    <a
                      href="/admin/user/delete/${user.id}"
                      class="btn btn-danger"
                      >Delete</a
                    >
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </body>
</html>
