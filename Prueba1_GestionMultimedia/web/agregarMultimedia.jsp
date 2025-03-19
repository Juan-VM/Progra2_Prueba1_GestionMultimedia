<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Multimedia | Mi Gestión Multimedia</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
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
        </style>
    </head>

    <body>

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
                        <a class="nav-link active" href="agregarMultimedia.jsp"><b>Agregar Multimedia</b></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="verMultimedia.jsp?tipo=todo"><b>Ver Multimedia</b></a>
                </ul>
            </div>
        </nav>


        <div class="container mt-5 mb-5">
            <div class="d-flex justify-content-center align-items-center">
                <div class="card shadow-lg p-4 rounded" style="max-width: 500px; width: 100%;">
                    <h4 class="text-center mb-3"><b>Agregar Multimedia</b><i class="fas fa-save ms-2"></i></h4>
                    <form action="guardarMultimedia.jsp">
                        <div class="form-group">
                            <label class="form-label">Título</label>
                            <input type="text" class="form-control" name="txtTitulo" placeholder="Ingresa el título" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Descripción</label>
                            <textarea class="form-control" name="txtDescription" rows="4" maxlength="200"
                                      placeholder="Describe tu multimedia aquí..."></textarea>
                        </div>

                        <div class="form-group">
                            <label class="form-label">URL (Vinculo para imagenes)</label>
                            <input type="text" class="form-control" name="txtURL" placeholder="Ingresa la URL del archivo" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Tipo de multimedia</label>
                            <select class="form-select" name="tipoMultimedia" required>
                                <option>Imagen</option>
                                <option>Video</option>
                                <option>Audio</option>
                            </select>
                        </div>

                        <div class="row">
                            <div class="row">
                                <div class="col-6">
                                    <button type="submit" class="btn btn-custom w-100">
                                        <i class="fas fa-save"></i> Agregar
                                    </button>
                                </div>
                                <div class="col-6">
                                    <a href="index.html" class="btn btn-custom w-100">
                                        <i class="fas fa-arrow-left"></i> Atrás
                                    </a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>

</html>
