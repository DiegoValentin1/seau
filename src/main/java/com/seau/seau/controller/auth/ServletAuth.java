package com.seau.seau.controller.auth;

import com.seau.seau.model.auth.BeanUser;
import com.seau.seau.service.articulo.ServiceArticulo;
import com.seau.seau.service.auth.AuthService;
import com.seau.seau.service.descuento.ServiceDescuento;
import com.seau.seau.service.stock.ServiceStock;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ServletAuth",
        urlPatterns = {"/login", "/logout", "/singin", "/admin"})

public class ServletAuth extends HttpServlet {
    Logger logger = Logger.getLogger("ServletAuth");
    String action;
    String urlRedirect = "/login";
    HttpSession session;
    AuthService authService = new AuthService();
    ServiceArticulo serviceArticulo = new ServiceArticulo();
    ServiceDescuento serviceDescuento = new ServiceDescuento();
    ServiceStock serviceStock= new ServiceStock();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        action = req.getServletPath();
        logger.log(Level.INFO, "Path->"+action);
        switch (action){
            case "/logout":
                session = req.getSession();
                session.invalidate();
                urlRedirect = "/";
                break;
            case "/login":
                urlRedirect = "/views/articulo/login.jsp";
                break;
            case "/admin":
                req.setAttribute("articulos", serviceArticulo.getAll());
                req.setAttribute("descuentos", serviceDescuento.getAll());
                req.setAttribute("stocks", serviceStock.getAll());
                urlRedirect = "/views/articulo/admin.jsp";
                break;
            default:
                urlRedirect = "/login";
                break;
        }
        req.getRequestDispatcher(urlRedirect).forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        action = req.getServletPath();
        switch (action) {
            case "/login":
                String username = req.getParameter("username");
                String password = req.getParameter("password");
                BeanUser user = authService.login(username, password);
                if (user != null) {
                    session = req.getSession();
                    session.setAttribute("user", user);
                    //user.getRole() == "ADMIN" -> /dashboard
                    //user.getRole() == "STUDENT" -> /perfil
                    urlRedirect = "/admin";

                } else {
                    urlRedirect = "/?message=" + URLEncoder.encode(
                            "Usuario y/o contraseña incorrectos",
                            StandardCharsets.UTF_8.name());
                }
                break;
            default:
                session = req.getSession();
                session.invalidate();
                urlRedirect = "/login";
                break;
        }
        resp.sendRedirect(req.getContextPath() + urlRedirect);
    }
}
