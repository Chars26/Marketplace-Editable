
<%@page import="modelo.usuario"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/estilos/estilos.css" rel="stylesheet" type="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <script
        src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>

  <script src="${pageContext.request.contextPath}/Scripts/validar.js"></script>
        <title>Perfil</title>
    </head>
    <body>
        <!--Este fragmento de codigo valida de que el valor del atributo perfil del usuario sea igual a proveedor, de lo contrario lo manda a index.jsp-->
        <%
            if (!usuario.class.cast(request.getSession().getAttribute("sesion")).getPerfil().equalsIgnoreCase("Proveedor")) {
                response.sendRedirect("index.jsp");
            }
        %>

        <!--Encabezado-->
        <div id="cabecera">
            <ul class="nav justify-content-end"> 
                <li class="nav-item">
                    <a id="letras" class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/controlador?accion=logout" method="POST"">
                        
                        Cerrar sesion
                    </a>
                </li> 
                
        </div>

        <!--Profile Page-->
        <div class="container">

            <div class="container rounded bg-white mt-5 mb-5">
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold">${sesion.getNombre()}</span>
                            <a href="${pageContext.request.contextPath}/Vistas/add-producto.jsp" class="btn btn-success"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 19 17">
                                <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0z"/>
                                </svg>Agregar Producto</a></div>


                    </div>
                    <div class="col-md-5 border-right">
                        <div class="p-3 py-5" id="contenedor">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Configuración</h4>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-6"><label class="labels">Nombre</label><input type="text" class="form-control" placeholder="" value="${sesion.getNombre()}" disabled="true"></div>
                                <div class="col-md-6"><label class="labels">Correo</label><input type="text" class="form-control" value="${sesion.getCorreo()}" placeholder="Correo" disabled="true"></div>
                            </div>

                            <div class="row md-5" >
                                <div class="row row-cols-3 row-cols-md-2 g-5" >
                                    <input type="hidden" id="numeroproducto" value="${misProductos.size()}">
                                      <c:forEach var="p" items="${misProductos}">
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
                                                    
                                                        <button id="btn__eliminar" class="btn btn-danger"></button>
                                                       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                       </svg> Eliminar </a>
                                                    <a href="#" class="btn btn-warning"> 
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                                            <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                                                         </svg>
                                                        Editar</a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>  

                                </div>

                              
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>

  <script src="${pageContext.request.contextPath}/Scripts/functions.js"></script>
</body>
</html>
