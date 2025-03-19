<%@page import="app.models.pckg.Multimedia"%>
<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Multimedia</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="guardarMultimediaStyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
        int multimediaId = Integer.parseInt(request.getParameter("id"));
        String tipo = request.getParameter("tipo");
        DbHelper dbh = new DbHelper();
        
        if (dbh.eliminarMultimedia(multimediaId)) {
        %>
        <div class="container d-flex justify-content-center">
            <div class="card shadow-lg p-4 success-card" style="max-width: 500px;">
                <div class="card-body">
                    <h4 class="card-title text-dark"><i class="fas fa-check-circle" style="color: #343a40;"></i> ¡Multimedia eliminado!</h4>
                    <p class="card-text">Multimedia eliminado con éxito.</p>
                    <a href="verMultimedia.jsp?tipo=<%=tipo%>" class="btn w-100"><i class="fas fa-thumbs-up"></i> Aceptar</a>
                </div>
            </div>
        </div>
        <%} else {%>
        <div class="container d-flex justify-content-center">
            <div class="card shadow-lg p-4 error-card" style="max-width: 500px;">
                <div class="card-body">
                    <h4 class="card-title text-dark"><i class="fas fa-exclamation-circle" style="color: #343a40;"></i> ¡Error!</h4>
                    <p class="card-text">Ocurrió un error al eliminar el multimedia. Inténtalo de nuevo...</p>
                    <a href="verMultimedia.jsp?tipo=<%=tipo%>" class="btn w-100"><i class="fas fa-times"></i> Aceptar</a>
                </div>
            </div>
        </div>
        <%}%>
    </body>
