package com.example.demo.controllers;

import com.example.demo.models.Animal;
import com.example.demo.services.AnimalService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/postgressApp")
public class AnimalController {

    @Autowired
    private AnimalService animalServicio;

    @GetMapping(value="/animalList")
    public List<Animal> getAnimales() {
        return animalServicio.findAll();
    }

    @PostMapping(value="/createAnimal")
    public void createAnimal(@RequestBody Animal animal) {
        animalServicio.insertAnimal(animal);
    }

    @PutMapping(value="/updateAnimal")
    public void updateAnimal(@RequestBody Animal animal) {
        animalServicio.updateAnimal(animal);
    }

    @DeleteMapping(value="/deleteAnimalById")
    public void deleteAnimal(@RequestBody Animal animal) {
        animalServicio.deleteAnimal(animal);
    }
    
}
