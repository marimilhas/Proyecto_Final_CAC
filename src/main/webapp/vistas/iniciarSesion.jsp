<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Iniciar Sesión</title>
    <style>
        .container {
            position: relative;
        }
        
        .boton-container {
            position: absolute;
            bottom: 30px;
            left: 50%;
            transform: translate(-50%, 0%);
        }
        
        .boton-ingresar {
            background-color: #29A744;
            color: white;
        }
        .boton-ingresar:hover {
            background-color: rgb(29, 119, 49) !important;
            color: white;
        }
    </style>
    
</head>
<body style="background-color: #353A40; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0;">

    <div class="container" style="background-color: white; width: 30%; height: 330px; padding: 30px;">
        <h3 class="card-title text-center" style="margin-bottom: 20px;">Iniciar Sesión</h3>
        <form action="SesionServlet" method="post">
            <div class="form-group mb-3">
                <label for="username" class="form-label">Usuario</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <c:if test="${not empty requestScope.error}">
                <div class="error" style="color: red; font-size: 12px;">${requestScope.error}</div>
            </c:if>
            <div class="boton-container" style="text-align: center;">
                <button type="submit" class="btn boton-ingresar">Ingresar</button>
                <a href="../" class="btn btn-success px-3">Volver</a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>
