<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/default.css">
    <script src="https://kit.fontawesome.com/4220aaf6e4.js" crossorigin="anonymous"></script>
    <title>Home</title>
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
            text-align: left; /* Alinea el contenido del card-body a la izquierda */
        }

        /* Estilos para la imagen */
        #slide-image {
            margin-top: 200px; /* Ajusta el margen superior según sea necesario */
            margin-left: 20px; /* Alinea la imagen a la izquierda */
        }

        #slide-image img {
            max-width: 100%;
            height: auto;
            display: block;
        }

        /* Estilos para los botones */
        .button-wrapper a {
            padding: 15px; /* Ajusta el padding para hacer los botones más anchos */
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
            color: white; /* Cambia el color del texto a blanco al pasar el ratón por encima */
        }

        .card {
            font-family: 'Courier New', Courier, monospace;
        }

        .card .card-text {
            font-size: 16px;
        }
    </style>
</head>

<body class="d-flex align-items-center">
    <!-- Card: Sample Text -->
    <div id="sample-text-card" class="card col-6 bg-transparent border-0">
        <!-- Card Body -->
        <div class="card-body">
            <!-- Card Header -->
            <h1 class="mb-3">Bank Account Demo</h1>
            <!-- End of Card Header -->

            <!-- Card Title -->
            <h3 class="card-title">Your Bank Account, now Online</h3><br>
            <!-- End of Title -->

            <!-- Card Text -->
            <p class="card-text">
                Lorem ipsum dolor sit amet consectetur adipisicing elit.<br>
                Veniam blanditiis beatae iure, quibusdam architecto pro.<br>
                Incidunt autem necessitatibus voluptates aperiam optio.<br>
                Quisquam temporibus quidem facilis doloribus perspiciatis.
            </p>
            <!-- End of Card Text -->

            <!-- Button Wrapper -->
            <div class="button-wrapper d-flex align-items-center">
                <a href="/register" class="btn btn-md register" role="button">Register</a>
                <a href="/login" class="btn btn-md login" role="button">Login</a>
            </div>
            <!-- End of Button Wrapper -->
        </div>
    </div>
    <!-- End of Card: Sample Text -->
    <!-- Side image -->
    <div id="slide-image" class="image-wrapper">
       <img src="${pageContext.request.contextPath}/images/simbol.png" alt="Small Image">
    </div>
    <!-- End of side image -->
</body>

</html>
