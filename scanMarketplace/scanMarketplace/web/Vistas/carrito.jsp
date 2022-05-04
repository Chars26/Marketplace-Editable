

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/carrito.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <script src="${pageContext.request.contextPath}/Scripts/functions.js" ></script>
    </head>
    <body>
        <div id="containercar" >
            <div class="card">
                <div class="row">
                    <div class="col-md-8 cart">
                        <div class="title">
                            <div class="row">
                                <div class="col">
                                    <h4><b>Carrito de compras</b></h4>
                                </div>
                                <div class="col align-self-center text-right text-muted">productos</div>
                            </div>
                        </div>
                        <c:forEach var="c" items="${carrito}">
                            <div class="row border-top border-bottom">
                                <div class="row main align-items-center">
                                    <div class="col-2"><img class="img-fluid" src="controlador?accion=listarImagen&id=${c.getIdProducto()}"></div>
                                    <div class="col">
                                        <div class="row text-muted">Game</div>
                                        <div class="row">${c.getNombreProducto()}</div>

                                    </div>
                                    <div class="col"><div class="col"> <a href="#">-</a><a href="#" class="border">${c.getCantidad()}</a><a href="#">+</a> </div>
                                        <div class="col">&dollar; ${c.getPrecio()} <span class="close"></span></div> </div>

                                </div>
                                <div>
                                    <input type="hidden" id="idp"  value="${c.getIdProducto()}">

                                    <button id="btnEliminar" class="btn btn-danger">ELIMINAR</button>


                                </div>
                            </div>
                        </c:forEach>
                        <div class="back-to-shop"><a href="#">&leftarrow;</a><span class="text-muted">Vaciar Carrito</span></div>
                    </div>
                    <div class="col-md-4 summary">
                        <div>
                            <h5><b>Resumen</b></h5>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col" style="padding: left 3px;;">PRODUCTOS - ${numeroProductosCarrito}</div>

                        </div>
                        <br>

                        <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">

                        </div>
                        <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                            <div class="col">PRECIO TOTAL</div>
                            <div class="col text-right">$ ${total_a_pagar}</div>
                        </div> 
                        <br>

                        <button class="btn">Comprar</button>
                        <a href="${pageContext.request.contextPath}/controlador?accion=volverinicio" method="POST"">Regresar a Inicio</a>

                    </div>
                </div>
            </div>

        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script type="text/javascript">

            $(document).ready(function () {
                $("div #btnEliminar").click(function () {
                    idp = $(this).parent("div").find("#idp").val();
                    location.href = "controlador?accion=eliminarDelCarrito&idp=" + idp;
                });
            });
        </script>

    </body>
</html>
