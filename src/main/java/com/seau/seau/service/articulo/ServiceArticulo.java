package com.seau.seau.service.articulo;

import com.seau.seau.model.articulo.BeanArticulo;
import com.seau.seau.model.articulo.DaoArticulo;
import com.seau.seau.utils.ResultAction;

import java.util.List;

public class ServiceArticulo {
    DaoArticulo daoArticulo = new DaoArticulo();

    public List<BeanArticulo> getAll(){
        return daoArticulo.findAll();
    }

    public ResultAction save(BeanArticulo articulo){
        ResultAction result = new ResultAction();
        if (daoArticulo.save(articulo)){
            result.setResult(true);
            result.setMessage("Articulo registrado correctamente");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Ocurrió un error al registrar");
            result.setStatus(400);
        }
        return result;
    }
}
