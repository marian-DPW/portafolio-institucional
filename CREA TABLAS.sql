USE ACTIVIDAD01 ;
-- Creamos la tabla de usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre_usuario VARCHAR(50) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL,
    contrasena_hash VARCHAR(255) NOT NULL,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN NOT NULL DEFAULT TRUE,

    -- Restricciones a nivel de tabla
    PRIMARY KEY (id),
    UNIQUE INDEX idx_uq_nombre_usuario (nombre_usuario ASC),
    UNIQUE INDEX idx_uq_correo_electronico (correo_electronico ASC)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Creamos la tabla de perfiles de usuario
CREATE TABLE IF NOT EXISTS perfiles_usuario (
    id_usuario INT UNSIGNED NOT NULL COMMENT 'Referencia al usuario (Clave Foránea y Primaria)',
    nombre_completo VARCHAR(100) NULL COMMENT 'Nombre real del usuario',
    biografia TEXT NULL COMMENT 'Descripción breve del usuario',
    fecha_nacimiento DATE NULL COMMENT 'Fecha de nacimiento del usuario',
    telefono VARCHAR(20) NULL COMMENT 'Número de teléfono',
    ultima_actualizacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de la última modificación del perfil',

    -- Restricciones a nivel de tabla
    PRIMARY KEY (id_usuario), -- El ID del usuario es también la PK aquí (relación 1 a 1)
    CONSTRAINT fk_perfil_usuario -- Nombre explícito para la restricción de clave foránea
        FOREIGN KEY (id_usuario) REFERENCES usuarios (id)
        ON DELETE CASCADE -- Si se borra el usuario, se borra su perfil
        ON UPDATE CASCADE -- Si cambia el ID del usuario (poco común), se actualiza aquí

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tabla con información adicional del perfil de los usuarios';