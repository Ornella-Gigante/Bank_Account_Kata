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
    <title>Login</title>
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

        /* Estilos para el contenedor de la tarjeta */
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

        /* Estilos para el contenido de la tarjeta */
        .card-body {
            text-align: left;
        }

        /* Estilos para la imagen */
        #slide-image {
            margin-top: 200px;
            margin-left: 20px;
        }

        #slide-image img {
            max-width: 100%;
            height: auto;
            display: block;
        }

        /* Estilos para los botones */
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
    <!-- Card: Login Form Card -->
    <div class="card login-form-card col-4 bg-transparent border-0">
        <!-- Card: Body -->
        <div class="card-body">
            <h1 class="form-header card-title mb-3">
                <i class="fa fa-user-circle"></i> Login
            </h1>

            <!-- Display Message -->
            <c:if test="${not empty requestScope.success}">
                <div id="successMessage" class="alert alert-success text-center border border-success">
                    <b>${requestScope.success}</b>
                </div>
            </c:if>
            <!-- End of Display Message -->


            <c:if test="${not empty requestScope.error}">
                 <div class="alert alert-danger text-center border border-danger">
                       <b>${requestScope.error}</b>
                 </div>
            </c:if>


             <!-- Logout Form -->
             <c:if test="${not empty logged_out}">
                 <div class="alert alert-info text-center border border-info">
                     <b>${logged_out}</b>
                 </div>
             </c:if>
             <!-- End Logout Form -->


            <!-- Login Form -->
            <form action="/login" method="POST" class="login-form">
                <!-- Form Group for Email -->
                <div class="form-group col">
                    <input type="email" name="email" class="form-control form-control-lg" placeholder="Enter your e-mail" />
                </div>
                <!-- End of Form Group -->

                <!-- Form Group for Password -->
                <div class="form-group col">
                    <input type="password" name="password" class="form-control form-control-lg" placeholder="Enter your password" />
                </div>
                <!-- End of Form Group -->

                  <!-- Form Group for Password -->
                  <div class="form-group col">
                     <input type="hidden" name="_token" value="${token}"/>
                  </div>
                  <!-- End of Form Group -->

                <!-- Form Group for Email -->
                <div class="form-group col">
                    <button class="btn btn-lg">Login</button>
                </div>
                <!-- End of Form Group -->
            </form>
            <!-- End of Login Form -->

            <!-- Card Text -->
            <p class="card-text text-white my-2">
                Don't have an account? <span class="ms-2"><a href="/register" class="btn btn-sm text-warning">Sign Up</a></span>
            </p>
            <!-- End of Card Text -->

            <!-- Back Button to Landing Page -->
            <small class="text-warning">
                <i class="fa fa-arrow-alt-circle-left"></i> <a href="/index" class="btn btn-sm text-warning">Back</a>
            </small>
            <!-- End of Back Button to Landing Page -->
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', (event) => {
            const successMessage = document.getElementById('successMessage');
            if (successMessage && successMessage.textContent.trim() === '') {
                successMessage.style.display = 'none';
            }
        });
    </script>
</body>

</html>
