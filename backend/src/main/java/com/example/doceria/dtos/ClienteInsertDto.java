package com.example.doceria.dtos;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;

public record ClienteInsertDto(
        @NotBlank String nome,
        @NotBlank String telefone,
        @NotBlank String cpf,
        @NotBlank String email
) { }
