package com.example.demo.controllers;

import com.example.demo.models.Insumo;
import com.example.demo.services.InsumoService;
import jakarta.annotation.Resource;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/postgressApp")
public class InsumoBiomaController{
    @Resource
    InsumoService inSer;
   
   @GetMapping(value="/inList")
   public List<Insumo> getInsumos(){
       return inSer.findAll();
   }
   @PostMapping(value="/createInsumo")
   public void createInsumo(@RequestBody Insumo in){
       inSer.insertInsumo(in);
   }
   
   @PutMapping(value ="/updateInsumo")
   public void updateInsumo(@RequestBody Insumo in){
      inSer.updateInsumo(in);
   }
   
   @PutMapping(value ="/executeUpdateInsumo")
   public void executeUpdateInsumo(@RequestBody Insumo in){
      inSer.executeUpateInsumo(in);
   }
   
   @DeleteMapping(value = "/deleteInsumoById")
   public void borrarInsumo(@RequestBody Insumo in){
       inSer.deleteInsumo(in);
   }
    
}