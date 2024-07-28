<%--
  Created by IntelliJ IDEA.
  User: andre
  Date: 7/10/2024
  Time: 9:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> Visualizar abrigos </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style> h1{background: #000000; color: #FFFFFF; text-align: center;} .pad{padding: 20px;} .borda{border: 2px solid #000000; border-radius: 5px;}</style>
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
                    <a class="nav-link" href="CadVitControl">Gerenciar Vítimas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="CadVolControl">Gerenciar Voluntários</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Gerenciar Abrigos</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="pad">
    <h1> Cadastrar abrigos </h1>
    <form method="post" action="AbrigoController">
        <div class="mb-3">
            <label for="nome" class="form-label">Nome: </label>
            <input type="text" class="form-control" id="nome" name="nome" required>
        </div>
        <div class="mb-3">
            <label for="vagas" class="form-label">Quantidade de vagas: </label>
            <input type="number" class="form-control" id="vagas" name="vagas" required>
        </div>
        <div class="mb-3">
            <label for="endereco" class="form-label">Endereço: </label>
            <input type="text" class="form-control" id="endereco" name="endereco" required>
        </div>
        <button type="submit" class="btn btn-primary" name="opcao" value="CAD">Cadastrar</button>
    </form>
    <c:if test="${retorno == 'OK'}">
        <div class="alert alert-info" role="alert">
            Abrigo cadastrado com sucesso!
        </div>
    </c:if>
    <c:if test="${retorno == 'error'}">
        <div class="alert alert-warning" role="alert">
            Erro
        </div>
    </c:if>
</div>
<div class="pad">
    <h1> Lista de abrigos </h1>
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
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
