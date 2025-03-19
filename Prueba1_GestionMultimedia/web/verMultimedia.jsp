
<%@page import="java.util.ArrayList"%>
<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page import="app.models.pckg.Multimedia"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mi multimedia</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="verMultimediaStyle.css" rel="stylesheet" type="text/css"/>
        <link href="headStyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            DbHelper dbh = new DbHelper();
            ResultSet rs = dbh.getMultimedias();
            ArrayList<Multimedia> multimedias = new ArrayList<Multimedia>();

            while (rs.next()) {
                Multimedia md = new Multimedia(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getString("descripcion"),
                        rs.getString("url"),
                        rs.getString("tipo"));
                multimedias.add(md);
            }
        %>

        <div class="hero-section">
            <h1>MGM</h1>
            <p>Mi Gestión Multimedia</p>
        </div>

        <nav class="navbar navbar-expand-sm navbar-dark">
            <div class="container-fluid">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="index.html"><b>Inicio</b></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="agregarMultimedia.jsp"><b>Agregar Multimedia</b></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="verMultimedia.jsp"><b>Ver Multimedia</b></a>
                </ul>
            </div>
        </nav>

        <div class="container mt-5">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 justify-content-center">
                <%
                    for (Multimedia md : multimedias) {
                %>
                <div class="col mb-4">
                    <div class="card">
                        <% if(md.getTipo().equals("Imagen")) { %>
                            <img src="<%= md.getUrl() %>" class="card-img-top" alt="<%= md.getTitulo() %>">
                        <% } else if(md.getTipo().equals("Video")) { %>
                            <video controls class="card-img-top">
                                <source src="<%= md.getUrl() %>" type="video/mp4">
                            </video>
                        <% } else { %>
                            <audio controls class="card-img-top">
                                <source src="<%= md.getUrl() %>" type="audio/mp3">
                            </audio>
                        <% } %>

                        <div class="card-body">
                            <h5 class="card-title"><%= md.getTitulo() %></h5>
                            <p class="card-text"><%= md.getDescripcion() %></p>

                            <div class="btn-container">
                                <a href="modificarMultimedia?id=<%= md.getId() %>" class="btn-custom">Modificar
                                </a>
                                <a href="<%= md.getUrl() %>" class="btn-custom" target="_blank">Ver en navegador
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>