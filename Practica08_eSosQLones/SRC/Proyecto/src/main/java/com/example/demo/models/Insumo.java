package com.example.demo.models;

import java.util.Date;

public class Insumo{
    
    private Integer id_Insumo;
    private Date fechaCad;
    private String proveedor;
    private Boolean seRefrigera;
    private String nombre;
    private Double cantidad;
    
    public Insumo(){
    }
    
    public Insumo(Integer id_Insumo, Date fechaCad, String proveedor, Boolean seRefrigera, String nombre, Double cantidad){        
        this.id_Insumo = id_Insumo;
        this.fechaCad = fechaCad;
        this.proveedor = proveedor;
        this.seRefrigera = seRefrigera;
        this.nombre = nombre;
        this.cantidad = cantidad;
     }
    
    public Integer getId_Insumo() {
        return id_Insumo;
    }

    public void setId_Insumo(Integer id_Insumo) {
        this.id_Insumo = id_Insumo;
    }
    
    public Date getFechaCad() {
        return fechaCad;
    }

    public void setFechaCad(Date fechaCad) {
        this.fechaCad = fechaCad;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public Boolean getSeRefrigera() {
        return seRefrigera;
    }

    public void setSeRefrigera(Boolean seRefrigera) {
        this.seRefrigera = seRefrigera;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public double getCantidad() {
        return cantidad;
    }

    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
    }


    @Override
    public String toString() {
        return "Insumo{" + "Id_Insumo =" + id_Insumo + ", fechaCad =" + fechaCad + 
                ", Proveedor=" + proveedor + ", seRefrigera=" 
                + seRefrigera + ", Nombre=" + nombre + ", Cantidad=" + cantidad + '}';
    }
}