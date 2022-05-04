/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import configuraciones.conexion;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import modelo.producto;
import modelo.producto;


public class productoDAO {

    //creamos las variables para conectar la base de datos
    Connection con;
    //creamos una instancia con la clase que creamos en el paquete setting
    conexion conexion = new conexion();
    //aqui preparamos la declaracion sql
    PreparedStatement preparedStatement;
    //aqui se retornan datos en las consultas sql
    ResultSet resultSet;

    public void agregarProducto(producto producto) {
        String sql = "insert into producto (Nombre,Precio,Descripcion,Existencia,Pegi,Imagen,Categoria,Plataforma,IdProveedor) values(?,?,?,?,?,?,?,?,?)";

        try {
            con = conexion.getConexion();
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, producto.getNombre());
            preparedStatement.setInt(2, producto.getPrecio());
            preparedStatement.setString(3, producto.getDescripcion());
            preparedStatement.setInt(4, producto.getExistencia());
            preparedStatement.setInt(5, producto.getPegi());
            preparedStatement.setBlob(6, producto.getImagen());
            preparedStatement.setString(7, producto.getCategoria());
            preparedStatement.setString(8, producto.getPlataforma());
            preparedStatement.setInt(9, producto.getIdProveedor());
            preparedStatement.executeUpdate();

        } catch (Exception e) {
        } finally {
            try {
                con.close();
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, "clase= " + getClass().getName() + ", metodo=" + getClass().getEnclosingMethod().getName() + ", error= " + e.getMessage());
            } finally {
                try {
                    con.close();
                } catch (Exception e) {
                }
            }
        }
    }

    //---------------------------------este metodo retorna todos los productos
    public List retornarProductos() {
        List<producto> productos = new ArrayList();
        String sql = "select * from producto";

        try {
            con = conexion.getConexion();
            preparedStatement = con.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                producto p = new producto();
                p.setIdProducto(resultSet.getInt(1));
                p.setNombre(resultSet.getString(2));
                p.setPrecio(resultSet.getInt(3));
                p.setDescripcion(resultSet.getString(4));
                p.setExistencia(resultSet.getInt(5));
                p.setPegi(resultSet.getInt(6));
                p.setImagen(resultSet.getBinaryStream(7));
                p.setCategoria(resultSet.getString(8));
                p.setPlataforma(resultSet.getString(9));
                p.setIdProveedor(resultSet.getInt(10));
                productos.add(p);
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "clase= " + getClass().getName() + ", metodo=" + getClass().getEnclosingMethod().getName() + ", error= " + e.getMessage());

        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }

        return productos;
    }

    //--------------------------------------------este metodo retorna un producto
    public producto retornarUnProducto(int idProducto) {
        producto p = new producto();
        String sql = "select * from producto where idProducto=" + idProducto;

        try {
            con = conexion.getConexion();
            preparedStatement = con.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                p.setIdProducto(resultSet.getInt(1));
                p.setNombre(resultSet.getString(2));
                p.setPrecio(resultSet.getInt(3));
                p.setDescripcion(resultSet.getString(4));
                p.setExistencia(resultSet.getInt(5));
                p.setPegi(resultSet.getInt(6));
                p.setImagen(resultSet.getBinaryStream(7));
                p.setCategoria(resultSet.getString(8));
                p.setPlataforma(resultSet.getString(9));
                p.setIdProveedor(resultSet.getInt(10));
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "clase= " + getClass().getName() + ", metodo=" + getClass().getEnclosingMethod().getName() + ", error= " + e.getMessage());

        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }

        return p;
    }

    //----------------------este metodo sirve para retornar los productos del proveedor 
    //que especifique con su id en los parametros de este metodo
    public List<producto> listarProductosDelProveedor(int idProveedor) {
        List<producto> productos = new ArrayList();
        String sql = "select * from producto where idProveedor=" + idProveedor;

        try {
            con = conexion.getConexion();
            preparedStatement = con.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                producto p = new producto();
                p.setIdProducto(resultSet.getInt(1));
                p.setNombre(resultSet.getString(2));
                p.setPrecio(resultSet.getInt(3));
                p.setDescripcion(resultSet.getString(4));
                p.setExistencia(resultSet.getInt(5));
                p.setPegi(resultSet.getInt(6));
                p.setImagen(resultSet.getBinaryStream(7));
                p.setCategoria(resultSet.getString(8));
                p.setPlataforma(resultSet.getString(9));
                p.setIdProveedor(resultSet.getInt(10));
                productos.add(p);
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "clase= " + getClass().getName() + ", metodo=" + getClass().getEnclosingMethod().getName() + ", error= " + e.getMessage());

        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }

        return productos;
    }

    //este metodo actualiza datos de un producto
    public void actualizarProducto(producto producto) {
        //--  String sql = "update producto set _nombre de la columna_=" + ? +", _nombre de la columna_=" + ? +" where idProducto=" + producto.getIdProducto();

        try {
            con = conexion.getConexion();
            //--    preparedStatement = con.prepareStatement(sql);
            preparedStatement.executeUpdate();

        } catch (Exception e) {
        } finally {
            try {
                con.close();
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, "error= " + e.getMessage());
            } finally {
                try {
                    con.close();
                } catch (Exception e) {
                }
            }
        }
    }

    //------------------------elimina un producto
    public void eliminarProducto(int idProducto) {
        String sql = "delete from producto where idProducto=" + idProducto;

        try {
            con = conexion.getConexion();
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.executeUpdate();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "error= " + e.getMessage());
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
    }

    //este metodo sirve para leer la secuencia de bytes que guarda la imagen del producto y asi construirla 
    public void listarImagen(int id, HttpServletResponse response) {
        String sql = "select Imagen from producto where IdProducto=" + id;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;

        try {
            outputStream = response.getOutputStream();
            con = conexion.getConexion();
            preparedStatement = con.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {

                inputStream = resultSet.getBinaryStream(1);
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }
        } catch (Exception e) {
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
    }

    //este metodo sirve para que el cliente pueda realizar busquedas de productos
    public List buscarProductos(String busqueda) {
        List<producto> lista = new ArrayList();
        String sql = "select * from producto where Nombre like \'%" + busqueda + "%\' order by Nombre asc";

        try {
            con = conexion.getConexion();
            preparedStatement = con.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                producto p = new producto();
                p.setIdProducto(resultSet.getInt(1));
                p.setNombre(resultSet.getString(2));
                p.setPrecio(resultSet.getInt(3));
                p.setDescripcion(resultSet.getString(4));
                p.setExistencia(resultSet.getInt(5));
                p.setPegi(resultSet.getInt(6));
                p.setImagen(resultSet.getBinaryStream(7));
                p.setCategoria(resultSet.getString(8));
                p.setPlataforma(resultSet.getString(9));
                p.setIdProveedor(resultSet.getInt(10));
                lista.add(p);
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "clase= " + getClass().getName() + ", metodo=" + getClass().getEnclosingMethod().getName() + ", error= " + e.getMessage());

        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
        return lista;
    }

}
