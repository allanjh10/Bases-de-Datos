package com.example.demo.mapper;

import com.example.demo.models.Insumo;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class InsumoRowMapper implements RowMapper<Insumo> {
@Override
    public Insumo mapRow(ResultSet rs, int rowNum) throws SQLException {
        Insumo in = new Insumo();
        in.setId_Insumo(rs.getInt("id_Insumo"));
        in.setFechaCad(rs.getDate("fechaCad"));
        in.setProveedor(rs.getString("proveedor"));
        in.setSeRefrigera(rs.getBoolean("seRefrigera"));
        in.setNombre(rs.getString("nombre"));
        in.setCantidad(rs.getDouble("cantidad"));
        
        return in;       
    }
}