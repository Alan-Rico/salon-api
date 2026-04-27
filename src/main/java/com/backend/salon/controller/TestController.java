package com.backend.salon.controller;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

/// ESTA CLASE LO QUE HACE ES HACER LOS ENDPOINT PARA LA DOCUMENTACIÓN
@RestController
class TestController {
    @PostMapping(value = "/upload", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String subirArchivo(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return "No seleccionaste ningún archivo para subir a la documentación.";
        }

        try {
            Path root = Paths.get("uploads");
            if (!Files.exists(root)) {
                Files.createDirectory(root);
            }

            Files.copy(file.getInputStream(), root.resolve(file.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);

            return "Archivo guardado correctamente en la carpeta del equipo: " + file.getOriginalFilename();
        } catch (IOException e) {
            return "Error al guardar el archivo de documentación: " + e.getMessage();
        }
    }

    void main() {
    }


}
// sync