package com.seau.seau.model.artdes;

public class BeanArtdes {
    private long id;
    private long fk_articulo;
    private long fk_descuento;

    public BeanArtdes() {
    }

    public BeanArtdes(long id, long fk_articulo, long fk_descuento) {
        this.id = id;
        this.fk_articulo = fk_articulo;
        this.fk_descuento = fk_descuento;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getFk_articulo() {
        return fk_articulo;
    }

    public void setFk_articulo(long fk_articulo) {
        this.fk_articulo = fk_articulo;
    }

    public long getFk_descuento() {
        return fk_descuento;
    }

    public void setFk_descuento(long fk_descuento) {
        this.fk_descuento = fk_descuento;
    }
}
