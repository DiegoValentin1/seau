package com.seau.seau.model.articulo;

public class BeanArticulo {
    private long ID;
    private String nombre;
    private String dec1;
    private String dec2;
    private String categoria;
    private String imagen;

    public BeanArticulo() {
    }

    public BeanArticulo(long ID, String nombre, String dec1, String dec2, String categoria, String imagen) {
        this.ID = ID;
        this.nombre = nombre;
        this.dec1 = dec1;
        this.dec2 = dec2;
        this.categoria = categoria;
        this.imagen = imagen;
    }

    public long getID() {
        return ID;
    }

    public void setID(long ID) {
        this.ID = ID;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDec1() {
        return dec1;
    }

    public void setDec1(String dec1) {
        this.dec1 = dec1;
    }

    public String getDec2() {
        return dec2;
    }

    public void setDec2(String dec2) {
        this.dec2 = dec2;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
}
