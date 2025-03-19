
package app.models.pckg;

public class Multimedia {

    private int id;
    private String titulo;
    private String descripcion;
    private String url;
    private String tipo;

    public Multimedia(String titulo, String descripcion, String url, String tipo) {
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.url = url;
        this.tipo = tipo;
    }

    public Multimedia(int id, String titulo, String descripcion, String url, String tipo) {
        this.id = id;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.url = url;
        this.tipo = tipo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    
}
