package com.seau.seau.model.descuento;

import java.util.Date;

public class BeanDescuento {
    private long ID_det;
    private Date fecha_fin;
    private long por_descuento;
    private Date fecha_inicio;
    private String mensaje;
    private String imagen;



    public BeanDescuento() {
    }

    public BeanDescuento(long ID_det, Date fecha_fin, long por_descuento, Date fecha_inicio, String mensaje, String imagen) {
        this.ID_det = ID_det;
        this.fecha_fin = fecha_fin;
        this.por_descuento = por_descuento;
        this.fecha_inicio = fecha_inicio;
        this.mensaje = mensaje;
        this.imagen = imagen;
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


    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
}
