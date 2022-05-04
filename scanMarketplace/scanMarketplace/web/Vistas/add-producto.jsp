

<%@page import="modelo.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Recuerden siempre que se vaya a redireccionar a alguna pagina colocar el ${pageContext.request.contextPath} para
        obtener la ruta relativa y que no vayan a suceder errores-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/registro.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <title>Agregar Porductos</title>
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
                    <a id="letras" class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/controlador?accion=volverperfil" method="POST"">
                        
                        Volver a perfil
                    </a>


                </li> 
               
        </div>


        <div class="container">

            <div class="container rounded bg-white mt-5 mb-5">

                <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold">Proveedor</span>

                    <div class="row">
                        <div class="col">
                            <div class="d-flex flex-column align-items-center text-center p-2 py-5">

                                <form class="form-horizontal" action="${pageContext.request.contextPath}/controlador" method="POST" enctype="multipart/form-data">
                                    <fieldset>

                                        <!-- Form Name -->
                                        <legend>Nuevo Producto</legend>

                                        <!-- Text input-->
                                        <div class="form-group">


                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="product_name">Nombre</label>  
                                            <div class="col-md-12">
                                                <input id="nombre" name="nombre" placeholder="NOMBRE" class="form-control input-md" required="" type="text">

                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-5 control-label" for="product_name_fr">Imagen (upload)</label>
                                            <br>
                                            <div class="col-md-12">
                                                <input id="imagen" name="imagen" class="form-control input-md" required="" type="file" accept="image/png,image/jpeg">

                                            </div>
                                        </div>

                                        <!-- Select Basic -->
                                        <!-- Validen esto de la manera correcta para que el back pueda obtener los datos correctos -->
                                         <br>
                                        <div class="form-group">
                                       

                                            <select name="categoria" class="form-select" aria-label="Default select example">
                                                <br>
                                                <option selected>Categoria</option>  
                                                <option value="1" >Accion</option>  
                                                <option value="2" >Aventura</option> 
                                                <option value="3" >Plataforma</option> 
                                                <option value="4" >Peleas</option>  
                                                <option value="5" >Shooter</option> 
                                                <option value="6" >Simulacion</option> 
                                                <option value="7" >Carreras</option>  
                                                <option value="8" >Rol</option> 
                                                <option value="9" >Mundo Abierto</option> 
                                            </select>

                                            <br>
                                          <div class="form-group">
                                       

                                            <select name="plataforma" class="form-select" aria-label="Default select example">
                                                <br>
                                                <option selected>Plataforma</option>  
                                                <option value="Xbox" >Xbox</option>  
                                                <option value="PS" >PlayStation</option> 
                                                <option value="Nintend" >Nintendo</option> 
                                                <option value="pc" >PC</option>
                                                
                                            </select>
                                              <br>
                                              
                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="available_quantity">Pegi</label>  
                                            <div class="col-md-12">
                                                <input id="pegi" name="pegi" placeholder="PEGI" class="form-control input-md" required="" type="int">

                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="product_weight">Existencias</label>  
                                            <div class="col-md-12">
                                                <input id="existencias" name="existencias" placeholder="Exsistencias" class="form-control input-md" required="" type="int">

                                            </div>
                                        </div>

                                        <!-- Textarea -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="product_description">Descripcion</label>
                                            <div class="col-md-12">                     
                                                <textarea class="form-control" id="descripcion" name="descripcion"></textarea>
                                            </div>
                                        </div>



                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="percentage_discount">Precio</label>  
                                            <div class="col-md-12">
                                                <input id="precio" name="precio" placeholder="PRECIO" class="form-control input-md" required="" type="int">

                                            </div>
                                        </div>

                                        <!-- Button -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="singlebutton"></label>
                                            <div class="col-md-12">
                                                <input id="accion" name="accion" class="btn btn-success" type="submit" value="Agregar">
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="singlebutton"></label>
                                    <div class="col-md-12">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

