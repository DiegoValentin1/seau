package com.seau.seau.service.stock;

import com.seau.seau.model.articulo.BeanArticulo;
import com.seau.seau.model.articulo.DaoArticulo;
import com.seau.seau.model.stock.BeanStock;
import com.seau.seau.model.stock.DaoStock;
import com.seau.seau.utils.ResultAction;

import java.util.List;

public class ServiceStock {
    DaoStock daoStock = new DaoStock();

    public List<BeanStock> getAll(){
        return daoStock.findAll();
    }

    public ResultAction save(BeanStock stock){
        ResultAction result = new ResultAction();
        if (daoStock.save(stock)){
            result.setResult(true);
            result.setMessage("Stock registrado correctamente");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Ocurrió un error al registrar");
            result.setStatus(400);
        }
        return result;
    }

    public ResultAction update(BeanStock stock){
        ResultAction result = new ResultAction();
        if (daoStock.update(stock)){
            result.setStatus(200);
            result.setResult(false);
            result.setMessage("Stock actualizado correctamente");
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
            if (daoStock.delete(Long.parseLong(id))){
                result.setStatus(200);
                result.setResult(false);
                result.setMessage("Stock eliminado correctamente");
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
