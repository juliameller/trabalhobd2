package com.example.doceria.mappers;

import com.example.doceria.dtos.ClienteInsertDto;
import com.example.doceria.dtos.ClienteReturnDto;
import com.example.doceria.models.Cliente;

public class ClienteMapper {
    public static Cliente insertToEntity(ClienteInsertDto dto){
        return new Cliente(
                null,
                dto.nome(),
                dto.telefone(),
                dto.cpf(),
                dto.email()
        );
    }

    public static Cliente returnToEntity(ClienteReturnDto dto){
        return new Cliente(
                dto.idCliente(),
                dto.nome(),
                dto.telefone(),
                dto.cpf(),
                dto.email()
        );
    }

    public static ClienteInsertDto entityToInsert(Cliente cliente){
        return new ClienteInsertDto(
                cliente.getNome(),
                cliente.getTelefone(),
                cliente.getCpf(),
                cliente.getEmail()
        );
    }

    public static ClienteReturnDto entityToReturn(Cliente cliente){
        return new ClienteReturnDto(
                cliente.getIdCliente(),
                cliente.getNome(),
                cliente.getTelefone(),
                cliente.getCpf(),
                cliente.getEmail()
        );
    }

    public static void updateEntity(Cliente clienteAtual, ClienteInsertDto dto){
        clienteAtual.setNome(dto.nome());
        clienteAtual.setTelefone(dto.telefone());
        clienteAtual.setCpf(dto.cpf());
        clienteAtual.setEmail(dto.email());
    }
}
