package com.example.demo.models;

public class Animal {
    private int idAnimal;
    private String rfc;
    private int numJaula;
    private String nombre;
    private String alimentacion;
    private char sexo;
    private double altura;
    private double peso;
    private String especie;

    // Constructor vacío
    public Animal() {
    }

    // Constructor con parámetros
    public Animal(int idAnimal, String rfc, int numJaula, String nombre, String alimentacion, char sexo, double altura, double peso, String especie) {
        this.idAnimal = idAnimal;
        this.rfc = rfc;
        this.numJaula = numJaula;
        this.nombre = nombre;
        this.alimentacion = alimentacion;
        this.sexo = sexo;
        this.altura = altura;
        this.peso = peso;
        this.especie = especie;
    }

    // Getters
    public int getIdAnimal() {
        return idAnimal;
    }

    public String getRfc() {
        return rfc;
    }

    public int getNumJaula() {
        return numJaula;
    }

    public String getNombre() {
        return nombre;
    }

    public String getAlimentacion() {
        return alimentacion;
    }

    public char getSexo() {
        return sexo;
    }

    public double getAltura() {
        return altura;
    }

    public double getPeso() {
        return peso;
    }

    public String getEspecie() {
        return especie;
    }

    // Setters
    public void setIdAnimal(int idAnimal) {
        this.idAnimal = idAnimal;
    }

    public void setRfc(String rfc) {
        this.rfc = rfc;
    }

    public void setNumJaula(int numJaula) {
        this.numJaula = numJaula;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setAlimentacion(String alimentacion) {
        this.alimentacion = alimentacion;
    }

    public void setSexo(char sexo) {
        this.sexo = sexo;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public void setEspecie(String especie) {
        this.especie = especie;
    }

    @Override
    public String toString() {
        return "Animal{" +
                "idAnimal=" + idAnimal +
                ", rfc='" + rfc + '\'' +
                ", numJaula=" + numJaula +
                ", nombre='" + nombre + '\'' +
                ", alimentacion='" + alimentacion + '\'' +
                ", sexo=" + sexo +
                ", altura=" + altura +
                ", peso=" + peso +
                ", especie='" + especie + '\'' +
                '}';
    }
}
