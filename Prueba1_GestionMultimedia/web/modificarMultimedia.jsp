
<%@page import="app.models.pckg.Multimedia"%>
<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Multimedia</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <link href="headStyle.css" rel="stylesheet" type="text/css"/>
        <link href="agregarMultimediaStyle.css" rel="stylesheet" type="text/css"/>
        <style>
            body {
                background-image: url('img/fondo.jpg') !important;
                background-size: cover;
                background-position: center center;
                background-attachment: fixed;
                background-repeat: no-repeat;
                color: white;
            }

            .modal-header {
                background-color: #dc3545;
                color: white;
            }

            .modal-body {
                color: black;
                font-weight: bold;
            }

            .modal-footer .btn-danger {
                background-color: #dc3545;
                color: white;
            }

            .modal-footer .btn-danger:hover {
                background-color: #c82333;
            }

            .modal-content {
                border-radius: 10px;
            }

        </style>
    </head>
    <body>
        <%
            int multimediaId = Integer.parseInt(request.getParameter("id"));

            DbHelper dbh = new DbHelper();
            ResultSet rs = dbh.getMultimedia(multimediaId);
            Multimedia md = null;
            while (rs.next()) {
                md = new Multimedia(multimediaId, rs.getString("titulo"), rs.getString("descripcion"), rs.getString("url"), rs.getString("tipo"));
            }

        %>

        <div class="modal" id="eliminarMultimedia">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Eliminar multimedia</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <div class="modal-body">
                        ¿Estás seguro de que deseas eliminar este multimedia?
                    </div>

                    <div class="modal-footer">
                        <a href="eliminarMultimediaLogic.jsp?id=<%=multimediaId%>&tipo=<%=md.getTipo()%>" 
                           class="btn btn-danger">Aceptar</a>
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="container mt-5 mb-5">
            <div class="d-flex justify-content-center align-items-center">
                <div class="card shadow-lg p-4 rounded" style="max-width: 500px; width: 100%;">
                    <h4 class="text-center mb-3"><b>Modificar Multimedia</b><i class="fas fa-save ms-2"></i></h4>
                    <form action="modificarMultimediaLogic.jsp">
                        <!-- Formulario para modificar multimedia -->
                        <div class="form-group">
                            <label class="form-label">Título</label>
                            <input type="text" class="form-control" name="txtTitulo" value="<%=md.getTitulo()%>" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Descripción</label>
                            <textarea class="form-control" name="txtDescription" rows="4" maxlength="200"><%=md.getDescripcion()%></textarea>
                        </div>

                        <div class="form-group">
                            <label class="form-label">URL</label>
                            <input type="text" class="form-control" name="txtURL" value="<%=md.getUrl()%>" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Tipo de multimedia</label>
                            <select class="form-select" name="tipoMultimedia" required>
                                <option <%= md.getTipo().equals("Imagen") ? "selected" : ""%>>Imagen</option>
                                <option <%= md.getTipo().equals("Video") ? "selected" : ""%>>Video</option>
                                <option <%= md.getTipo().equals("Audio") ? "selected" : ""%>>Audio</option>
                            </select>
                        </div>

                        <input type="hidden" name="id" value="<%=md.getId()%>">

                        <!-- Botones -->
                        <div class="row justify-content-center">
                            <div class="col-4">
                                <button type="submit" class="btn btn-custom w-100 text-center">
                                    <i class="fas fa-save"></i> Guardar
                                </button>
                            </div>
                            <div class="col-4">
                                <a data-bs-toggle="modal" data-bs-target="#eliminarMultimedia" class="btn btn-custom w-100 text-center">
                                    <i class="fas fa-trash-alt"></i> Eliminar
                                </a>
                            </div>
                            <div class="col-4">
                                <a href="verMultimedia.jsp?tipo=<%=md.getTipo()%>" class="btn btn-custom w-100 text-center">
                                    <i class="fas fa-arrow-left"></i> Atrás
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
