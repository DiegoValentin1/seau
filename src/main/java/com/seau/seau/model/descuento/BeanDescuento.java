package com.seau.seau.model.descuento;

import java.util.Date;

public class BeanDescuento {
    private long ID_det;
    private Date fecha_fin;
    private long por_descuento;
    private long fk_stock;

    public BeanDescuento() {
    }

    public BeanDescuento(long ID_det, Date fecha_fin, long por_descuento, long fk_stock) {
        this.ID_det = ID_det;
        this.fecha_fin = fecha_fin;
        this.por_descuento = por_descuento;
        this.fk_stock = fk_stock;
    }

    public long getID_det() {
        return ID_det;
    }

    public void setID_det(long ID_det) {
        this.ID_det = ID_det;
    }

    public Date getFecha_fin() {
        return fecha_fin;
    }

    public void setFecha_fin(Date fecha_fin) {
        this.fecha_fin = fecha_fin;
    }

    public long getPor_descuento() {
        return por_descuento;
    }

    public void setPor_descuento(long por_descuento) {
        this.por_descuento = por_descuento;
    }

    public long getFk_stock() {
        return fk_stock;
    }

    public void setFk_stock(long fk_stock) {
        this.fk_stock = fk_stock;
    }
}
