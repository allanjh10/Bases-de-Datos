/**
 * Clase que representa a un veterinario del zoológico
 * @author Estrada García Luis Gerardo
 * @author Jiménez Hernández Allan  
 * @author Mancera Quiroz Javier Alejandro
 * @author Mora Hernández Dulce Julieta
 * @author Peña Nuñez Axel Yael
 * @version 10/09/2023
 */

public class Veterinario{
    private String rfc;
    private String nombre;
    private String apellidoPat;
    private String apellidoMat;
    private String calle;
    private int numInt;
    private int numExt;
    private String colonia;
    private String estado;
    private int telefono;
    private String fechaInicio;
    private String fechaFin;
    private String fechaNac;
    private String correo;
    private String genero;
    private String especialidad;
    private double salario;

    /**
     * Constructor por omisión.
     * Inicializa todas las variables con valores predeterminados.
     */
    public Veterinario() {
        this.rfc = "";
        this.nombre = "";
        this.apellidoPat = "";
        this.apellidoMat = "";
        this.calle = "";
        this.numInt = 0;
        this.numExt = 0;
        this.colonia = "";
        this.estado = "";
        this.telefono = 0;
        this.fechaInicio = "";
        this.fechaFin = "";
        this.fechaNac = "";
        this.correo = "";
        this.genero = "";
        this.especialidad = "";
        this.salario = 0.0;
    }

    /**
     * Constructor por parámetros.
     * Inicializa todas las variables con los valores proporcionados.
     */
    public Veterinario(String rfc, String nombre, String apellidoPat, String apellidoMat, String calle, int numInt, int numExt, String colonia, String estado, int telefono, String fechaInicio, String fechaFin, String fechaNac, String correo, String genero, String especialidad, double salario) {
        this.rfc = rfc;
        this.nombre = nombre;
        this.apellidoPat = apellidoPat;
        this.apellidoMat = apellidoMat;
        this.calle = calle;
        this.numInt = numInt;
        this.numExt = numExt;
        this.colonia = colonia;
        this.estado = estado;
        this.telefono = telefono;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.fechaNac = fechaNac;
        this.correo = correo;
        this.genero = genero;
        this.especialidad = especialidad;
        this.salario = salario;
    }

    // Getters y setters con documentación para cada uno.

    /**
     * @return El RFC del veterinario.
     */
    public String getRfc() {
        return rfc;
    }

    /**
     * @param rfc El nuevo RFC del veterinario.
     */
    public void setRfc(String rfc) {
        this.rfc = rfc;
    }

    /**
     * @return El nombre del veterinario.
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre El nuevo nombre del veterinario.
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

        /**
     * @return El apellido paterno del veterinario.
     */
    public String getApellidoPat() {
        return apellidoPat;
    }

    /**
     * @param apellidoPat El nuevo apellido paterno del veterinario.
     */
    public void setApellidoPat(String apellidoPat) {
        this.apellidoPat = apellidoPat;
    }

    /**
     * @return El apellido materno del veterinario.
     */
    public String getApellidoMat() {
        return apellidoMat;
    }

    /**
     * @param apellidoMat El nuevo apellido materno del veterinario.
     */
    public void setApellidoMat(String apellidoMat) {
        this.apellidoMat = apellidoMat;
    }

    /**
     * @return La calle del domicilio del veterinario.
     */
    public String getCalle() {
        return calle;
    }

    /**
     * @param calle La nueva calle del domicilio del veterinario.
     */
    public void setCalle(String calle) {
        this.calle = calle;
    }

    /**
     * @return El número interior del domicilio del veterinario.
     */
    public int getNumInt() {
        return numInt;
    }

    /**
     * @param numInt El nuevo número interior del domicilio del veterinario.
     */
    public void setNumInt(int numInt) {
        this.numInt = numInt;
    }

    /**
     * @return El número exterior del domicilio del veterinario.
     */
    public int getNumExt() {
        return numExt;
    }

    /**
     * @param numExt El nuevo número exterior del domicilio del veterinario.
     */
    public void setNumExt(int numExt) {
        this.numExt = numExt;
    }

    /**
     * @return La colonia del domicilio del veterinario.
     */
    public String getColonia() {
        return colonia;
    }

    /**
     * @param colonia La nueva colonia del domicilio del veterinario.
     */
    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    /**
     * @return El estado de residencia del veterinario.
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param estado El nuevo estado de residencia del veterinario.
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

    /**
     * @return El teléfono del veterinario.
     */
    public int getTelefono() {
        return telefono;
    }

    /**
     * @param telefono El nuevo número de teléfono del veterinario.
     */
    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    /**
     * @return La fecha de inicio de labores del veterinario.
     */
    public String getFechaInicio() {
        return fechaInicio;
    }

    /**
     * @param fechaInicio La nueva fecha de inicio de labores del veterinario.
     */
    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    /**
     * @return La fecha de fin de labores del veterinario.
     */
    public String getFechaFin() {
        return fechaFin;
    }

    /**
     * @param fechaFin La nueva fecha de fin de labores del veterinario.
     */
    public void setFechaFin(String fechaFin) {
        this.fechaFin = fechaFin;
    }

    /**
     * @return La fecha de nacimiento del veterinario.
     */
    public String getFechaNac() {
        return fechaNac;
    }

    /**
     * @param fechaNac La nueva fecha de nacimiento del veterinario.
     */
    public void setFechaNac(String fechaNac) {
        this.fechaNac = fechaNac;
    }

    /**
     * @return El correo electrónico del veterinario.
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * @param correo El nuevo correo electrónico del veterinario.
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     * @return El género del veterinario.
     */
    public String getGenero() {
        return genero;
    }

    /**
     * @param genero El nuevo género del veterinario.
     */
    public void setGenero(String genero) {
        this.genero = genero;
    }

    /**
     * @return La especialidad del veterinario.
     */
    public String getEspecialidad() {
        return especialidad;
    }

    /**
     * @param especialidad La nueva especialidad del veterinario.
     */
    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    /**
     * @return El salario del veterinario.
     */
    public double getSalario() {
        return salario;
    }

    /**
     * @param salario El nuevo salario del veterinario.
     */
    public void setSalario(double salario) {
        this.salario = salario;
    }

    @Override
    public String toString() {
        return this.rfc + "," + this.nombre + "," + this.apellidoPat + "," + this.apellidoMat + "," + 
        this.calle + "," + this.numInt + "," + this.numExt + "," + this.colonia + "," + this.estado 
        + "," + this.telefono + "," + this.fechaInicio + "," + this.fechaFin + "," + this.fechaNac 
        + "," + this.correo + "," + this.genero + "," + this.especialidad + "," + this.salario;
    }

}



