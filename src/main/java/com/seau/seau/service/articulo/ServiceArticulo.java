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

    public ResultAction update(BeanArticulo articulo){
        ResultAction result = new ResultAction();
        if (daoArticulo.update(articulo)){
            result.setStatus(200);
            result.setResult(false);
            result.setMessage("Articulo actualizado correctamente");
        }else{
            result.setStatus(400);
            result.setResult(true);
            result.setMessage("Ocurrió un error");
        }
        return result;
    }

    public ResultAction delete(String id){
        ResultAction result = new ResultAction();
        try{
            if (daoArticulo.delete(Long.parseLong(id))){
                result.setStatus(200);
                result.setResult(false);
                result.setMessage("Articulo eliminado correctamente");
            }else{
                result.setStatus(400);
                result.setResult(true);
                result.setMessage("Ocurrió un error");
            }
        }catch (NumberFormatException e){
            result.setStatus(400);
            result.setResult(true);
            result.setMessage("Ocurrió un error");
        }
        return result;
    }
}
