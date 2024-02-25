/**
 * Clase que representa a un veterinario del zoológico
 * @author Estrada García Luis Gerardo
 * @author Jiménez Hernández Allan  
 * @author Mancera Quiroz Javier Alejandro
 * @author Mora Hernández Dulce Julieta
 * @author Peña Nuñez Axel Yael
 * @version 10/09/2023
 */
public class Bioma {
    private String tipoBioma;
    private int numJaulas;
    private int numCuidadores;
    private int numVeterinarios;
    private int numAnimales;
    private String servicios;

    /**
     * @return El tipo de bioma.
     */
    public String getTipoBioma() {
        return tipoBioma;
    }

    /**
     * @param tipoBioma El nuevo tipo de bioma.
     */
    public void setTipoBioma(String tipoBioma) {
        this.tipoBioma = tipoBioma;
    }

    /**
     * @return El número de jaulas en el bioma.
     */
    public int getNumJaulas() {
        return numJaulas;
    }

    /**
     * @param numJaulas El nuevo número de jaulas en el bioma.
     */
    public void setNumJaulas(int numJaulas) {
        this.numJaulas = numJaulas;
    }

    /**
     * @return El número de cuidadores en el bioma.
     */
    public int getNumCuidadores() {
        return numCuidadores;
    }

    /**
     * @param numCuidadores El nuevo número de cuidadores en el bioma.
     */
    public void setNumCuidadores(int numCuidadores) {
        this.numCuidadores = numCuidadores;
    }

    /**
     * @return El número de veterinarios en el bioma.
     */
    public int getNumVeterinarios() {
        return numVeterinarios;
    }

    /**
     * @param numVeterinarios El nuevo número de veterinarios en el bioma.
     */
    public void setNumVeterinarios(int numVeterinarios) {
        this.numVeterinarios = numVeterinarios;
    }

    /**
     * @return El número de animales en el bioma.
     */
    public int getNumAnimales() {
        return numAnimales;
    }

    /**
     * @param numAnimales El nuevo número de animales en el bioma.
     */
    public void setNumAnimales(int numAnimales) {
        this.numAnimales = numAnimales;
    }

    /**
     * @return Los servicios disponibles en el bioma.
     */
    public String getServicios() {
        return servicios;
    }

    /**
     * @param servicios Los nuevos servicios disponibles en el bioma.
     */
    public void setServicios(String servicios) {
        this.servicios = servicios;
    }

    /**
     * @return Una cadena que representa la información del bioma.
     */
    @Override
    public String toString() {
        return this.tipoBioma + "," + this.numJaulas + "," + this.numCuidadores + "," + this.numVeterinarios +
        "," + this.numAnimales + "," + this.servicios;
    }
}
