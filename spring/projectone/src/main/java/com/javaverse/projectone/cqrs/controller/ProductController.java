package com.javaverse.projectone.cqrs.controller;

import com.javaverse.projectone.cqrs.command.ProductCmd;
import com.javaverse.projectone.cqrs.dto.ProductDTO;
import com.javaverse.projectone.cqrs.query.ProductQuery;
import lombok.AllArgsConstructor;
import org.axonframework.commandhandling.gateway.CommandGateway;
import org.axonframework.messaging.responsetypes.ResponseTypes;
import org.axonframework.queryhandling.QueryGateway;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
public class ProductController {

    private final CommandGateway commandGateway;
    private final QueryGateway queryGateway;

    @PostMapping("/api/products")
    public String save(@RequestBody ProductDTO dto) {
        commandGateway.send(dto.toCommand());
        return "saved";
    }

    @DeleteMapping("/api/products/{id}")
    public String delete(@PathVariable Long id) {
        System.out.println("controller delete id :" + id);
        commandGateway.send(new ProductCmd.DeleteCmd(id));
        return "deleted";
    }

    @GetMapping("/api/products/{id}")
    public ResponseEntity get(@PathVariable Long id) {
        System.out.println(id);
        return ResponseEntity.ok(queryGateway.query(new ProductQuery.Single(id), ResponseTypes.instanceOf(ProductDTO.class)).join());
    }

    @GetMapping("/api/products")
    public ResponseEntity findAll() {
        return ResponseEntity.ok(queryGateway.query(new ProductQuery.AllActive(), ResponseTypes.multipleInstancesOf(ProductDTO.class)).join());
    }

}
