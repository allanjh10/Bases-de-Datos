package com.example.demo.services;

import com.example.demo.models.Animal;
import com.example.demo.repositories.AnimalRepository;
import jakarta.annotation.Resource;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnimalBiomaServiceImp implements AnimalService {
    @Autowired
    private AnimalRepository animalRepositorio;

    @Override
    public List<Animal> findAll() {
        return animalRepositorio.findAll();
    }

    @Override
    public void insertAnimal(Animal animal) {
        animalRepositorio.insertAnimal(animal);
    }

    @Override
    public void updateAnimal(Animal animal) {
        animalRepositorio.updateAnimal(animal);
    }
    
    @Override
    public void deleteAnimal(Animal animal) {
        animalRepositorio.deleteAnimal(animal);
    }
}
