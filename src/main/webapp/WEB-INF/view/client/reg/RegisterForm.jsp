<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Register - SB Admin</title>
                <link href="css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="bg-primary">
                <div id="layoutAuthentication">
                    <div id="layoutAuthentication_content">
                        <main>
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-lg-7">
                                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                                            <div class="card-header">
                                                <h3 class="text-center font-weight-light my-4">Create Account</h3>
                                            </div>
                                            <div class="card-body">
                                                <form:form action="/register" method="POST"
                                                    modelAttribute="NewRegisterDTO">
                                                    <div class="row mb-3">
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">
                                                                <c:set var="errorFirstName">
                                                                    <form:errors path="firstName"
                                                                        cssClass="invalid-feedback" />
                                                                </c:set>
                                                                <label for="firstName"
                                                                    class="form-label is-invalid">First name</label>
                                                                <form:input type="text"
                                                                    class="form-control ${not empty errorFirstName?'is-invalid':''}"
                                                                    id="firstName" placeholder="Enter your first name"
                                                                    path="firstName" />
                                                                ${errorFirstName}
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-floating">
                                                                <c:set var="errorLastName">
                                                                    <form:errors path="lastName"
                                                                        cssClass="invalid-feedback" />
                                                                </c:set>
                                                                <label for="lastName" class="form-label is-invalid">Last
                                                                    name</label>
                                                                <form:input type="text"
                                                                    class="form-control ${not empty errorLastName?'is-invalid':''}"
                                                                    id="lastName" placeholder="Enter your last name"
                                                                    path="lastName" />
                                                                ${errorLastName}
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <c:set var="errorEmail">
                                                            <form:errors path="email" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label for="inputEmail" class="form-label">Email address</label>
                                                        <form:input type="email"
                                                            class="form-control ${not empty errorEmail?'is-invalid':''}"
                                                            id="inputEmail" placeholder="name@example.com"
                                                            path="email" />
                                                        ${errorEmail}
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">
                                                                <c:set var="errorPassword">
                                                                    <form:errors path="password"
                                                                        cssClass="invalid-feedback" />
                                                                </c:set>
                                                                <label for="inputPassword"
                                                                    class="form-label">Password</label>
                                                                <form:input type="password"
                                                                    class="form-control ${not empty errorPassword?'is-invalid':''}"
                                                                    id="inputPassword" placeholder="Create a password"
                                                                    path="password" />
                                                                ${errorPassword}
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">
                                                                <c:set var="errorConfirmPassword">
                                                                    <form:errors path="confirmPassword"
                                                                        cssClass="invalid-feedback" />
                                                                </c:set>
                                                                <label for="inputPasswordConfirm"
                                                                    class="form-label">Confirm Password</label>
                                                                <form:input type="password"
                                                                    class="form-control ${not empty errorConfirmPassword?'is-invalid':''}"
                                                                    id="inputPasswordConfirm"
                                                                    placeholder="Confirm password"
                                                                    path="confirmPassword" />
                                                                ${errorConfirmPassword}
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="mt-4 mb-0">
                                                        <div class="d-grid"><button class="btn btn-primary btn-block"
                                                                type="submit">Create Account</button></div>
                                                    </div>
                                                </form:form>
                                            </div>
                                            <div class="card-footer text-center py-3">
                                                <div class="small"><a href="#">Have an account? Go to login</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>

                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>
            </body>

            </html>