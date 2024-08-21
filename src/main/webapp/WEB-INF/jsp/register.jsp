<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="https://kit.fontawesome.com/4220aaf6e4.js" crossorigin="anonymous"></script>
    <title>Register</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            height: 100vh;
            background-image: url("${pageContext.request.contextPath}/css/components/bank2.jpg");
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            padding: 20px;
        }

        #sample-text-card {
            font-size: 20px;
            width: 50%;
            max-width: 600px;
            background-color: rgba(0, 0, 0, 0.5);
            padding: 20px;
            color: white;
            font-family: 'Courier New', Courier, monospace;
            margin: 30px 100px;
        }

        #sample-text-card h1 {
            font-size: 65px;
            margin: 30px 100px;
        }

        .card-body {
            text-align: left;
        }

        #slide-image {
            margin-top: 200px;
            margin-left: 20px;
        }

        #slide-image img {
            max-width: 100%;
            height: auto;
            display: block;
        }

        .button-wrapper a {
            padding: 15px;
            width: 200px;
            color: white;
            box-shadow: 0px 3px 6px blue;
        }

        .register {
            margin-right: 7px;
            background-color: #ff4e00;
            border: 1px solid #543800;
        }

        .login {
            background-color: #ffb114;
            border: 1px solid #543800;
        }

        .card .form-control {
            margin: 10px 0px;
            box-shadow: 0px 3px 6px black;
        }

        .card button {
            background-color: #ff4e00;
            border: 1px solid #543800;
            color: white;
            width: 200px;
            margin: 10px 1px;
            box-shadow: 0px 3px 6px blue;
        }

        .card button:hover {
            color: white;
        }

        .card {
            font-family: 'Courier New', Courier, monospace;
        }

        .card .card-text {
            font-size: 16px;
        }
    </style>
</head>

<body class="d-flex align-items-center justify-content-center">
    <div class="card registration-form-card col-6 bg-transparent border-0">
        <div class="card-body">
            <h1 class="form-header card-title mb-3">
                <i class="fa fa-edit"></i> Register
            </h1>
            <c:if test="${not empty requestScope.passwordMisMatch}">
                            <div class="alert alert-danger text-center border border-danger">
                                <b>${requestScope.passwordMisMatch}</b>
                            </div>
            </c:if>
                        <c:if test="${not empty requestScope.success}">
                            <div class="alert alert-success text-center border border-success">
                                <b>${requestScope.success}</b>
                            </div>
                        </c:if>
            <form:form action="/register" class="reg-form" modelAttribute="registerUser">
                <div class="row">
                    <div class="form-group col">
                        <form:input path="first_name" class="form-control form-control-lg" placeholder="Enter First Name" />
                        <form:errors path="first_name" class="text-white bg-danger"/>
                    </div>
                    <div class="form-group col">
                        <form:input path="last_name" class="form-control form-control-lg" placeholder="Enter Last Name" />
                        <form:errors path="last_name" class="text-white bg-danger"/>
                    </div>
                </div>
                <div class="form-group col">
                    <form:input path="email" class="form-control form-control-lg" placeholder="Enter your e-mail" />
                    <form:errors path="email" class="text-white bg-danger"/>
                </div>
                <div class="row">
                    <div class="form-group col">
                        <form:input path="password" type="password" class="form-control form-control-lg" placeholder="Enter your password" />
                        <form:errors path="password" class="text-white bg-danger"/>
                    </div>
                    <div class="form-group col">
                        <input type="password" name="confirm_password" class="form-control form-control-lg" placeholder="Confirm password" />
                        <c:if test="${not empty confirm_pass_error}">
                            <small class="text-white bg-danger">${confirm_pass_error}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group col">
                    <button class="btn btn-lg">Register</button>
                </div>
            </form:form>
            <p class="card-text text-white my-2">
                Already have an account? <span class="ms-2"><a href="/login" class="btn btn-sm text-warning">Sign In</a></span>
            </p>
            <small class="text-warning">
                <i class="fa fa-arrow-alt-circle-left"></i> <a href="/index" class="btn btn-sm text-warning">Back</a>
            </small>
        </div>
    </div>
</body>

</html>
