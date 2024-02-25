package com.example.demo.services;

import com.example.demo.models.Animal;
import java.util.List;

public interface AnimalService {
    List<Animal> findAll();
    void insertAnimal(Animal animal);
    void updateAnimal(Animal animal);
    void deleteAnimal(Animal animal);
}
