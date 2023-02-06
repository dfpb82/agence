package com.agence.test.Modelo;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;



@Entity
public class cao_usuario {
    @Id
    private String no_usuario;

    public String getNo_usuario() {
        return no_usuario;
    }

    public void setNo_usuario(String no_usuario) {
        this.no_usuario = no_usuario;
    }
    
}
