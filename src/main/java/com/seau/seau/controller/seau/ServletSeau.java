package com.seau.seau.controller.seau;

import com.seau.seau.model.administrador.BeanAdministrador;
import com.seau.seau.model.articulo.BeanArticulo;
import com.seau.seau.model.articulo.DaoArticulo;
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
                "/delDesc",
                "/buscar",
                "/articulo",
                "/oferta",
                "/usuario",
                "/modUsu",
                "/delUsu",
                "/addUsu"
        })

public class ServletSeau extends HttpServlet {

    Logger logger = Logger.getLogger("ServletSeau");
    String action;
    String urlRedirect = "/home";

    ServiceArticulo serviceArticulo = new ServiceArticulo();
    ServiceDescuento serviceDescuento = new ServiceDescuento();
    ServiceStock serviceStock= new ServiceStock();
    ServiceAdministrador serviceAdministrador= new ServiceAdministrador();
    DaoArticulo daoArticulo = new DaoArticulo();

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
                case "/addArt":
                    urlRedirect = "/views/articulo/addArt.jsp";
                    break;
                case "/addStock":
                    urlRedirect = "/views/articulo/addStock.jsp";
                    break;
                case "/addDesc":
                    urlRedirect = "/views/articulo/addDesc.jsp";
                    break;
                case "/modArt":
                    request.setAttribute("articulos",serviceArticulo.getAll());
                    request.setAttribute("stocks", serviceStock.getAll());
                    urlRedirect = "/views/articulo/modArt.jsp";
                    break;
                case "/modStock":
                    request.setAttribute("stocks", serviceStock.getAll());
                    request.setAttribute("articulos",serviceArticulo.getAll());
                    urlRedirect = "/views/articulo/modStock.jsp";
                    break;
                case "/modDesc":
                    request.setAttribute("descuentos", serviceDescuento.getAll());
                    urlRedirect = "/views/articulo/modDesc.jsp";
                    break;
                case "/buscar":
                    String text = request.getParameter("text");
                    List<BeanArticulo> articulos = daoArticulo.buscar(text);
                    request.setAttribute("stocks", serviceStock.getAll());
                    request.setAttribute("busqueda", articulos);
                    urlRedirect = "/views/articulo/buscar.jsp";
                    break;
                case "/articulo":
                    request.setAttribute("articulos",serviceArticulo.getAll());
                    urlRedirect = "/views/articulo/articulo.jsp";
                    break;
                case "/usuario":
                    request.setAttribute("usuarios",serviceAdministrador.getAll());
                    urlRedirect = "/views/articulo/usuario.jsp";
                    break;
                case "/modUsu":
                    urlRedirect = "/views/articulo/modUsu.jsp";
                    break;
                case "/addUsu":
                    urlRedirect = "/views/articulo/addUsu.jsp";
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
            case "/modArt":
                String MAID = request.getParameter("ID");
                String MAnombre = request.getParameter("nombre");
                String MAdec1 = request.getParameter("dec1");
                String MAdec2 = request.getParameter("dec2");
                String MAcategoria = request.getParameter("categoria");
                String MAimagen = request.getParameter("imagen");

                BeanArticulo MAarticulo = new BeanArticulo();
                MAarticulo.setID(Long.parseLong(MAID));
                MAarticulo.setNombre(MAnombre);
                MAarticulo.setDec1(MAdec1);
                MAarticulo.setDec2(MAdec2);
                MAarticulo.setCategoria(MAcategoria);
                MAarticulo.setImagen(MAimagen);
                ResultAction MAresult = serviceArticulo.update(MAarticulo);
                urlRedirect = "/admin?result="+
                        MAresult.isResult()+"&message="+MAresult.getMessage()
                        +"&status="+MAresult.getStatus();
                break;
            case "/modStock":
                String MSID_stk = request.getParameter("ID_stk");
                String MStalla = request.getParameter("talla");
                String MScolor = request.getParameter("color");
                String MSstock = request.getParameter("stock");
                String MSprecio = request.getParameter("precio");
                String MSfk_articulo = request.getParameter("fk_articulo");
                String MSimagen2 = request.getParameter("imagen");

                BeanStock MSstock2 = new BeanStock();
                MSstock2.setID_stk(Long.parseLong(MSID_stk));
                MSstock2.setTalla(MStalla);
                MSstock2.setColor(MScolor);
                MSstock2.setStock(Integer.parseInt(MSstock));
                MSstock2.setPrecio(Double.parseDouble(MSprecio));
                MSstock2.setFk_articulo(Long.parseLong(MSfk_articulo));
                MSstock2.setImagen(MSimagen2);
                ResultAction MSresult2 = serviceStock.update(MSstock2);
                urlRedirect = "/admin?result="+
                        MSresult2.isResult()+"&message="+MSresult2.getMessage()
                        +"&status="+MSresult2.getStatus();
                break;
            case "/modDesc":
                String MDID_det = request.getParameter("ID_det");
                String MDfecha_fin = request.getParameter("fecha_fin");
                String MDpor_descuento = request.getParameter("por_descuento");
                String MDfk_stock = request.getParameter("fk_stock");

                BeanDescuento MDdescuento2 = new BeanDescuento();

                SimpleDateFormat MDdateFormat = new SimpleDateFormat("yyyy-MM-dd");
                java.sql.Date MDfechaConvertida=null;

                try {
                    Date parsed =  MDdateFormat.parse(MDfecha_fin);
                    MDfechaConvertida = new java.sql.Date(parsed.getTime());
                } catch(Exception e) {
                    System.out.println("Error occurred"+ e.getMessage());
                }
                MDdescuento2.setID_det(Long.parseLong(MDID_det));
                MDdescuento2.setFecha_fin(MDfechaConvertida);
                MDdescuento2.setPor_descuento(Long.parseLong(MDpor_descuento));
                MDdescuento2.setFk_stock(Long.parseLong(MDfk_stock));
                ResultAction MDresult3 = serviceDescuento.update(MDdescuento2);
                urlRedirect = "/admin?result="+
                        MDresult3.isResult()+"&message="+MDresult3.getMessage()
                        +"&status="+MDresult3.getStatus();
                break;
            case "/delArt":
                String DAID = request.getParameter("ID");
                ResultAction DAresult3 = serviceArticulo.delete(DAID);
                urlRedirect = "/admin?result="+
                        DAresult3.isResult()+"&message="+DAresult3.getMessage()
                        +"&status="+DAresult3.getStatus();
                break;
            case "/delStock":
                String DSID_stk = request.getParameter("ID_stk");
                ResultAction DSresult3 = serviceStock.delete(DSID_stk);
                urlRedirect = "/admin?result="+
                        DSresult3.isResult()+"&message="+DSresult3.getMessage()
                        +"&status="+DSresult3.getStatus();
                break;
            case "/delDesc":
                String DDID_det = request.getParameter("ID_det");
                ResultAction DDresult3 = serviceDescuento.delete(DDID_det);
                urlRedirect = "/admin?result="+
                        DDresult3.isResult()+"&message="+DDresult3.getMessage()
                        +"&status="+DDresult3.getStatus();
                break;
            case "/buscar":
                String text = request.getParameter("text");
                List<BeanArticulo> articulos = daoArticulo.buscar(text);
                request.setAttribute("busqueda", articulos);
                urlRedirect = "/buscar";
                break;
            case "/modUsu":
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String MUid = request.getParameter("id");

                BeanAdministrador admin = new BeanAdministrador();
                admin.setId(Long.parseLong(MUid));
                admin.setUsername(username);
                admin.setPassword(password);
                ResultAction MUresult = serviceAdministrador.update(admin);
                urlRedirect = "/admin?result="+
                        MUresult.isResult()+"&message="+MUresult.getMessage()
                        +"&status="+MUresult.getStatus();
                break;
            case "/addUsu":
                String AUusername = request.getParameter("username");
                String AUpassword = request.getParameter("password");
                BeanAdministrador AUadmin = new BeanAdministrador();
                AUadmin.setUsername(AUusername);
                AUadmin.setPassword(AUpassword);
                ResultAction AUresult = serviceAdministrador.save(AUadmin);
                urlRedirect = "/admin?result="+
                        AUresult.isResult()+"&message="+AUresult.getMessage()
                        +"&status="+AUresult.getStatus();
                break;
            case "/delUsu":
                String DUid = request.getParameter("id");
                ResultAction DUresult = serviceAdministrador.delete(DUid);
                urlRedirect = "/admin?result="+
                        DUresult.isResult()+"&message="+DUresult.getMessage()
                        +"&status="+DUresult.getStatus();
                break;
            default:
                urlRedirect = "/views/articulo/login.jsp";
                break;
        }
        response.sendRedirect(request.getContextPath() + urlRedirect);
    }

}
