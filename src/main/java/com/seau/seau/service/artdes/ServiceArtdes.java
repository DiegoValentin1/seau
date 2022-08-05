package com.seau.seau.service.artdes;

import com.seau.seau.model.administrador.BeanAdministrador;
import com.seau.seau.model.administrador.DaoAdministrador;
import com.seau.seau.model.artdes.BeanArtdes;
import com.seau.seau.model.artdes.DaoArtdes;
import com.seau.seau.utils.ResultAction;

import java.util.List;

public class ServiceArtdes {
    DaoArtdes daoArtdes = new DaoArtdes();

    public List<BeanArtdes> getAll(){
        return daoArtdes.findAll();
    }

    public ResultAction save(BeanArtdes artdes){
        ResultAction result = new ResultAction();
        if (daoArtdes.save(artdes)){
            result.setResult(true);
            result.setMessage("Artdes registrado correctamente");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Ocurrió un error al registrar");
            result.setStatus(400);
        }
        return result;
    }

    public ResultAction update(BeanArtdes artdes){
        ResultAction result = new ResultAction();
        if (daoArtdes.update(artdes)){
            result.setStatus(200);
            result.setResult(false);
            result.setMessage("Artdes actualizado correctamente");
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
            if (daoArtdes.delete(Long.parseLong(id))){
                result.setStatus(200);
                result.setResult(false);
                result.setMessage("Artdes eliminado correctamente");
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
