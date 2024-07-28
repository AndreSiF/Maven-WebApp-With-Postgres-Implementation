<%--
  Created by IntelliJ IDEA.
  User: andre
  Date: 7/10/2024
  Time: 7:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Selecionar Abrigo</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style> h1{background: #000000; color: #FFFFFF; text-align: center;} .pad{padding: 20px;}</style>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="Home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Gerenciar Vítimas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="CadVolControl">Gerenciar Voluntários</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="AbrigoController">Gerenciar Abrigos</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
    <div class="pad">
        <h1> Selecionar Abrigo </h1>
        <table class="table pad borda">
            <thead>
            <tr>
                <th> Nome </th>
                <th> Endereço </th>
                <th> Vagas </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="ab" items="${abrigos}">
                <tr>
                    <td> ${ab.nome}</td>
                    <td> ${ab.endereco}</td>
                    <td> ${ab.vagas}</td>
                    <td>
                        <c:if test="${ab.vagas > 0}">
                            <a class="btn btn-primary" href="http://localhost:8080/Gerenciamento_de_Abrigos/VitimaController?abrigoid=${ab.id_abrigo}"> Selecionar abrigo </a>
                        </c:if>
                        <c:if test="${ab.vagas == 0}">
                            <p class="btn btn-disabled"> Lotado </p>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
