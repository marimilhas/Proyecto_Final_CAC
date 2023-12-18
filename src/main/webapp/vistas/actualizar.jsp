<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <title>Actualizar Orador</title>
        <style>
            .boton-actualizar {
                background-color: #29A744;
                color: white;
            }
            .boton-actualizar:hover {
                background-color: rgb(29, 119, 49) !important;
                color: white;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg" style="background-color: #353A40; height: 90px">
            <div class="navbar-brand link-light container-fluid"
                style="display: flex; justify-content: center; align-items: center; height: 100%;">
                Actualizar Orador
            </div>
        </nav>
        <a href="gestionarOradores.jsp">
            <img src="../images/flecha.png" alt="Volver" style="width: 30px;">
        </a>
        <div class="container p-3 rounded" style="width: 60%; background-color: gainsboro;">
            <form action="GestionOradoresServlet" method="post">
                <input type="hidden" name="operacion" value="confirmarActualizacion">
                <input type="hidden" name="id" value="${orador.idOrador}">
                
                <div class="form-group mb-2">
                    <label for="nombre">Nombre</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" value="${orador.nombre}" required>
                </div>
                
                <div class="form-group mb-2">
                    <label for="apellido">Apellido</label>
                    <input type="text" class="form-control" id="apellido" name="apellido" value="${orador.apellido}" required>
                </div>
                
                <div class="form-group mb-2">
                    <label for="tema">Tema</label>
                    <input type="text" class="form-control" id="tema" name="tema" value="${orador.tema}" required>
                </div>
                
                <div class="form-group mb-2">
                    <label for="fechaAlta">Fecha Alta</label>
                    <input type="text" class="form-control" id="fechaAlta" name="fechaAlta" value="${orador.fechaAlta}" required>
                </div>
                
                <button type="submit" class="btn boton-actualizar">Actualizar</button>
            </form>
        </div>
    </body>
</html>
