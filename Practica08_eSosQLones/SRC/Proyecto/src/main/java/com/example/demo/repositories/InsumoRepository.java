package com.example.demo.repositories;

import com.example.demo.models.Insumo;
import java.util.List;

public interface InsumoRepository{

    List<Insumo> findAll();
    void insertInsumo(Insumo in);
    void updateInsumo(Insumo in);
    void executeUpdateInsumo(Insumo in);
    public void deleteInsumo(Insumo in);
}
