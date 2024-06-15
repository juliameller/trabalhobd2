package com.example.doceria.dtos;

public record ClienteReturnDto(
        Integer idCliente,
        String nome,
        String telefone,
        String cpf,
        String email
) { }
