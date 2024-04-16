<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Inscrito"%>
<%
    if (session.getAttribute("listaest") == null) {
        ArrayList<Inscrito> lisaux = new ArrayList<Inscrito>();
        session.setAttribute("listaest", lisaux);
    }
    ArrayList<Inscrito> lista = (ArrayList<Inscrito>) session.getAttribute("listaest");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .contenedor {
                width: 300px;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ccc;
                text-align: center;
            }
            .titulo {
                text-align: center;
            }
        </style>    
    </head>
    <body>
        <div class="contenedor">
            <p>DEYVID EDILSON CHAMBI AVERANGA</p>
        </div>
        <h1 class="titulo">Registro de Seminarios</h1>
        <button><a href="MainServlet?op=nuevo">Nuevo</a></button>
        <table border ="1">
            <tr>
                <th>Id</th>
                <th>Fecha</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Turno</th>
                <th>Seminarios</th>
                <th></th>
                <th></th>
            </tr>
            <%
                if (lista != null) {
                    for (Inscrito item : lista) {

            %>
            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getFecha()%></td>
                <td><%= item.getNombre()%></td>
                <td><%= item.getApellidos()%></td>
                <td><%= item.getTurno()%></td>
                <td><%
                    String[] seminarios = item.getSeminarios();
                    if (seminarios != null) {
                        for (String seminario : seminarios) {
                            out.println(seminario + "<br>");
                        }
                    }
                    %></td>


                <td>
                    <a href="MainServlet?op=editar&id=<%= item.getId()%>">Editar</a>
                </td>
                <td>
                    <a href="MainServlet?op=eliminar&id=<%= item.getId()%>"
                       onclick="return(confirm('Esta seguro de eliminar?'))">Eliminar</a>
                </td>

            </tr>

            <%
                    }
                }
            %>
        </table>
    </body>
</html>
