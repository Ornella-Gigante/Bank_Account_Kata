<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="https://kit.fontawesome.com/4220aaf6e4.js" crossorigin="anonymous"></script>
    <title>Error</title>
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
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .card {
            font-family: 'Courier New', Courier, monospace;
            box-shadow: 0px 3px 6px blue;
        }

        .container {
            width: 100%;
            max-width: 600px;
        }
    </style>
</head>

<body class="d-flex align-items-center justify-content-center vh-100">
    <div class="container">
        <!--Card: Error Card-->
        <div class="card alert alert-danger border border-danger text-danger">
            <!--Card Title-->
            <h3 class="card-title">
                <i class="fa fa-window-close me-2"></i>Errors:
            </h3>
            <!--End of card Title-->
            <hr>
            <!--Card Body-->
            <div class="card-body">
                <p class="card-text">
                        <c:if test="${not empty requestScope.error}">
                                            <div class="alert alert-danger text-center border border-danger">
                                                 <b>${requestScope.error}</b>
                                            </div>
                        </c:if>
                </p>
            </div>
        </div>
        <!--Card: Error Card-->
        <!--Back to Login Page-->
        <a href="/login" class="btn btn-sm btn-danger mt-2">
            <i class="fa fa-arrow-alt-circle-left me-1"></i>Back
        </a>
        <!--End of back to Login Page-->
    </div>
</body>

</html>
