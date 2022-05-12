window.onload = () => {
alert(window.location)
    if(window.location == "http://localhost:8080/CitaFastv2/Vistas/solCita.jsp") {
        alert("son iguales")
        window.location.href = "controladorCitas?accion=ctrlCitas";
    }

    }
