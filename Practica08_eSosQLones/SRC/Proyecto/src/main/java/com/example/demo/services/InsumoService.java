package com.example.demo.services;

import com.example.demo.models.Insumo;
import java.util.List;

public interface InsumoService {
    List<Insumo> findAll();
    void insertInsumo(Insumo in);
    void updateInsumo(Insumo in);
    void executeUpateInsumo(Insumo in);
    void deleteInsumo(Insumo in);
}
