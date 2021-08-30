
package com.mounut.modelo;

public class Cliente {
    int id;
    String celular;
    String nombres;
    String email;
    String pass;
    String direccion;

    public Cliente() {
    }

    public Cliente(int id, String celular, String Nombres, String email, String pass, String direccion) {
        this.id = id;
        this.celular = celular;
        this.nombres = Nombres;
        this.email = email;
        this.pass = pass;
        this.direccion = direccion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String Nombres) {
        this.nombres = Nombres;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }




}
