package com.mounut.controlador;

import com.mounut.modelo.Disenador;
import com.mounut.modelo.DisenadorDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "srvDisenador", urlPatterns = {"/Disenador"})
public class srvDisenador extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");

        if (request.getParameter("accion") != null) {
            String accion = request.getParameter("accion");
            switch (accion) {
                case "listar":
                    this.listarDisenadores(response);
                    break;
                case "agregar":
                    this.registrarDisenadores(request, response);
                    break;
                case "leer":
                    this.presentarDisenadores(request, response);
                    break;
                case "editar":
                    this.actualizarDisenadores(request, response);
                    break;
                case "desactivar":
                    this.desactivarDisenadores(request, response);
                    break;
            }
        } else {
            this.printError("No se indico la operacion a realizar", response);
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

    private void printError(String msjError, HttpServletResponse response) throws IOException {
        response.getWriter().print("{\"msj\": \"" + msjError + "\"}");

    }
    private void printMessage(String msj, boolean rpt, HttpServletResponse response) throws IOException {
        response.getWriter().print("{\"rpt\": " + rpt + ", \"msj\": \"" + msj + "\"}");
    }
    private void listarDisenadores(HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        try {
            DisenadorDAO dao = new DisenadorDAO();
            List<Disenador> emp = dao.listar();
            Gson gson = new Gson();
            String json = gson.toJson(emp);
            out.print(json);
        } catch (Exception e) {
            this.printError(e.getMessage(), response);
        }
    }
    private void registrarDisenadores(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getParameter("mar") != null) {
            Gson gson = new Gson();
            Disenador cli = gson.fromJson(request.getParameter("mar"), Disenador.class);
            String rpt;
            try {
                DisenadorDAO dao = new DisenadorDAO();
                dao.registrar(cli);
                rpt = "Registrada";
                this.printMessage("Disenador " + rpt + " correctamente", true, response);
            } catch (Exception e) {
                this.printMessage(e.getMessage(), false, response);
            }
        } else {
            this.printMessage("Rellene el formulario", false, response);
        }
    }
    private void presentarDisenadores(HttpServletRequest request, HttpServletResponse response) throws IOException {
        DisenadorDAO dao;
        Disenador mar;
        if (request.getParameter("id") != null) {
            mar = new Disenador();
            mar.setCodigo(Integer.parseInt(request.getParameter("id")));
            try {
                dao = new DisenadorDAO();
                mar = dao.leer(mar);
                String json = new Gson().toJson(mar);
                response.getWriter().print(json);
            } catch (Exception e) {
                this.printMessage(e.getMessage(), false, response);
            }
        } else {
            this.printMessage("No se tiene el parametro de la marca", false, response);
        }
    }
    private void actualizarDisenadores(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getParameter("mar") != null) {
            Gson gson = new Gson();
            Disenador mar = gson.fromJson(request.getParameter("mar"), Disenador.class);
            String rpt;
            try {
                DisenadorDAO dao = new DisenadorDAO();
                dao.actualizar(mar);
                rpt = "Actualizada";
                this.printMessage("Disenador " + rpt + " correctamente", true, response);
            } catch (Exception e) {
                this.printMessage(e.getMessage(), false, response);
            }
        } else {
            this.printMessage("Rellene el formulario", false, response);
        }
    }
    private void desactivarDisenadores(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Disenador disenador;
        if (request.getParameter("id") != null) {
            disenador = new Disenador();
            disenador.setCodigo(Integer.parseInt(request.getParameter("id")));
            try {
                DisenadorDAO dao = new DisenadorDAO();
                dao.desactivarMarca(disenador);
                this.printMessage("Disenador desactivada correctamente", true, response);
            } catch (Exception e) {
                this.printMessage(e.getMessage(), false, response);
            }
        } else {
            this.printMessage("No se tiene parametro de la categoria", false, response);
        }
    }
}
