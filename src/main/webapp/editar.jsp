<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro en Seminarios</title>
</head>
<body>
    <h1>Registro en Seminarios</h1>
    <form action="MainServlet" method="post">
        <label>Id: <input type="number" name="id" readonly></label><br>
        <label>Fecha: <input type="date" name="fecha"></label><br>
        <label>Nombre: <input type="text" name="nombre"></label><br>
        <label>Apellidos: <input type="text" name="apellidos"></label><br>
        <label>Turno:</label><br>
        <input type="radio" name="turno" value="Mañana"> Mañana<br>
        <input type="radio" name="turno" value="Tarde"> Tarde<br>
        <input type="radio" name="turno" value="Noche"> Noche<br>
        <label>Seminarios:</label><br>
        <select multiple name="seminarios">
            <option value="Inteligencia Artificial">Inteligencia Artificial</option>
            <option value="Machine Learning">Machine Learning</option>
            <option value="Simulación con Arena">Simulación con Arena</option>
            <option value="Robótica Educativa">Robótica Educativa</option>
        </select><br>
        <input type="submit" value="Registrar">
    </form>
</body>
</html>
