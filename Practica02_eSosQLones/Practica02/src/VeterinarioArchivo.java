/**
 *Clase que permite escribir y leer a Veterinario sobre un archivo CSV
 * @author Estrada García Luis Gerardo
 * @author Jiménez Hernández Allan  
 * @author Mancera Quiroz Javier Alejandro
 * @author Mora Hernández Dulce Julieta
 * @author Peña Nuñez Axel Yael
 * @version 10/09/2023
 */
public class VeterinarioArchivo extends LeeryEscribir{

    /**
     * Constructor por omision que crea el archivo Veterinario.csv
     */
    public VeterinarioArchivo(){
	     super("Veterinario.csv");
    }

    /**
     * Método que prepara el arreglo de Veterinario para que puede ser guardado
     * @param Veterinario -- El arreglo de Veterinarios
     */
    public void escribeVeterinario(Veterinario Veterinario[]) {
	     String linea = "";
	      for(Veterinario p : Veterinario){
		        linea += p + "\n";
	      }
	       super.escribeArchivo(linea);
	  }

    public Veterinario[] leeVeterinario() throws ArchivoNoExiste{
        String lineas[] = super.leeArchivo();
        Veterinario Veterinarios[] = new Veterinario[lineas.length];
        for(int i = 0; i < Veterinarios.length ; i++){
            if(!lineas[i].equals("null")){
                Veterinarios[i] = this.parseaVeterinario(lineas[i]);
            }
        }
        return Veterinarios;
    }


    /**
     * Metodo que recibe una cadena y parsea los datos para crear a un Veterinario
     * @param cadenaVeterinario -- la cadena paresear
     * @return el objeto con los datos de la cadena
     */
    private Veterinario parseaVeterinario(String cadenaVeterinario){
        String linea[] = cadenaVeterinario.trim().split(",");
        String rfc = linea[0];
        String nombre = linea[1];
        String apellidoPat = linea[2];
        String apellidoMat = linea[3];
        String calle = linea[4];
        int numIntAux = Integer.parseInt(numInt);
        int numExtAux = Integer.parseInt(numExt);
        String colonia = linea[5];
        String estado = linea[6];
        int telefonoAux = Integer.parseInt(telefono);
        String fechaInicio = linea[7];
        String fechaFin = linea[8];
        String fechaNac = linea[9];
        String correo = linea[10];
        String genero = linea[11];
        String especialidad = linea[12];
        double salarioAux = Double.parseDouble(salario);

        return new Veterinario(rfc,nombre,apellidoPat,apellidoMat,calle,numIntAux,numExtAux,colonia,estado,
                            telefonoAux,fechaInicio,fechaFin,fechaNac,correo,genero,especialidad,salarioAux);
    }




}
