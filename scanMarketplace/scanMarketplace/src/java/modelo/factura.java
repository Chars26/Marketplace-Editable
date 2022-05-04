/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;


public class factura {
    private int idFactura;
    private String nombreProducto;
    private String fecha;
    private int precio;
    private String categoria;
    private int idCarrito;

    public factura() {
    }

    public factura(int idFactura, String nombreProducto, String fecha, int precio, String categoria, int idCarrito) {
        this.idFactura = idFactura;
        this.nombreProducto = nombreProducto;
        this.fecha = fecha;
        this.precio = precio;
        this.categoria = categoria;
        this.idCarrito = idCarrito;
    }

    public int getIdFactura() {
        return idFactura;
    }

    public void setIdFactura(int idFactura) {
        this.idFactura = idFactura;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getIdCarrito() {
        return idCarrito;
    }

    public void setIdCarrito(int idCarrito) {
        this.idCarrito = idCarrito;
    }


}
