package com.seau.seau.service.administrador;

import com.seau.seau.model.administrador.BeanAdministrador;
import com.seau.seau.model.administrador.DaoAdministrador;
import com.seau.seau.model.articulo.BeanArticulo;
import com.seau.seau.model.articulo.DaoArticulo;
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
}
