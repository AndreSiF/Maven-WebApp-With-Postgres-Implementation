package br.csi.controller;

import br.csi.dao.AbrigoDAO;
import br.csi.dao.VitimaDAO;
import br.csi.dao.VoluntarioDAO;
import br.csi.model.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class VoluntarioController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opcao;
        String retorno;
        String abrigoIdSt = req.getParameter("abrigoid");
        int abrigoId = -1;
        if(abrigoIdSt != null){
            abrigoId = Integer.parseInt(abrigoIdSt);
        }
        opcao = req.getParameter("opcao");
        if(opcao != null) {
            if (opcao.equals("CAD")) {
                String nome = req.getParameter("nome");
                String cpf = req.getParameter("cpf");
                String idade = req.getParameter("idade");
                String endereco = req.getParameter("endereco");
                abrigoId = Integer.parseInt(req.getParameter("abrigo"));

                Abrigo abrigo = new Abrigo(abrigoId);
                Permissao p = new Permissao(3, "VOLUNTARIO");
                Usuario u = new Usuario(nome, cpf, Integer.parseInt(idade), p, abrigo);

                Voluntario v = new Voluntario(u, endereco);
                retorno = new VoluntarioDAO().cadastrar(v);
                req.setAttribute("retorno", retorno);
            }
            else if(opcao.equals("DEL")){
                String id = req.getParameter("id");
                retorno = new VoluntarioDAO().excluir(id, abrigoId);
                req.setAttribute("retorno", retorno);
                System.out.println(retorno);
            }
        }
        if(abrigoId != -1){
            req.setAttribute("abrigo", new AbrigoDAO().getAbrigo(abrigoId));
        }
        req.setAttribute("voluntarios", new VoluntarioDAO().getVoluntarios(abrigoId));
        RequestDispatcher rd = req.getRequestDispatcher("/voluntarios.jsp");
        rd.forward(req, resp);
    }
}
