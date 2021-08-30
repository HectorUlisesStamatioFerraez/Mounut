package com.mounut.controlador;

import com.mounut.modelo.*;
import com.mounut.modelo.Disenador;
import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class srvProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");

        if (request.getParameter("accion") != null) {
            String accion = request.getParameter("accion");
            switch (accion) {
                case "listar":
                    this.listarProductos(response);
                    break;
                case "cambiarVigencia":
                    this.cambiarVigencia(request, response);
                    break;
                case "listarProveedores":
                    this.listarProveedores(request, response);
                    break;
                case "listarCategorias":
                    this.listarCategorias(request, response);
                    break;
                case "listarMarcas":
                    this.listarMarcas(request, response);
                    break;
                case "guardarProducto":
                    this.guardarProducto2(request, response);
                    break;
                case "leer":
                    this.leerProducto(request, response);
                    break;
                case "actualizarProducto":
                    this.actualizarProducto(request, response);
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

    private void listarProductos(HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        try {
            ProductoDAO dao = new ProductoDAO();
            List<Producto> pro = dao.listar();
            Gson gson = new Gson();
            String json = gson.toJson(pro);
            out.print(json);
        } catch (Exception e) {
            this.printError(e.getMessage(), response);
        }
    }

    private void cambiarVigencia(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Producto pro;
        if (request.getParameter("id") != null) {
            pro = new Producto();
            pro.setId(Integer.parseInt(request.getParameter("id")));
            try {
                ProductoDAO dao = new ProductoDAO();
                dao.cambiarEstado(pro);
                this.printMessage("Producto desactivado correctamente", true, response);
            } catch (Exception e) {
                this.printMessage(e.getMessage(), false, response);
            }
        } else {
            this.printMessage("No se tiene parametro del producto", false, response);
        }
    }

    private void printMessage(String msj, boolean rpt, HttpServletResponse response) throws IOException {
        response.getWriter().print("{\"rpt\": " + rpt + ", \"msj\": \"" + msj + "\"}");
    }

    private void listarProveedores(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        try {
            Gson gson = new Gson();
            String json = gson.toJson(gson);
            out.print(json);
        } catch (Exception e) {
            this.printError(e.getMessage(), response);
        }
    }

    private void listarCategorias(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        try {
            CategoriaDAO dao = new CategoriaDAO();
            List<Categoria> cate = dao.listar();
            Gson gson = new Gson();
            String json = gson.toJson(cate);
            out.print(json);
        } catch (Exception e) {
            this.printError(e.getMessage(), response);
        }
    }

    private void listarMarcas(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        try {
            DisenadorDAO dao = new DisenadorDAO();
            List<Disenador> mar = dao.listar();
            Gson gson = new Gson();
            String json = gson.toJson(mar);
            out.print(json);
        } catch (Exception e) {
            this.printError(e.getMessage(), response);
        }
    }

    private void guardarProducto2(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Producto pro = null;
        ProductoDAO dao = new ProductoDAO();

        if (request.getParameter("nombreProd") != null) {
            pro = new Producto();
            pro.setNombres(request.getParameter("nombreProd"));
            pro.setPrecio(Double.parseDouble(request.getParameter("precioProd")));
            pro.setStock(Integer.parseInt(request.getParameter("stockProd")));
            pro.setDescripcion(request.getParameter("descripcionProd"));
            pro.setCategoria(new Categoria());
            pro.getCategoria().setCodigo(Integer.parseInt(request.getParameter("combo_categoria")));
            pro.setMarca(new Disenador());
            pro.getMarca().setCodigo(Integer.parseInt(request.getParameter("combo_marca")));
            Part part = request.getPart("txtFoto");
            String nombreArchivo = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            File file = new File("C:\\xampp\\htdocs\\carrito\\" + nombreArchivo);
            Files.copy(part.getInputStream(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);

            pro.setImagen("http://localhost:80/carrito/" + nombreArchivo);

            if (request.getParameter("chkEstadoProducto") != null) {
                pro.setEstado(true);
            } else {
                pro.setEstado(false);
            }
            try {
                dao.registrarProducto(pro);
                response.sendRedirect("backend/productos.jsp");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo registrar el producto" + e.getMessage());
                request.setAttribute("marca", pro);
            }
        } else {
            request.setAttribute("msje", "Complete los campos");
        }
    }

    private void leerProducto(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ProductoDAO dao;
        Producto pro;
        if (request.getParameter("id") != null) {
            pro = new Producto();
            pro.setId(Integer.parseInt(request.getParameter("id")));
            try {
                dao = new ProductoDAO();
                pro = dao.leer(pro);
                String json = new Gson().toJson(pro);
                response.getWriter().print(json);
            } catch (Exception e) {
                this.printMessage(e.getMessage(), false, response);
            }
        } else {
            this.printMessage("No se tiene el parametro del cliente", false, response);
        }
    }

    private void actualizarProducto(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Producto pro = null;
        ProductoDAO dao = new ProductoDAO();

        if (request.getParameter("idProd") != null
                && request.getParameter("nombreProdAc") != null) {
            pro = new Producto();
            pro.setId(Integer.parseInt(request.getParameter("idProd")));
            pro.setNombres(request.getParameter("nombreProdAc"));
            pro.setPrecio(Double.parseDouble(request.getParameter("precioProdAc")));
            pro.setStock(Integer.parseInt(request.getParameter("stockProdAc")));
            pro.setDescripcion(request.getParameter("descripcionProdAc"));
            pro.setCategoria(new Categoria());
            pro.getCategoria().setCodigo(Integer.parseInt(request.getParameter("combo_categoriaAc")));
            pro.setMarca(new Disenador());
            pro.getMarca().setCodigo(Integer.parseInt(request.getParameter("combo_marcaAc")));
            //GUARDAR FOTO
            Part part = request.getPart("txtFotoAc");
            String nombreArchivo = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            File file = new File("C:\\xampp\\htdocs\\carrito\\" + nombreArchivo);
            Files.copy(part.getInputStream(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);

            pro.setImagen("http://localhost:80/carrito/" + nombreArchivo);

            if (request.getParameter("chkEstadoProductoAc") != null) {
                pro.setEstado(true);
            } else {
                pro.setEstado(false);
            }
            try {
                dao.actualizar(pro);
                response.sendRedirect("backend/productos.jsp");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo actualizar el producto" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "Complete los campos");
        }
    }

}
