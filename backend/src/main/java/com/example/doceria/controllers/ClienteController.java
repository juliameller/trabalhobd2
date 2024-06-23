package com.example.doceria.controllers;

import com.example.doceria.dtos.ClienteInsertDto;
import com.example.doceria.dtos.ClienteReturnDto;
import com.example.doceria.services.ClienteService;
import jakarta.annotation.Nullable;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("cliente")
public class ClienteController {
    @Autowired
    ClienteService clienteService;

    @GetMapping()
    public ResponseEntity<List<ClienteReturnDto>> getAll(
            @RequestParam("pagina") @Min(0) int pagina,
            @RequestParam("qtde") @Min(5) @Max(200) int qtde,
            @RequestParam("sort") @Nullable List<String> sort
    ){
        List<ClienteReturnDto> clientes = clienteService.getAll(pagina, qtde, sort);
        return ResponseEntity.status(200).body(clientes);
    }

    @GetMapping("{id-cliente}")
    public ResponseEntity<ClienteReturnDto> getOne(@PathVariable("id-cliente") Integer idCliente){
        ClienteReturnDto dto = clienteService.getOne(idCliente);
        return ResponseEntity.status(200).body(dto);
    }

    @PostMapping
    public ResponseEntity<ClienteReturnDto> post(@RequestBody @Valid ClienteInsertDto dto){
        ClienteReturnDto dtoResult = clienteService.post(dto);
        return ResponseEntity.status(201).body(dtoResult);
    }

    @PutMapping("{id-cliente}")
    public ResponseEntity<Object> putCarrp(
            @PathVariable("id-cliente") Integer idCliente,
            @RequestBody ClienteInsertDto dto)
    {
        ClienteReturnDto dtoResult = clienteService.put(idCliente, dto);
        return ResponseEntity.status(200).body(dtoResult);
    }

    @DeleteMapping("{id-cliente}")
    public ResponseEntity<Object> getCliente(@PathVariable("id-cliente") Integer idCliente){
        ClienteReturnDto dtoResult = clienteService.delete(idCliente);
        return ResponseEntity.status(200).body(dtoResult);
    }
}
