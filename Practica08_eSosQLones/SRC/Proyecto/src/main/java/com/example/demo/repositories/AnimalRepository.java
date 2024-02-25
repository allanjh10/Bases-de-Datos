package com.example.demo.repositories;

import com.example.demo.models.Animal;
import java.util.List;

public interface AnimalRepository {

    List<Animal> findAll();
    void insertAnimal(Animal an);
    void updateAnimal(Animal an);
    void executeUpdateAnimal(Animal an);
    public void deleteAnimal (Animal an);
    
}
