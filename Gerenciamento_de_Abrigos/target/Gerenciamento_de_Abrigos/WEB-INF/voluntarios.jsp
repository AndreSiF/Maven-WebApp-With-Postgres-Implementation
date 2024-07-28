<%--
  Created by IntelliJ IDEA.
  User: andre
  Date: 6/8/2024
  Time: 12:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> Visualizar/Excluir voluntários </title>
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
                        <a class="nav-link active" aria-current="page" href="CadVolControl">Gerenciar Voluntários</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AbrigoController">Gerenciar Abrigos</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="pad">
        <h1> Cadastrar voluntários </h1>
        <form method="post" action="VoluntarioController">
            <div class="mb-3">
                <label for="nome" class="form-label">Nome: </label>
                <input type="text" class="form-control" id="nome" name="nome" required>
            </div>
            <div class="mb-3">
                <label for="cpf" class="form-label">CPF: </label>
                <input type="text" class="form-control" id="cpf" name="cpf" maxlength="14" minlength="14" required>
            </div>
            <div class="mb-3">
                <label for="idade" class="form-label">Idade: </label>
                <input type="number" class="form-control" id="idade" name="idade" required>
            </div>
            <div class="mb-3">
                <label for="endereco" class="form-label">Endereço: </label>
                <input type="text" class="form-control" id="endereco" name="endereco" required>
            </div>
            <input id="abrigo" type="hidden" value="${abrigo.id_abrigo}" name="abrigo">
            <button type="submit" class="btn btn-primary" name="opcao" value="CAD">Cadastrar</button>
        </form>
        <c:if test="${retorno == 'OK'}">
            <div class="alert alert-info" role="alert">
                Voluntário cadastrado com sucesso!
            </div>
        </c:if>
        <c:if test="${retorno == 'DEL'}">
            <div class="alert alert-info" role="alert">
                Voluntário removido com sucesso!
            </div>
        </c:if>
        <c:if test="${retorno == 'error'}">
            <div class="alert alert-warning" role="alert">
                Erro
            </div>
        </c:if>
    </div>
    <div class="pad">
        <h1> Lista de voluntários </h1>
        <table class="table pad borda">
            <thead>
                <tr>
                    <th> Nome </th>
                    <th> CPF </th>
                    <th> Idade </th>
                    <th> Endereço </th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="v" items="${voluntarios}">
                    <tr>
                        <td> ${v.nome}</td>
                        <td> ${v.cpf}</td>
                        <td> ${v.idade}</td>
                        <td> ${v.endereco}</td>
                        <td>
                            <a class="btn btn-danger" href="http://localhost:8080/Gerenciamento_de_Abrigos/VoluntarioController?opcao=DEL&&id=${v.id}&&abrigoid=${abrigo.id_abrigo}"> Excluir </a>
                        </td>
                    </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
