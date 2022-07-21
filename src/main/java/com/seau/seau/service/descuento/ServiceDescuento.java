package com.seau.seau.service.descuento;

import com.seau.seau.model.articulo.BeanArticulo;
import com.seau.seau.model.articulo.DaoArticulo;
import com.seau.seau.model.descuento.BeanDescuento;
import com.seau.seau.model.descuento.DaoDescuento;
import com.seau.seau.utils.ResultAction;

import java.util.List;

public class ServiceDescuento {
    DaoDescuento daoDescuento = new DaoDescuento();

    public List<BeanDescuento> getAll(){
        return daoDescuento.findAll();
    }

    public ResultAction save(BeanDescuento descuento){
        ResultAction result = new ResultAction();
        if (daoDescuento.save(descuento)){
            result.setResult(true);
            result.setMessage("Descuento registrado correctamente");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Ocurrió un error al registrar");
            result.setStatus(400);
        }
        return result;
    }
}
