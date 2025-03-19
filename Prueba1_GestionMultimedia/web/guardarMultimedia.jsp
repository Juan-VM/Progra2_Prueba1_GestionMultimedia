<%@page import="app.models.pckg.Multimedia"%>
<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guardar Multimedia</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="guardarMultimediaStyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
        String titulo = request.getParameter("txtTitulo");
        String descripcion = request.getParameter("txtDescription");
        String url = request.getParameter("txtURL");
        String tipo = request.getParameter("tipoMultimedia");
        
        Multimedia md = new Multimedia(titulo, descripcion, url, tipo);
        DbHelper dbh = new DbHelper();
        
        if (dbh.guardarMultimedia(md)) {
        %>
        <div class="container d-flex justify-content-center">
            <div class="card shadow-lg p-4 success-card" style="max-width: 500px;">
                <div class="card-body">
                    <h4 class="card-title text-dark"><i class="fas fa-check-circle" style="color: #343a40;"></i> ¡Multimedia agregado!</h4>
                    <p class="card-text"><%=tipo%> se ha agregado con éxito.</p>
                    <a href="verMultimedia.jsp" class="btn w-100"><i class="fas fa-thumbs-up"></i> Aceptar</a>
                </div>
            </div>
        </div>
        <%} else {%>
        <div class="container d-flex justify-content-center">
            <div class="card shadow-lg p-4 error-card" style="max-width: 500px;">
                <div class="card-body">
                    <h4 class="card-title text-dark"><i class="fas fa-exclamation-circle" style="color: #343a40;"></i> ¡Error!</h4>
                    <p class="card-text">Ocurrió un error al agregar el multimedia. Inténtalo de nuevo...</p>
                    <a href="agregarMultimedia.jsp" class="btn w-100"><i class="fas fa-times"></i> Aceptar</a>
                </div>
            </div>
        </div>
        <%}%>
    </body>
</html>