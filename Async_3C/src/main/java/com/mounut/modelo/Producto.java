package com.mounut.modelo;

import java.io.InputStream;

public class Producto {

    int id;
    String nombres;
    String imagen;
    InputStream foto;
    String descripcion;
    double precio;
    int stock;
    Categoria categoria;
    Disenador disenador;
    boolean estado;

    public Producto() {
    }

    public Producto(int id, String nombres, String imagen, InputStream foto, String descripcion, double precio, int stock, Categoria categoria, Disenador disenador, boolean estado) {
        this.id = id;
        this.nombres = nombres;
        this.imagen = imagen;
        this.foto = foto;
        this.descripcion = descripcion;
        this.precio = precio;
        this.stock = stock;
        this.categoria = categoria;
        this.disenador = disenador;
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public InputStream getFoto() {
        return foto;
    }

    public void setFoto(InputStream foto) {
        this.foto = foto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Disenador getMarca() {
        return disenador;
    }

    public void setMarca(Disenador disenador) {
        this.disenador = disenador;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

}
