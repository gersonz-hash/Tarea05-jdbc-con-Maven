package edu.umg.programacion2.clase05.modelo;

/**
 * Representa un estudiante tal como se guarda en la tabla `estudiantes`.
 *
 * IMPORTANTE: esta es una clase de dominio simple: solo datos + encapsulamiento
 * (atributos privados + getters/setters). No sabe nada de SQL ni de conexiones a
 * base de datos - esa responsabilidad es de EstudianteDAO. Separar "que es un
 * estudiante" de "como se guarda un estudiante" es una idea que van a ver una y
 * otra vez en el curso.
 */
public class Estudiante {

    private int id;
    private String nombre;
    private String carnet;
    private int edad;
    private int activo;
    private String tipo;
    
    public Estudiante(int id, String nombre, String carnet, int edad, int activo, String tipo) {
		this.id = id;
		this.nombre = nombre;
		this.carnet = carnet;
		this.edad = edad;
		this.activo = activo;
		this.tipo = tipo;
	}

	// Constructor de conveniencia para cuando todavia no existe en la base de
    // datos (por eso id = 0: MySQL le va a asignar el id real al insertarlo).
    public Estudiante(String nombre, String carnet, int edad, int activo, String tipo) {
        this(0, nombre, carnet, edad, activo, tipo);
    }

    public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}

	public int getActivo() {
		return activo;
	}

	public void setActivo(int activo) {
		this.activo = activo;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCarnet() {
        return carnet;
    }

    @Override
    public String toString() {
        return String.format("[%d] %s - carnet %s", id, nombre, carnet);
    }
}
