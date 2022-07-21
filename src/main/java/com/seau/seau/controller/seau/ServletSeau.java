package com.seau.seau.controller.seau;

import com.seau.seau.service.articulo.ServiceArticulo;
import com.seau.seau.service.descuento.ServiceDescuento;
import com.seau.seau.service.stock.ServiceStock;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ServletSeau",
        urlPatterns = {
                "/home",
                "/producto",
                "/create-pokemon",
                "/update-pokemon",
                "/get-pokemon"
        })

public class ServletSeau extends HttpServlet {
    Logger logger = Logger.getLogger("ServletSeau");
    String action;
    String urlRedirect = "/home";

    ServiceArticulo serviceArticulo = new ServiceArticulo();
    ServiceDescuento serviceDescuento = new ServiceDescuento();
    ServiceStock serviceStock= new ServiceStock();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
            action = request.getServletPath();
            logger.log(Level.INFO, "Path->"+action);
            switch (action){
                case "/home":
                    request.setAttribute("articulos", serviceArticulo.getAll());
                    request.setAttribute("descuentos", serviceDescuento.getAll());
                    request.setAttribute("stocks", serviceStock.getAll());
                    urlRedirect = "/views/articulo/index2.jsp";
                    break;
                case "/producto":
                    request.setAttribute("articulos", serviceArticulo.getAll());
                    request.setAttribute("descuentos", serviceDescuento.getAll());
                    request.setAttribute("stocks", serviceStock.getAll());
                    urlRedirect = "/views/articulo/producto.jsp";
                    break;
                default:
                    request.setAttribute("articulos",serviceArticulo.getAll());
                    urlRedirect = "/home";
                    break;
            }
            request.getRequestDispatcher(urlRedirect).forward(request, response);
    }
}
