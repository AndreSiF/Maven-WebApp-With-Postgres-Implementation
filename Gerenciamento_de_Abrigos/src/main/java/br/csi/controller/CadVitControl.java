package br.csi.controller;

import br.csi.dao.AbrigoDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class CadVitControl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("abrigos", new AbrigoDAO().getAbrigos());
        RequestDispatcher rd = req.getRequestDispatcher("/cadVitima.jsp");
        rd.forward(req, resp);
    }
}
