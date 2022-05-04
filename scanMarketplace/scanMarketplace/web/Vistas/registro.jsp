

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Recuerden siempre que se vaya a redireccionar a alguna pagina colocar el ${pageContext.request.contextPath} para
        obtener la ruta relativa y que no vayan a suceder errores-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/registro.css">
        <title>Registro</title>
    </head>
    <body>
        <main>

            <div class="contenedor__todo">
                <div class="caja__trasera">
                    <div class="caja__trasera-login">
                        <h3>¿Ya tienes una cuenta?</h3>
                        <p>Inicia sesión para entrar en la página</p>
                        <button id="btn__iniciar-sesion">Iniciar Sesión</button>
                    </div>
                    <div class="caja__trasera-register">
                        <h3>¿Aún no tienes una cuenta?</h3>
                        <p>Regístrate para que puedas iniciar sesión</p>
                        <button id="btn__registrarse">Regístrarse</button>

                    </div>
                </div>

                <!--Formulario de Login y registro-->
                <div class="contenedor__login-register">
                    <!--Login-->
                    <form action="${pageContext.request.contextPath}/controlador?accion=login" method="POST" class="formulario__login">
                        <h2>Iniciar Sesión</h2>
                        <input type="text" id="usuario" name="usuario" placeholder="Usuario">
                        <input type="password" id="password" name="password" placeholder="Contraseña">
                        <input type="submit" value="Entrar">
                        <a  href="${pageContext.request.contextPath}/controlador?accion=home" method="POST"">Regresar a Inicio</a>
                        

                    </form>

                    <!--Register-->
                    <form action="${pageContext.request.contextPath}/controlador?accion=registrar" method="POST" class="formulario__register">
                        <h2>Regístrarse</h2>
                        <input type="text" name="nombre" placeholder="Nombre">
                        <input type="text" name="telefono" placeholder="Telefono">
                        <input type="text" name="correo" placeholder="Correo Electronico">
                        <input type="text" name="tipoDocumento" placeholder="Tipo de identificación">
                        <input type="text" name="numeroDocumento" placeholder="Identificación">
                        <input type="text" name="perfil" placeholder="Perfil">
                        <input type="password" name="password" placeholder="Contraseña">
                        <button type="submit">Regístrarse</button>
                        <br><br>
                        <a  href="${pageContext.request.contextPath}/controlador?accion=home" method="POST"">Regresar a Inicio</a>
                    </form>
                </div>
            </div>

        </main>

        <script src="${pageContext.request.contextPath}/Scripts/scrip-registro.js"></script>
    </body>
</html>
