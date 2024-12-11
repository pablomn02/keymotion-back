package org.example.keymotionback.service.impl;

import org.example.keymotionback.model.Usuario;
import org.example.keymotionback.model.Vehiculo;
import org.example.keymotionback.repository.UsuarioRepository;
import org.example.keymotionback.repository.VehiculoRepository;
import org.example.keymotionback.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Service
public class UsuarioServiceImpl implements UsuarioService {
    @Autowired
    private UsuarioRepository usuarioRepository;

    @Override
    public List<Usuario> getUsuarios() {
        return usuarioRepository.findAll();
    }
}
