/**
 * Clase que permite escribir y leer a biomas sobre un archivo CSV
 * @author Estrada García Luis Gerardo
 * @author Jiménez Hernández Allan  
 * @author Mancera Quiroz Javier Alejandro
 * @author Mora Hernández Dulce Julieta
 * @author Peña Nuñez Axel Yael
 * @version 10/09/2023
 */
public class BiomaArchivo extends LeeryEscribir {
    /**
     * Constructor por omision que crea el archivo Bioma.csv
     */
    public BiomaArchivo(){
        super("Bioma.csv");
    }

    /**
     * Metodo que prepara el arreglo de biomas para que pueda ser guardado
     * @param Bioma - El arreglo del Bioma
     */
    public void escribeBioma(Bioma Bioma[]){
        String lineaBioma = "";
        for(Bioma o : Bioma){
            lineaBioma += o + "\n";
        }
        super.escribeArchivo(lineaBioma);
    }

    /**
     * Metodo que convierte un arreglo de String a un arreglo de biomas
     * @return biomas  -- El arreglo de biomas
     * @throws ArchivoNoexiste -- Se lanza la excepcion cuando el archivo no existe
     */
    public Bioma[] leebiomas() throws ArchivoNoExiste{
        String lineas[] = super.leeArchivo();
        Bioma biomas[] = new Bioma[lineas.length];
        for(int i = 0; i < biomas.length ; i++){
            if(!lineas[i].equals("null")){
                biomas[i] = this.parseaBioma(lineas[i]);
            }
        }
        return biomas;
    }

    /**
     * Metodo que recibe una cadena y parsea los datos para crear a un Bioma
     * @param cadenaBioma -- la cadena paresear
     * @return el objeto con los datos de la cadena
     */
    private Bioma parseaBioma(String cadenaBioma){
        String linea[] = cadenaBioma.trim().split(",");
        String tipoBioma = linea[0];
        int numJaulasAux = Integer.parseInt(numJaulas);
        int numCuidadoresAux = Integer.parseInt(numCuidadores);
        int numVeterinariosAux = Integer.parseInt(numVeterinarios);
        int numAnimalesAux = Integer.parseInt(numAnimales);
        String servicios = linea[1];

        return new Bioma(tipoBioma,numJaulasAux,numCuidadoresAux,numVeterinariosAux,numAnimalesAux,servicios);
    }
}
