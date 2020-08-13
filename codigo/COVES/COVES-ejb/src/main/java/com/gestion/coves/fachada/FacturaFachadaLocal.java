/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gestion.coves.fachada;

import com.gestion.coves.dominio.entities.Factura;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Alexander Chiran
 */
@Local
public interface FacturaFachadaLocal {
    
    public List<Factura> findAll();
    
    public void edit(Factura selected);

    public void remove(Factura selected);
    
    public Factura find(Integer id);

    public int calcularNumeroFactura();

    public void crear(Factura selected);
}
