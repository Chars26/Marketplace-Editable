$(document).ready(function () {
   $("div #btn__eliminar").click(function () {
        idp = $(this).parent("div").find("#idp").val();
        location.href = "controlador?accion=eliminarProducto&idp="+idp;
    });
    
       $("div #btnAgregar").click(function () {
        idp = $(this).parent("div").find("#idp").val();
        location.href = "controlador?accion=agregarCarrrito&idp="+idp;
    });
});/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


