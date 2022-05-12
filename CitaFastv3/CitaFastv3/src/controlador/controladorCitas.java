package controlador;

import java.util.List;
import dao.CitaDAO;
import dao.MedicoDAO;
import dao.PacienteDAO;
import modelo.Cita;
import modelo.Medico;
import modelo.Paciente;

/**
 *
 * @author santi
 */
public class controladorCitas extends HttpServlet {

    //creamos una instancia al objeto usuario
    Paciente paciente;
    //creamos una instancia e inicializamos al objeto usuarioDAO
    Medico medico;
    PacienteDAO pdao = new PacienteDAO();
    MedicoDAO mdao = new MedicoDAO();
    CitaDAO cdao = new CitaDAO();

    //estas variables las creamos porque son redundantes en muchos metodos


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Al llamar al servlet este es el primer metodo que se ejecuta(processRequest)
        String idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        //Se toma la variable que se envió por url
        String accion = request.getParameter("accion");
        //se determina que tipo de perfil es el usuario (paciente o medico)
        String perfil = request.getParameter("perfil");
        //se buscan las citas del usuario
        List<Cita> citas = perfil.equals("paciente") ? cdao.getCitasDePaciente(idUsuario) : mdao.getCitasDeMedico(idUsuario);
        //se crea un atributo del metodo request para poder mostrar variables en el front
        request.setAttribute("citas", citas);
        switch (accion) {
            case "home":
                request.setAttribute("citas", citas);
                request.getRequestDispatcher("Vistas/" + perfil.equals("paciente") ? "visPac.jsp" : "visMed.jsp").forward(request, response);
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
