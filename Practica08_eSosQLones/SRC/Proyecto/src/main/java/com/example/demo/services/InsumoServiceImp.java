package com.example.demo.services;

import com.example.demo.models.Insumo;
import com.example.demo.repositories.InsumoRepository;
import jakarta.annotation.Resource;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InsumoServiceImp implements InsumoService{
    @Resource
    private InsumoRepository inRep;

    @Override
    public List<Insumo> findAll() {
        return inRep.findAll();
    }
   

    @Override
    public void insertInsumo(Insumo in) {
        inRep.insertInsumo(in);
    }

    @Override
    public void updateInsumo(Insumo in) {
        inRep.updateInsumo(in);
    }

    @Override
    public void executeUpateInsumo(Insumo in) {
        inRep.executeUpdateInsumo(in);
    }

    @Override
    public void deleteInsumo(Insumo in) {
        inRep.deleteInsumo(in);
    }
}