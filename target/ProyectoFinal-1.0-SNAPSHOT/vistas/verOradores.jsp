<%@page import="java.util.List"%>
<%@page import="modelo.Orador"%>
<%@page import="dao.OradoresDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Oradores</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg" style="background-color: #353A40; height: 90px">
            <div class="navbar-brand link-light container-fluid" style="display: flex; justify-content: center; align-items: center; height: 100%;">
                Lista de Oradores
            </div>
        </nav>

        <a href="../index.html">
            <img src="../images/flecha.png" alt="Volver" style="width: 30px;">
        </a>

        <table class="table table-bordered" style="width: 80%; margin: auto;">
            <thead>
                <tr class="table-secondary">
                    <th scope="col" class="text-center">ID</th>
                    <th scope="col" class="text-center">Nombre</th>
                    <th scope="col" class="text-center">Apellido</th>
                    <th scope="col" class="text-center">Tema</th>
                    <th scope="col" class="text-center">Fecha</th>
                </tr>
            </thead>
            <tbody >
                <%
                        OradoresDAO oradoresDAO = new OradoresDAO();

                        List<Orador> oradores = oradoresDAO.obtenerOradores();

                        if (oradores != null && !oradores.isEmpty()) {
                            for (Orador orador : oradores) {
                %>
                <tr>
                    <td><%=orador.getIdOrador()%></td>
                    <td><%=orador.getNombre()%></td>
                    <td><%=orador.getApellido()%></td>
                    <td><%=orador.getTema()%></td>
                    <td><%=orador.getFechaAlta()%></td>
                </tr>
                <%
                            }
                    } else {
                %>
                <tr>
                    <td colspan="5" style="text-align: center">No hay oradores registrados</td>
                </tr>
                <%
                    }     
                %>
            </tbody>
        </table>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    </body>
</html>
