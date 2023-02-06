package com.agence.test.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.agence.test.Modelo.cao_usuario;

import java.util.List;

public interface cao_usuarioDAO extends JpaRepository<cao_usuario, String>{

    @Query(value=" call Get_Consultores", nativeQuery=true)
    List<cao_usuario> listaProcedure();
}
