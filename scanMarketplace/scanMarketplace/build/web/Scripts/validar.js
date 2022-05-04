 $(document).ready( function(){
      //  $("#btn__eliminar").click(function(){
        // let idp = $(this).parent("div").find("input").val();
        // window.location.href = "controlador?accion=eliminarProducto&idp="+idp;
         
       // });
    });
    
    let numeroproducto = $("#numeroproducto").val();
    
    for (i = 1; i <= numeroproducto; i++){
        $("#fot button").attr("id", $("#fot button").attr("id")+i);
       
    }
