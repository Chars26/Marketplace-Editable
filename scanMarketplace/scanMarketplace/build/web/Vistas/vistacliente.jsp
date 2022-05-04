

<%@page import="modelo.usuario"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>CITAFAST</title>
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="shortcut icon" href="favicon.ico">
        <link rel="stylesheet" href="estilos/estilos.css"> 
        
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        
         <%
            if (!usuario.class.cast(request.getSession().getAttribute("sesion")).getPerfil().equalsIgnoreCase("cliente")) {
                response.sendRedirect("vistacliente.jsp");
            }
        %>
        <div id="cabecera">
            <ul class="nav justify-content-end"> 
                <li class="nav-item">
                    <a id="letras" class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/controlador?accion=carrito" method="POST"     >
                        SOLICITA TU CITA!   
                    </a>


                </li> 
                
          <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Perfil
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/controlador?accion=logout" method="POST"">cerrar sesion</a></li>
          </ul>
        </li>
                
                
            </ul>
        </div>

        <!--Barra de busqueda-->
        <div id="containerBusqueda">

            <nav class="navbar navbar-expand-lg navbar-light ">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <div class="container-fluid">
                                    <a  id="letraslogo" class="navbar-brand" href="${pageContext.request.contextPath}/controlador?accion=home">
                                        <img src="https://raw.githubusercontent.com/CharsMA/Marketplace-SCANG/main/logo-removebg-preview.png" alt="" width="80" height="80" class="d-inline-block align-text-center">
                                        SCAN GAMING
                                    </a>
                                </div>
                            </li>

                        </ul>

                        <form action="${pageContext.request.contextPath}/controlador?accion=buscar" method="POST" class="d-flex">
                            <input id="busqueda" name="busqueda" class="form-control me-2 " type="text" placeholder="Buscar" aria-label="Search" >
                            <button class="btn btn-outline-warning" type="submit" width="300" class="bi bi-search">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-search" viewBox="0 0 16 15">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                </svg>
                            </button>
                        </form>
                    </div>
                </div>
            </nav>

        </div>
        <br>
        <!--Contenido de Pagina-->

        <div class="container">

            <!--Categorias-->


            <!--Carrusel-->
            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="50">
                        <img src="https://i0.wp.com/hipertextual.com/wp-content/uploads/2021/05/GTA-5-1-scaled.jpg?fit=2560%2C1439&ssl=1" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">

                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2018/04/breath-wild-ya-es-zelda-mas-vendido-historia.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Zelda</h5>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="https://www.nintendo.com//content/dam/noa/es_LA/games/switch/s/super-smash-bros-ultimate-switch/super-smash-bros-ultimate-switch-hero.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>



            <!--Cards de Juegos-->
            <br><br>

            <div class="row row-cols-1 row-cols-md-3 g-5" >
                <c:forEach var="p" items="${productos}">
                    <div class="col">
                        <div class="card">
                            <img id="imgtarjeta" src="controlador?accion=listarImagen&id=${p.getIdProducto()}" class="card-img-top" alt="${p.getNombre()}">
                            <div class="card-body text-white"  id="tarjeta">
                                <h5 class="card-title">${p.getNombre()}</h5>
                                <p class="card-text">${p.getDescripcion()}
                                </p>

                                <p class="precio" class="text-white">${p.getPrecio()} COP</p>
                            </div>
                            <!--Editar estilo de este div-->
                            <div>
                                <input type="hidden" id="idp" name="idp" value="${p.getIdProducto()}">
                                <button id="btnAgregar">  Agregar a Carrito</button>
                                
                            </div>
                        </div>
                    </div>
                </c:forEach>     







            </div>
        </div>
        <br><br>
        <!-- Footer -->
        <footer class="page-footer font-small blue pt-4" id="footer" >

            <!-- Footer Links -->
            <div class="container-fluid text-center text-md-left">

                <!-- Grid row -->
                <div class="row">

                    <!-- Grid column -->
                    <div class="col-md-6 mt-md-0 mt-3">

                        <!-- Content -->
                        <h5 id="letraslogo" class="text-uppercase">CONTACTANOS</h5>
                        <p id="letraslogo">Here you can use rows and columns to organize your footer content.</p>

                    </div>
                    <!-- Grid column -->

                    <hr class="clearfix w-100 d-md-none pb-3">

                    <!-- Grid column -->
                    <div class="col-md-3 mb-md-0 mb-3">

                       

                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-3 mb-md-0 mb-3">

                        <!-- Links -->
                        <h5 id="letraslogo" class="text-uppercase">Links</h5>

                        <ul class="list-unstyled">
                            <li>
                                <a href="https://www.facebook.com">nuestro faceboook</a>
                            </li>
                            <li>
                                <a href="#!">Link 2</a>
                            </li>
                            <li>
                                <a href="#!">Link 3</a>
                            </li>
                            <li>
                                <a href="#!">Link 4</a>
                            </li>
                        </ul>

                    </div>
                    <!-- Grid column -->

                </div>
                <!-- Grid row -->

            </div>
            <!-- Footer Links -->

            <!-- Copyright -->
            <div id="letraslogo" class="footer-copyright text-center py-3">© 2021 Copyright:
                <a href="#" class="text-warning"> SCANG GAMING </a>
            </div>
            <!-- Copyright -->

        </footer>
        <!-- Footer -->


        <!--Targetas
      <div class="container">
        <div class="card" style="width: 18rem;">
          <img src="..." class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
          </div>
        </div>
      </div>-->

        <br><br>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/Scripts/functions.js"></script>
    </body>
</html>

