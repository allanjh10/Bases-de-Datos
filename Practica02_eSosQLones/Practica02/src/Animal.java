/**
 * Clase que representa a un veterinario del zoológico
 * @author Estrada García Luis Gerardo
 * @author Jiménez Hernández Allan  
 * @author Mancera Quiroz Javier Alejandro
 * @author Mora Hernández Dulce Julieta
 * @author Peña Nuñez Axel Yael
 * @version 10/09/2023
 */

 public class Animal {
    private String nombre;
    private String especie;
    private double peso;
    private double altura;
    private String sexo;
    private int numJaula;
    private String alimentacion;
    private String indMed;

    /**
     * @return El nombre del animal.
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre El nuevo nombre del animal.
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return La especie del animal.
     */
    public String getEspecie() {
        return especie;
    }

    /**
     * @param especie La nueva especie del animal.
     */
    public void setEspecie(String especie) {
        this.especie = especie;
    }

    /**
     * @return El peso del animal.
     */
    public double getPeso() {
        return peso;
    }

    /**
     * @param peso El nuevo peso del animal.
     */
    public void setPeso(double peso) {
        this.peso = peso;
    }

    /**
     * @return La altura del animal.
     */
    public double getAltura() {
        return altura;
    }

    /**
     * @param altura La nueva altura del animal.
     */
    public void setAltura(double altura) {
        this.altura = altura;
    }

    /**
     * @return El sexo del animal.
     */
    public String getSexo() {
        return sexo;
    }

    /**
     * @param sexo El nuevo sexo del animal.
     */
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    /**
     * @return El número de la jaula donde está alojado el animal.
     */
    public int getNumJaula() {
        return numJaula;
    }

    /**
     * @param numJaula El nuevo número de la jaula del animal.
     */
    public void setNumJaula(int numJaula) {
        this.numJaula = numJaula;
    }

    /**
     * @return La alimentación del animal.
     */
    public String getAlimentacion() {
        return alimentacion;
    }

    /**
     * @param alimentacion La nueva alimentación del animal.
     */
    public void setAlimentacion(String alimentacion) {
        this.alimentacion = alimentacion;
    }

    /**
     * @return Las indicaciones médicas del animal.
     */
    public String getIndMed() {
        return indMed;
    }

    /**
     * @param indMed Las nuevas indicaciones médicas del animal.
     */
    public void setIndMed(String indMed) {
        this.indMed = indMed;
    }

    /**
     * @return Una cadena que representa la información del animal.
     */
    @Override
    public String toString() {
        return this.nombre + "," + this.especie + "," + this.peso + "," + this.altura + "," + this.sexo + '\'' +
                "," + this.numJaula + "," + this.alimentacion + "," + this.indMed;
    }
}
