package org.example.keymotionback.controller;

import org.example.keymotionback.model.Usuario;
import org.example.keymotionback.repository.UsuarioRepository;
import org.example.keymotionback.service.UsuarioService;
import org.example.keymotionback.service.VehiculoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/usuarios")
public class UsuarioController {
    @Autowired
    private UsuarioService usuarioService;

    @GetMapping
    public List<Usuario> getUsuarios(){
        return usuarioService.getUsuarios();
    }
}
