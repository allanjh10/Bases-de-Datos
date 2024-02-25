/**
 * Clase que permite escribir y leer a animales sobre un archivo CSV
 * @author Estrada García Luis Gerardo
 * @author Jiménez Hernández Allan  
 * @author Mancera Quiroz Javier Alejandro
 * @author Mora Hernández Dulce Julieta
 * @author Peña Nuñez Axel Yael
 * @version 10/09/2023
 */
public class AnimalArchivo extends LeeryEscribir {
    /**
     * Constructor por omision que crea el archivo Animal.csv
     */
    public AnimalArchivo(){
        super("Animal.csv");
    }

    /**
     * Metodo que prepara el arreglo de Animales para que pueda ser guardado
     * @param Animal - El arreglo del Animal
     */
    public void escribeAnimal(Animal Animal[]){
        String lineaAnimal = "";
        for(Animal o : Animal){
            lineaAnimal += o + "\n";
        }
        super.escribeArchivo(lineaAnimal);
    }

    /**
     * Metodo que convierte un arreglo de String a un arreglo de Animales
     * @return Animales  -- El arreglo de Animales
     * @throws ArchivoNoexiste -- Se lanza la excepcion cuando el archivo no existe
     */
    public Animal[] leeAnimales() throws ArchivoNoExiste{
        String lineas[] = super.leeArchivo();
        Animal Animales[] = new Animal[lineas.length];
        for(int i = 0; i < Animales.length ; i++){
            if(!lineas[i].equals("null")){
                Animales[i] = this.parseaAnimal(lineas[i]);
            }
        }
        return Animales;
    }

    /**
     * Metodo que recibe una cadena y parsea los datos para crear a un Animal
     * @param cadenaAnimal -- la cadena paresear
     * @return el objeto con los datos de la cadena
     */
    private Animal parseaAnimal(String cadenaAnimal){
        String linea[] = cadenaAnimal.trim().split(",");
        String nombre = linea[0];
        String especie = linea[1];
        double pesoAux = Double.parseDouble(peso);
        double alturaAux = Double.parseDouble(altura);
        String sexo = linea[2];
        int numJaulaAux = Integer.parseInt(numJaula);
        String alimentacion = linea[3];
        String indMed = linea[4];

        return new Animal(nombre,especie,pesoAux,alturaAux,sexo,numJaulaAux,alimentacion,indMed);
    }
}
