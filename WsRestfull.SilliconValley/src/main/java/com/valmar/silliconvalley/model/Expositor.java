package com.valmar.silliconvalley.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

@Entity
@Table(name="EXPOSITOR")
public class Expositor {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Size(min = 3, max = 100)
	@Column(name = "NOMBRE_EMPRESA", nullable = false)
	private String nombreEmpresa;
	
	@Size(min = 3, max = 200)
	@Column(name = "TEMA", nullable = false)
	private String tema;
	
	@Column(name = "FECHA_EXPOSICION", nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date fechaExposicion;
	
	@Size(min = 3, max = 1000)
	@Column(name = "BIOGRAFIA_DETALLE", nullable = false)
	private String biografiaDetalle;
	
	@Column(name = "IMAGEN", nullable = false)
	private byte[] imagen;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombreEmpresa() {
		return nombreEmpresa;
	}

	public void setNombreEmpresa(String nombreEmpresa) {
		this.nombreEmpresa = nombreEmpresa;
	}

	public String getTema() {
		return tema;
	}

	public void setTema(String tema) {
		this.tema = tema;
	}

	public Date getFechaExposicion() {
		return fechaExposicion;
	}

	public void setFechaExposicion(Date fechaExposicion) {
		this.fechaExposicion = fechaExposicion;
	}

	public String getBiografiaDetalle() {
		return biografiaDetalle;
	}

	public void setBiografiaDetalle(String biografiaDetalle) {
		this.biografiaDetalle = biografiaDetalle;
	}

	public byte[] getImagen() {
		return imagen;
	}

	public void setImagen(byte[] imagen) {
		this.imagen = imagen;
	}
	
	
}
