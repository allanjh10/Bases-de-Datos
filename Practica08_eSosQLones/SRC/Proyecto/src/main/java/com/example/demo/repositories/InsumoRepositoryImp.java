package com.example.demo.repositories;

import com.example.demo.models.Insumo;
import com.example.demo.mapper.InsumoRowMapper;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
public class InsumoRepositoryImp implements InsumoRepository{

    NamedParameterJdbcTemplate template;
    
    public InsumoRepositoryImp(NamedParameterJdbcTemplate template){
        this.template = template;
    }
    @Override
    public List<Insumo> findAll() {
        return template.query("SELECT * FROM Insumo", new InsumoRowMapper());
    }

    @Override
    public void insertInsumo(Insumo in) {
        final String sql = "INSERT INTO Insumo(id_Insumo, fechaCad, proveedor,"
            + " seRefrigera, nombre, cantidad"
            + ") values (:id_Insumo,:fechaCad,:proveedor,"
                + ":seRefrigera,:nombre,:cantidad)";
        KeyHolder holder = new GeneratedKeyHolder();
        SqlParameterSource param = new MapSqlParameterSource()           
                .addValue("id_Insumo", in.getId_Insumo())
                .addValue("fechaCad", in.getFechaCad())
                .addValue("proveedor", in.getProveedor())
                .addValue("seRefrigera", in.getSeRefrigera())                
                .addValue("nombre", in.getNombre())
                .addValue("cantidad", in.getCantidad());
        template.update(sql,param,holder);
        
    }
    

    @Override
    public void updateInsumo(Insumo in) {
            final String sql = "UPDATE Insumo SET id_Insumo=:id_Insumo,"
                    + "fechaCad=:fechaCad,proveedor=:proveedor,"
                    + "seRefrigera=:seRefrigera,nombre=:nombre,"
                    + "cantidad=:cantidad "
                    + "WHERE id_Insumo=:id_Insumo";
            
        KeyHolder holder = new GeneratedKeyHolder();
        SqlParameterSource param = new MapSqlParameterSource()
                .addValue("id_Insumo", in.getId_Insumo())
                .addValue("fechaCad", in.getFechaCad())
                .addValue("proveedor", in.getProveedor())
                .addValue("seRefrigera", in.getSeRefrigera())
                .addValue("nombre", in.getNombre())
                .addValue("cantidad", in.getCantidad());
        template.update(sql,param,holder);
    }

    @Override
    public void executeUpdateInsumo(Insumo in) {
        
        final String sql = "UPDATE Insumo SET id_Insumo=:id_Insumo,"
                    + "fechaCad=:fechaCad,proveedor=:proveedor,"
                    + "seRefrigera=:seRefrigera,nombre=:nombre,cantidad=:cantidad "
                    + "WHERE id_Insumo=:id_Insumo";
            
        Map<String,Object> map = new HashMap<String,Object>();
                map.put("id_Insumo", in.getId_Insumo());
                map.put("fechaCad", in.getFechaCad());
                map.put("proveedor", in.getProveedor());
                map.put("seRefrigera", in.getSeRefrigera());
                map.put("nombre", in.getNombre());
                map.put("cantidad", in.getCantidad());
                
                template.execute(sql,map,new PreparedStatementCallback<Object>(){
                @Override
                public Object doInPreparedStatement(PreparedStatement ps)
                    throws SQLException, DataAccessException{
                    return ps.executeUpdate();
                }
                    
                });
        
    }

    @Override
    public void deleteInsumo(Insumo in) {
        final String sql = "DELETE FROM Insumo WHERE id_Insumo=:id_Insumo";
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("id_Insumo",in.getId_Insumo());
            template.execute(sql,map,new PreparedStatementCallback<Object>(){
                @Override
                public Object doInPreparedStatement(PreparedStatement ps)
                    throws SQLException, DataAccessException{
                    return ps.executeUpdate();
                }
                    
            });
    }
    
}