package com.example.demo.mapper;

import com.example.demo.models.Animal;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class AnimalRowMapper implements RowMapper<Animal> {
    @Override
    public Animal mapRow(ResultSet rs, int rowNum) throws SQLException {
        Animal animal = new Animal();
        animal.setIdAnimal(rs.getInt("id_animal"));
        animal.setRfc(rs.getString("rfc"));
        animal.setNumJaula(rs.getInt("num_jaula"));
        animal.setNombre(rs.getString("nombre"));
        animal.setAlimentacion(rs.getString("alimentacion"));
        animal.setSexo(rs.getString("sexo").charAt(0)); // Asumiendo que la columna 'sexo' contiene al menos un carácter.
        animal.setAltura(rs.getDouble("altura"));
        animal.setPeso(rs.getDouble("peso"));
        animal.setEspecie(rs.getString("especie"));
        
        return animal;       
    }
}
