package com.example.demo.repositories;

import com.example.demo.models.Animal;
import com.example.demo.mapper.AnimalRowMapper;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
public class AnimalRepositoryImp implements AnimalRepository {

    private final NamedParameterJdbcTemplate template;

    public AnimalRepositoryImp(NamedParameterJdbcTemplate template) {
        this.template = template;
    }

    @Override
    public List<Animal> findAll() {
        return template.query("SELECT * FROM animal", new AnimalRowMapper());
    }

    @Override
    public void insertAnimal(Animal animal) {
        final String sql = "INSERT INTO animal (id_animal, rfc, num_jaula, nombre, alimentacion, sexo, altura, peso, especie) " +
                "VALUES (:id_animal, :rfc, :num_jaula, :nombre, :alimentacion, :sexo, :altura, :peso, :especie)";
        KeyHolder holder = new GeneratedKeyHolder();
        SqlParameterSource param = new MapSqlParameterSource()
                .addValue("id_animal", animal.getIdAnimal()) // Incluye id_animal aquí.
                .addValue("rfc", animal.getRfc())
                .addValue("num_jaula", animal.getNumJaula())
                .addValue("nombre", animal.getNombre())
                .addValue("alimentacion", animal.getAlimentacion())
                .addValue("sexo", String.valueOf(animal.getSexo()))
                .addValue("altura", animal.getAltura())
                .addValue("peso", animal.getPeso())
                .addValue("especie", animal.getEspecie());
        template.update(sql, param, holder);
    }
    
    

    @Override
public void updateAnimal(Animal animal) {
    final String sql = "UPDATE animal SET rfc=:rfc, num_jaula=:num_jaula, nombre=:nombre, alimentacion=:alimentacion, " +
            "sexo=:sexo, altura=:altura, peso=:peso, especie=:especie WHERE id_animal=:id_animal"; 
    SqlParameterSource param = new MapSqlParameterSource()
            .addValue("id_animal", animal.getIdAnimal())
            .addValue("rfc", animal.getRfc())
            .addValue("num_jaula", animal.getNumJaula())
            .addValue("nombre", animal.getNombre())
            .addValue("alimentacion", animal.getAlimentacion())
            .addValue("sexo", String.valueOf(animal.getSexo()))
            .addValue("altura", animal.getAltura())
            .addValue("peso", animal.getPeso())
            .addValue("especie", animal.getEspecie());
    template.update(sql, param);
}


    @Override
    public void executeUpdateAnimal(Animal animal) {
        // El código sería idéntico al método 'updateAnimal', por lo que se puede llamar directamente
        updateAnimal(animal);
    }

    @Override
    public void deleteAnimal(Animal animal) {
        final String sql = "DELETE FROM animal WHERE id_animal=:id_animal";
        Map<String, Object> map = new HashMap<>();
        map.put("id_animal", animal.getIdAnimal());
        template.update(sql, map);
    }
}
