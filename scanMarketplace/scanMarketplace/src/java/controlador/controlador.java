/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;
import modelo.carrito_de_compra;
import modelo.usuario;
import modelo.producto;
import modeloDAO.productoDAO;
import modeloDAO.usuarioDAO;


@MultipartConfig
public class controlador extends HttpServlet {

    //creamos una instancia al objeto usuario
    usuario usuario;
    //creamos una instancia e inicializamos al objeto usuarioDAO
    producto pro;
    usuarioDAO udao = new usuarioDAO();
    productoDAO pdao = new productoDAO();
    List<producto> productos = new ArrayList<>();
    List<carrito_de_compra> carrito = new ArrayList();
    //estas variables las creamos porque son redundantes en muchos metodos
    int idp;
    int cant;
    int total_a_pagar;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Al llamar al servlet este es el primer metodo que se ejecuta(processRequest)

        //Se toma la variable que se envió por url
        String accion = request.getParameter("accion");
        //se listan los productos
        productos = pdao.retornarProductos();
        //se crea un atributo del metodo request para poder mostrar variables en el front
        request.setAttribute("productos", productos);
        switch (accion) {
            case "home":
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case "login":
                //Aqui es cuando la variable "accion" tiene por valor "login", despues de eso se reciben las variables enviadas por el formulario
                String usu = request.getParameter("usuario");
                String password = request.getParameter("password");

                //inicializamos un objeto de tip usuario para almacenar los datos de la consulta a la bd
                usuario = new usuario();
                //le damos valor a la variable llamando al metodo validarUsuario de la clase usuarioDAO
                usuario = udao.validarUsuario(usu, password);
                if (usuario != null) {
                    if (usuario.getPerfil().equalsIgnoreCase("Cliente")) {
                        request.getSession().setAttribute("sesion", usuario);
                        request.getRequestDispatcher("Vistas/vistacliente.jsp").forward(request, response);
                    }
                }
                //validamos que usuario sea diferente de null para saber que si retornò un usuario
                if (usuario != null) {
                    //validamos si el usuario tiene un perfil igual a proveedor
                    if (usuario.getPerfil().equalsIgnoreCase("Proveedor")) {
                        //se crea una sesion del usuario
                        request.getSession().setAttribute("sesion", usuario);
                        //se retornan los productos del proveedor
                        productos = pdao.listarProductosDelProveedor(usuario.getIdUsuario());
                        //creamos un atributo para mostrar los productos del proveedor
                        request.setAttribute("misProductos", productos);
                        //redireccionamos a la pagina de inicio del proveedor en el marketplace
                        request.getRequestDispatcher("Vistas/perfil.jsp").forward(request, response);
                    }
                } else {
                    //si retornó null dieccionamos a la pagina inicial del sitio para que inicie sesion de nuevo
                    request.getRequestDispatcher("Vistas/registro.jsp").forward(request, response);
                }
                break;
            case "registrar":
                String nom = request.getParameter("nombre");
                int telefono = Integer.parseInt(request.getParameter("telefono"));
                String correo = request.getParameter("correo");
                String tipoDoc = request.getParameter("tipoDocumento");
                String numDoc = request.getParameter("numeroDocumento");
                String perfil = request.getParameter("perfil");
                String pass = request.getParameter("password");

                usuario = new usuario();
                usuario.setNombre(nom);
                usuario.setTelefono(telefono);
                usuario.setCorreo(correo);
                usuario.setTipoDocumento(tipoDoc);
                usuario.setNumeroDocumento(numDoc);
                usuario.setPerfil(perfil);
                usuario.setPassword(pass);
                //validamos que el registro se realice correctamente
                boolean validar = udao.registrarUsuario(usuario);
                //si el usuario es correcto inicia al sstema de una vez
                if (validar) {
                    if (usuario.getPerfil().equalsIgnoreCase("Proveedor")) {
                        request.getSession().setAttribute("sesion", usuario);
                        productos = pdao.listarProductosDelProveedor(usuario.getIdUsuario());
                        request.setAttribute("misProductos", productos);
                        request.getRequestDispatcher("Vistas/perfil.jsp").forward(request, response);
                    }
                } else {
                    request.getRequestDispatcher("Vistas/registro.jsp").forward(request, response);
                }
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case "logout":
                request.getSession().invalidate();
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case "buscar":
                String busqueda = request.getParameter("busqueda");
                productos = pdao.buscarProductos(busqueda);
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;

            case "carrito":
                total_a_pagar = 0;
                for (int i = 0; i < carrito.size(); i++) {
                    total_a_pagar = total_a_pagar + carrito.get(i).getPrecio();
                    //JOptionPane.showMessageDialog(null, carrito.get(i).getNombreProducto());
                }
                request.setAttribute("carrito", carrito);
                request.setAttribute("total_a_pagar", total_a_pagar);
                request.getRequestDispatcher("Vistas/carrito.jsp").forward(request, response);
                break;

            case "agregarCarrrito":
                cant = 1;
                idp = Integer.parseInt(request.getParameter("idp"));
                carrito_de_compra carr = new carrito_de_compra();
                pro = new producto();
                pro = pdao.retornarUnProducto(idp);
                carr.setIdCarrito(carrito.size() + 1);
                carr.setIdProducto(idp);
                carr.setIdUsuario(usuario.getClass().cast(request.getSession().getAttribute("sesion")).getIdUsuario());
                carr.setCantidad(cant);
                carr.setNombreProducto(pro.getNombre());
                carr.setPrecio(pro.getPrecio());
                carrito.add(carr);
                //JOptionPane.showMessageDialog(null, carrito.size());
                request.setAttribute("carrito", carrito);
                request.getRequestDispatcher("controlador?accion=volverinicio").forward(request, response);
                break;

            case "eliminarDelCarrito":
                // obtienen el parametro del id del producto, en ese caso coloquÃ© "idp" pero ya eso depende del
                //valor del name que ustedes el coloquen al input type hidden que contiene el valor del id
                idp = Integer.parseInt(request.getParameter("idp"));
                if (carrito != null) {
                    for (int i = 0; i < carrito.size(); i++) {
                        if (carrito.get(i).getIdProducto() == idp) {
                            carrito.remove(i);
                        }
                    }
                }
                request.setAttribute("carrito", carrito);
                //redireccionan a la pagina que deseen
                request.getRequestDispatcher("controlador?accion=carrito").forward(request, response);
                break;

            case "vaciarCarrito":
                total_a_pagar = 0;
                carrito.clear();
                request.setAttribute("carrito", carrito);
                request.setAttribute("numeroProductosCarrito", carrito.size());
                request.setAttribute("total_a_pagar", total_a_pagar);
                request.getRequestDispatcher("Vistas/carrito.jsp").forward(request, response);
                break;

            case "Agregar":
                String nombre = request.getParameter("nombre");
                Part part = request.getPart("imagen");
                InputStream inputStream = part.getInputStream();
                int pegi = Integer.parseInt(request.getParameter("pegi"));
                int existencias = Integer.parseInt(request.getParameter("existencias"));

                String categoria = request.getParameter("categoria");
                String descripcion = request.getParameter("descripcion");
                int precio = Integer.parseInt(request.getParameter("precio"));

                String plataforma = request.getParameter("plataforma");
                pro = new producto();
                pro.setNombre(nombre);
                pro.setImagen(inputStream);
                pro.setPegi(pegi);
                pro.setExistencia(existencias);
                pro.setCategoria(categoria);
                pro.setDescripcion(descripcion);
                pro.setPrecio(precio);
                pro.setIdProveedor(usuario.getClass().cast(request.getSession().getAttribute("sesion")).getIdUsuario());
                pro.setPlataforma(plataforma);
                pdao.agregarProducto(pro);
                request.getRequestDispatcher("Vistas/add-producto.jsp").forward(request, response);
                break;
            case "actualizarProducto":
                pro = new producto();
                /*
                     En este campo colocas todos los atributos que deseas modificar con el mismo metodo con el que 
                     estamos recibiendo todas las variables del frontend(request.getParameter),
                     despues de eso, con los campos que se recibieron se los agregan al objeto producto(pro) de la 
                     misma manera con la que hemos estado haciendolo
                 */
                pdao.actualizarProducto(pro);
                //redireccionan a la pagina que deseen
                request.getRequestDispatcher("???").forward(request, response);
                break;
            case "eliminarProducto":
                idp = Integer.parseInt(request.getParameter("idp"));
                pdao.eliminarProducto(idp);
                request.getRequestDispatcher("controlador?accion=volverperfil").forward(request, response);
                break;
            case "listarImagen":
                idp = Integer.parseInt(request.getParameter("id"));
                pdao.listarImagen(idp, response);
                break;
            case "volverperfil":
                if (usuario != null) {
                    //validamos si el usuario tiene un perfil igual a proveedor
                    if (usuario.getPerfil().equalsIgnoreCase("Proveedor")) {
                        //se crea una sesion del usuario
                        request.getSession().setAttribute("sesion", usuario);
                        //se retornan los productos del proveedor
                        productos = pdao.listarProductosDelProveedor(usuario.getIdUsuario());
                        //creamos un atributo para mostrar los productos del proveedor
                        request.setAttribute("misProductos", productos);
                        //redireccionamos a la pagina de inicio del proveedor en el marketplace
                        request.getRequestDispatcher("Vistas/perfil.jsp").forward(request, response);
                    }
                }
                break;

            case "volverinicio":
                if (usuario != null) {
                    if (usuario.getPerfil().equalsIgnoreCase("Cliente")) {
                        request.getSession().setAttribute("sesion", usuario);
                        request.getRequestDispatcher("Vistas/vistacliente.jsp").forward(request, response);
                    }
                }
                if (usuario == null) {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }

                break;

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
