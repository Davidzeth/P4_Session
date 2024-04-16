package com.emergentes.controlador;

import com.emergentes.modelo.Inscrito;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");

        HttpSession ses = request.getSession();
        ArrayList<Inscrito> lista = (ArrayList<Inscrito>) ses.getAttribute("listaest");

        switch (op) {
            case "nuevo":
                request.setAttribute("miobjest", new Inscrito());
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                int id = Integer.parseInt(request.getParameter("id"));
                int pos = buscarPorIndice(request, id);
                Inscrito objest = lista.get(pos);
                request.setAttribute("miobjest", objest);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                int posEliminar = buscarPorIndice(request, idEliminar);
                if (posEliminar >= 0) {
                    lista.remove(posEliminar);
                }
                response.sendRedirect("index.jsp");
                break;
            default:
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        ArrayList<Inscrito> lista = (ArrayList<Inscrito>) ses.getAttribute("listaest");
        if (lista == null) {
            lista = new ArrayList<>();
            ses.setAttribute("listaest", lista);
        }
        Inscrito objest = new Inscrito();
        objest.setId(obtenerId(request));
        objest.setFecha(request.getParameter("fecha"));
        objest.setNombre(request.getParameter("nombre"));
        objest.setApellidos(request.getParameter("apellidos"));
        objest.setTurno(request.getParameter("turno"));
        objest.setSeminarios(request.getParameterValues("seminarios"));
        lista.add(objest);
        response.sendRedirect("index.jsp");
    }

    public int buscarPorIndice(HttpServletRequest request, int id) {
        HttpSession ses = request.getSession();
        ArrayList<Inscrito> lista = (ArrayList<Inscrito>) ses.getAttribute("listaest");

        int pos = -1;

        if (lista != null) {
            for (int i = 0; i < lista.size(); i++) {
                if (lista.get(i).getId() == id) {
                    pos = i;
                    break;
                }
            }
        }
        return pos;
    }

    public int obtenerId(HttpServletRequest request) {
        HttpSession ses = request.getSession();
        ArrayList<Inscrito> lista = (ArrayList<Inscrito>) ses.getAttribute("listaest");

        int idn = 0;
        if (lista != null && !lista.isEmpty()) {
            idn = lista.get(lista.size() - 1).getId();
        }
        return idn + 1;
    }
}
