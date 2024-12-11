package org.example.keymotionback.service.impl;

import org.example.keymotionback.model.Vehiculo;
import org.example.keymotionback.repository.VehiculoRepository;
import org.example.keymotionback.service.VehiculoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VehiculoServiceImpl implements VehiculoService {

    @Autowired
    private VehiculoRepository vehiculoRepository;

    @Override
    public List<Vehiculo> getVehiculos() {
        return vehiculoRepository.findAll();
    }
}
