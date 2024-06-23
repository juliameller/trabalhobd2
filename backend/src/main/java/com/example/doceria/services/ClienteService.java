package com.example.doceria.services;

import com.example.doceria.dtos.ClienteInsertDto;
import com.example.doceria.dtos.ClienteReturnDto;
import com.example.doceria.mappers.ClienteMapper;
import com.example.doceria.models.Cliente;
import com.example.doceria.repositories.ClienteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClienteService {
    @Autowired
    ClienteRepository clienteRepository;

    public List<ClienteReturnDto> getAll(Integer pagina, Integer qtde, List<String> sortBy){
        Pageable pageConfig;
        if(sortBy != null){
            List<Sort.Order> orderByList = sortBy.stream().map((nomeAtributo) -> {
                return new Sort.Order(Sort.Direction.ASC, nomeAtributo);
            }).toList();
            pageConfig = PageRequest.of(pagina, qtde, Sort.by(orderByList));
        } else {
            pageConfig = PageRequest.of(pagina, qtde);
        }

        Page<Cliente> listaAnimais = clienteRepository.findAll(pageConfig);
        return listaAnimais.stream().map(ClienteMapper::entityToReturn).toList();
    }

    public ClienteReturnDto getOne(Integer id){
        Cliente cliente = clienteRepository.findById(id).get();
        return ClienteMapper.entityToReturn(cliente);
    }

    public ClienteReturnDto post(ClienteInsertDto dto){
        Cliente cliente = ClienteMapper.insertToEntity(dto);
        Cliente clienteSalvo = clienteRepository.save(cliente);
        return ClienteMapper.entityToReturn(clienteSalvo);
    }

    public ClienteReturnDto put(Integer id, ClienteInsertDto dto){
        Cliente cliente = clienteRepository.findById(id).get();
        ClienteMapper.updateEntity(cliente, dto);
        Cliente clienteUpdate = clienteRepository.save(cliente);
        return ClienteMapper.entityToReturn(clienteUpdate);
    }

    public ClienteReturnDto delete(Integer id){
        Cliente cliente = clienteRepository.findById(id).get();
        clienteRepository.delete(cliente);
        return ClienteMapper.entityToReturn(cliente);
    }
}