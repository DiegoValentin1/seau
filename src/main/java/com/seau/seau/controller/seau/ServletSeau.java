package com.seau.seau.controller.seau;

import com.seau.seau.model.administrador.BeanAdministrador;
import com.seau.seau.model.articulo.BeanArticulo;
import com.seau.seau.model.descuento.BeanDescuento;
import com.seau.seau.model.stock.BeanStock;
import com.seau.seau.service.administrador.ServiceAdministrador;
import com.seau.seau.service.articulo.ServiceArticulo;
import com.seau.seau.service.descuento.ServiceDescuento;
import com.seau.seau.service.stock.ServiceStock;
import com.seau.seau.utils.ResultAction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ServletSeau",
        urlPatterns = {
                "/home",
                "/producto",
                "/addArt",
                "/addStock",
                "/addDesc",
                "/modArt",
                "/modStock",
                "/modDesc",
                "/delArt",
                "/delStock",
                "/delDesc"
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
                case "/login":
                    urlRedirect = "/views/articulo/login.jsp";
                    break;
                case "/admin":
                    ServiceAdministrador serviceAdministrador= new ServiceAdministrador();
                    List<BeanAdministrador> admins = new ArrayList<>();
                    BeanAdministrador admin = new BeanAdministrador();
                    admins=serviceAdministrador.getAll();
                    for (BeanAdministrador ola:admins){
                        if (ola.getUsername().equals(request.getParameter("user")) && ola.getPassword().equals(request.getParameter("pass"))){
                            request.setAttribute("articulos", serviceArticulo.getAll());
                            request.setAttribute("descuentos", serviceDescuento.getAll());
                            request.setAttribute("stocks", serviceStock.getAll());
                            urlRedirect = "/views/articulo/admin.jsp";
                            break;
                        }else{
                            urlRedirect = "/views/articulo/login.jsp";
                        }
                    }
                    break;
                case "/addArt":
                    urlRedirect = "/views/articulo/addArt.jsp";
                    break;
                case "/addStock":
                    urlRedirect = "/views/articulo/addStock.jsp";
                    break;
                case "/addDesc":
                    urlRedirect = "/views/articulo/addDesc.jsp";
                    break;
                default:
                    request.setAttribute("descuentos", serviceDescuento.getAll());
                    request.setAttribute("stocks", serviceStock.getAll());
                    request.setAttribute("articulos",serviceArticulo.getAll());
                    urlRedirect = "/views/articulo/index2.jsp";
                    break;
            }
            request.getRequestDispatcher(urlRedirect).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        action = request.getServletPath();
        switch(action){
            case "/addArt":
                String nombre = request.getParameter("nombre");
                String dec1 = request.getParameter("dec1");
                String dec2 = request.getParameter("dec2");
                String categoria = request.getParameter("categoria");
                String imagen = request.getParameter("imagen");

                BeanArticulo articulo = new BeanArticulo();
                articulo.setNombre(nombre);
                articulo.setDec1(dec1);
                articulo.setDec2(dec2);
                articulo.setCategoria(categoria);
                articulo.setImagen(imagen);
                ResultAction result = serviceArticulo.save(articulo);
                urlRedirect = "/admin?result="+
                        result.isResult()+"&message="+result.getMessage()
                        +"&status="+result.getStatus();
                break;
            case "/addStock":
                String talla = request.getParameter("talla");
                String color = request.getParameter("color");
                String stock = request.getParameter("stock");
                String precio = request.getParameter("precio");
                String fk_articulo = request.getParameter("fk_articulo");
                String imagen2 = request.getParameter("imagen");

                BeanStock stock2 = new BeanStock();
                stock2.setTalla(talla);
                stock2.setColor(color);
                stock2.setStock(Integer.parseInt(stock));
                stock2.setPrecio(Double.parseDouble(precio));
                stock2.setFk_articulo(Long.parseLong(fk_articulo));
                stock2.setImagen(imagen2);
                ResultAction result2 = serviceStock.save(stock2);
                urlRedirect = "/admin?result="+
                        result2.isResult()+"&message="+result2.getMessage()
                        +"&status="+result2.getStatus();
                break;
            case "/addDesc":
                String fecha_fin = request.getParameter("fecha_fin");
                String por_descuento = request.getParameter("por_descuento");
                String fk_stock = request.getParameter("fk_stock");

                BeanDescuento descuento2 = new BeanDescuento();

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                java.sql.Date fechaConvertida=null;

                try {
                    Date parsed =  dateFormat.parse(fecha_fin);
                    fechaConvertida = new java.sql.Date(parsed.getTime());
                } catch(Exception e) {
                    System.out.println("Error occurred"+ e.getMessage());
                }
                descuento2.setFecha_fin(fechaConvertida);
                descuento2.setPor_descuento(Long.parseLong(por_descuento));
                descuento2.setFk_stock(Long.parseLong(fk_stock));
                ResultAction result3 = serviceDescuento.save(descuento2);
                urlRedirect = "/admin?result="+
                        result3.isResult()+"&message="+result3.getMessage()
                        +"&status="+result3.getStatus();
                break;
            default:
                urlRedirect = "/views/articulo/login.jsp";
                break;
        }
        response.sendRedirect(request.getContextPath() + urlRedirect);
    }

}
