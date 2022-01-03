package com.crud.service;

import com.crud.entity.Role;
import com.crud.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleService {

    @Autowired
    private RoleRepository roleRepository;

    public Role getRole(Long id){
        return roleRepository.getById(id);
    }


}
