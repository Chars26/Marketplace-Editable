

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Scan Marketplace</title>
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="shortcut icon" href="favicon.ico">
        <link rel="stylesheet" href="estilos/estilos.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div id="cabecera">
            <ul class="nav justify-content-end"> 
                <li class="nav-item">
                    <a id="letras" class="nav-link active" aria-current="page" href="Vistas/carrito.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                        </svg>
                        Carrito
                    </a>


                </li> 
                <li class="nav-item">
                    <a id="letras" class="nav-link active" aria-current="page" href="Vistas/registro.jsp">Iniciar sesión</a>
                </li>
                <li class="nav-item">
                    <a id="letras" class="nav-link active" aria-current="page" href="Vistas/registro.jsp">Registrarse</a>
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
                            <div id="boton">
                                <input type="hidden" id="idp" name="idp" value="${p.getIdProducto()}">
                                <a action="${pageContext.request.contextPath}/controlador?accion=agregarCarrrito" method="POST"" class="btn btn-warning"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-plus" viewBox="0 1 16 16">
                                    <path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
                                    <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                    </svg> Añadir</a>
                                
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

                        <!-- Links -->
                        <h5 id="letraslogo" class="text-uppercase">Links</h5>

                        <ul class="list-unstyled">
                            <li>
                                <a href="#!">Link 1</a>
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

                    <!-- Grid column -->
                    <div class="col-md-3 mb-md-0 mb-3">

                        <!-- Links -->
                        <h5 id="letraslogo" class="text-uppercase">Links</h5>

                        <ul class="list-unstyled">
                            <li>
                                <a href="#!">Link 1</a>
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
        <script type="text/javascript">
            //variables para cargar los productos
            var localObj = window.location;
            var contextPath = localObj.pathname.split("/")[1];
            var basePath = localObj.protocol + "//" + localObj.host + "/" + contextPath + "/";

            if (window.location == basePath) {
                location.href = "controlador?accion=home";
            }
        </script>
    </body>
</html>
