package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import configuracion.Conexion;
import modelo.Cita;

public class CitaDAO {
    //creamos las variables para conectar la base de datos
    Connection con;
    //creamos una instancia con la clase que creamos en el paquete setting
    Conexion conexion = new Conexion();
    //aqui preparamos la declaracion sql
    PreparedStatement preparedStatement;
    //aqui se retornan datos en las consultas sql
    ResultSet resultSet;

    public List<Cita> getCitas() {
        List<Cita> citas = new ArrayList<>();
        try {
            String sql = "select * from cita";
            con = conexion.getConexion();
            preparedStatement = con.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Cita c = new Cita();
                
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                con.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }

        return citas;
    }
}
