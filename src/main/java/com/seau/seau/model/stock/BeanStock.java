package com.seau.seau.model.stock;

public class BeanStock {
    private long ID_stk;
    private String talla;
    private String color;
    private long stock;
    private double precio;
    private long fk_articulo;
    private String imagen;

    public BeanStock() {
    }

    public BeanStock(long ID_stk, String talla, String color, long stock, double precio, long fk_articulo, String imagen) {
        this.ID_stk = ID_stk;
        this.talla = talla;
        this.color = color;
        this.stock = stock;
        this.precio = precio;
        this.fk_articulo = fk_articulo;
        this.imagen = imagen;
    }

    public long getID_stk() {
        return ID_stk;
    }

    public void setID_stk(long ID_stk) {
        this.ID_stk = ID_stk;
    }

    public String getTalla() {
        return talla;
    }

    public void setTalla(String talla) {
        this.talla = talla;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public long getStock() {
        return stock;
    }

    public void setStock(long stock) {
        this.stock = stock;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public long getFk_articulo() {
        return fk_articulo;
    }

    public void setFk_articulo(long fk_articulo) {
        this.fk_articulo = fk_articulo;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
}
