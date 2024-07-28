package br.csi.controller;

import br.csi.dao.AbrigoDAO;
import br.csi.model.Abrigo;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class AbrigoController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opcao;
        String retorno;
        opcao = req.getParameter("opcao");
        if(opcao != null) {
            if (opcao.equals("CAD")) {
                String nome = req.getParameter("nome");
                int vagas = Integer.parseInt(req.getParameter("vagas"));
                String endereco = req.getParameter("endereco");

                Abrigo abrigo = new Abrigo(vagas, nome, endereco);

                retorno = new AbrigoDAO().cadastrar(abrigo);
                req.setAttribute("retorno", retorno);
            }
        }
        req.setAttribute("abrigos", new AbrigoDAO().getAbrigos());
        RequestDispatcher rd = req.getRequestDispatcher("/abrigos.jsp");
        rd.forward(req, resp);
    }
}
