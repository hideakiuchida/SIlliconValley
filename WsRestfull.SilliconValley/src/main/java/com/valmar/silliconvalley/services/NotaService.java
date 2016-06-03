package com.valmar.silliconvalley.services;

import java.util.List;

import com.valmar.silliconvalley.model.Nota;

public interface NotaService {	
	List<Nota> obtenerPorExpositor(int id);
	Nota obtenerPorId(int id);	 
    void agregar(Nota nota);     
    void eliminar(int id);    
    List<Nota> listarNotas();
    List<Nota> obtenerReporte(Integer[] tiposId, Integer[] categId, Integer usuarioId, Integer expositorId);
}
