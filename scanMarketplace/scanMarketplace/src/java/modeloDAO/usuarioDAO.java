/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import configuraciones.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import modelo.usuario;


public class usuarioDAO {
    //en estas clases en las que el nombre incluye DAO (data access object) se realizan todas las consultas sql y operaciones
    //basicas CRUD

    //creamos las variables para conectar la base de datos
    Connection con;
    //creamos una instancia con la clase que creamos en el paquete setting
    conexion conexion = new conexion();
    //aqui preparamos la declaracion sql
    PreparedStatement preparedStatement;
    //aqui se retornan datos en las consultas sql
    ResultSet resultSet;

    //iniciemos con la validaciòn del usuario
    //------------------------------------------------creamos un metodo que retorna un objeto de tipo usuario
    public usuario validarUsuario(String usuario, String password) {
        //creamos una variable tipo string para realizar la consulta sql
        String sql = "select * from usuarios where Correo='" + usuario + "' and Password='" + password + "'";

        /*este tipo de operaciones hay que almacenarlas en un try catch para poder atrapar los errores que nos pueda arrojar
        mysql en caso que tengamos un error ya sea sintactico o logico*/
        try {
            //aqui obtenemos la conexion a la base de datos que creamos en el paquete setting
            con = conexion.getConexion();
            /*aqui preparamos la sentencia sql: PreparedStatement almacena la consulta ya preparada, y prepareStatement prepara la
            consulta sql que declaramos al inicio de la clase*/
            preparedStatement = con.prepareStatement(sql);
            //aqui ejecutamos la consulta y con el resultSet guardamos los datos que arrojó mysql
            resultSet = preparedStatement.executeQuery();

            //aqui verificamos si retornó un valor o no. Si resulSet es true se ejecuta el bucle
            while (resultSet.next()) {
                //inicializamos el objeto "usuario"
                usuario c = new usuario();
                c.setIdUsuario(resultSet.getInt(1));
                c.setTelefono(resultSet.getInt(2));
                c.setCorreo(resultSet.getString(3));
                c.setNombre(resultSet.getString(4));
                c.setPerfil(resultSet.getString(5));
                c.setTipoDocumento(resultSet.getString(6));
                c.setNumeroDocumento(resultSet.getString(7));
                c.setPassword(resultSet.getString(8));

                //despues de haber seteado los valores que devolvio la consulta sql, retornamos el objeto de tipo usuario
                return c;
            }

        } catch (Exception e) {
            //esta linea de codigo ya es interna para que identifiquen el error (en caso de que lo haya)
            JOptionPane.showMessageDialog(null, "error= " + e.getMessage());
        } finally {
            try {
                // esta linea de codigo sirve para cerrar la conexion con la bd
                con.close();
            } catch (Exception e) {
            }
        }
        //si el while no se ejecuta es porque no devolvio ningun valor la consulta sql, por lo tanto retornamos null
        //para hacer saber que la consulta no retorno nada
        return null;
    }

    //-------------------------------metodo que agrega usuario
    public boolean registrarUsuario(usuario usuario) {

        String sql = "select * from usuarios where Correo='" + usuario.getCorreo() + "'";
        try {
            con = conexion.getConexion();
            preparedStatement = con.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return false;
            } else {
                sql = "insert into usuarios (Telefono,Correo,Nombre,Perfil,TipoDocumento,NumeroDocumento,Password) values(?,?,?,?,?,?,?)";
                con = conexion.getConexion();
                preparedStatement = con.prepareStatement(sql);
                preparedStatement.setInt(1, usuario.getTelefono());
                preparedStatement.setString(2, usuario.getCorreo());
                preparedStatement.setString(3, usuario.getNombre());
                preparedStatement.setString(4, usuario.getPerfil());
                preparedStatement.setString(5, usuario.getTipoDocumento());
                preparedStatement.setString(6, usuario.getNumeroDocumento());
                preparedStatement.setString(7, usuario.getPassword());
                preparedStatement.executeUpdate();

                return true;
            }

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
        return false;
    }

    //este metodo retorna todos los usuarios
    public List<usuario> retornarUsuarios() {
        List<usuario> usuarios = new ArrayList();
        String sql = "select * from usuarios";

        try {
            con = conexion.getConexion();
            preparedStatement = con.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                usuario c = new usuario();
                c.setIdUsuario(resultSet.getInt(1));
                c.setTelefono(resultSet.getInt(2));
                c.setCorreo(resultSet.getString(3));
                c.setNombre(resultSet.getString(4));
                c.setPerfil(resultSet.getString(5));
                c.setTipoDocumento(resultSet.getString(6));
                c.setNumeroDocumento(resultSet.getString(7));
                c.setPassword(resultSet.getString(8));
                usuarios.add(c);
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "error= " + e.getMessage());
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }

        return usuarios;
    }

    //este metodo retorna un usuario
    public usuario retornarUnUsuario(int idUsuario) {
        usuario c = new usuario();
        String sql = "select * from usuarios where idUsuario=" + idUsuario;

        try {
            con = conexion.getConexion();
            preparedStatement = con.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                c.setIdUsuario(resultSet.getInt(1));
                c.setTelefono(resultSet.getInt(2));
                c.setCorreo(resultSet.getString(3));
                c.setNombre(resultSet.getString(4));
                c.setPerfil(resultSet.getString(5));
                c.setTipoDocumento(resultSet.getString(6));
                c.setNumeroDocumento(resultSet.getString(7));
                c.setPassword(resultSet.getString(8));
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "error= " + e.getMessage());
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }

        return c;
    }

    //este metodo actualiza datos de un usuario
    public void actualizarUsuario(usuario usuario) {
        //--  String sql = "update usuarios set _nombre de la columna_=" + ? +", _nombre de la columna_=" + ? +" where idUsuario=" + usuario.getIdUsuario();

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

    //-----elimina un usuario
    public void eliminarUsuario(int idUsuario) {
        String sql = "delete from usuarios where idUsuario=" + idUsuario;

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

}
