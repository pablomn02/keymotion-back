package org.example.keymotionback.model.enums;

public enum TipoUsuario {
        COMPRADOR,
        VENDEDOR,
        ADMIN;

        public static TipoUsuario fromString(String value) {
                for (TipoUsuario tipo : TipoUsuario.values()) {
                        if (tipo.name().equalsIgnoreCase(value)) {
                                return tipo;
                        }
                }
                throw new IllegalArgumentException("Unknown enum value: " + value);
        }
}
