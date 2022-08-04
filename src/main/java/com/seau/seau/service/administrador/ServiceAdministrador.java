package com.seau.seau.service.administrador;

import com.seau.seau.model.administrador.BeanAdministrador;
import com.seau.seau.model.administrador.DaoAdministrador;
import com.seau.seau.model.articulo.BeanArticulo;
import com.seau.seau.model.articulo.DaoArticulo;
import com.seau.seau.model.descuento.BeanDescuento;
import com.seau.seau.utils.ResultAction;

import java.util.List;

public class ServiceAdministrador {
    DaoAdministrador daoAdministrador = new DaoAdministrador();

    public List<BeanAdministrador> getAll(){
        return daoAdministrador.findAll();
    }

    public ResultAction save(BeanAdministrador administrador){
        ResultAction result = new ResultAction();
        if (daoAdministrador.save(administrador)){
            result.setResult(true);
            result.setMessage("Admin registrado correctamente");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Ocurrió un error al registrar");
            result.setStatus(400);
        }
        return result;
    }

    public ResultAction update(BeanAdministrador administrador){
        ResultAction result = new ResultAction();
        if (daoAdministrador.update(administrador)){
            result.setStatus(200);
            result.setResult(false);
            result.setMessage("Administrador actualizado correctamente");
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
            if (daoAdministrador.delete(Long.parseLong(id))){
                result.setStatus(200);
                result.setResult(false);
                result.setMessage("Administrador eliminado correctamente");
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
