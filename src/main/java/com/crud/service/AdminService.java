package com.crud.service;

import com.crud.entity.Admin;
import com.crud.repository.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class AdminService {

    @Autowired
    private AdminRepository adminRepository;

    public List<Admin> getAll(){
        return adminRepository.findAll();

    }

    public Admin getAdmin(Long id){
        return adminRepository.findById(id).get();
    }

    public Admin save(Admin admin){
        return adminRepository.save(admin);
    }

    public boolean update(Admin admin){
        Optional<Admin> oldAdmin = adminRepository.findById(admin.getId());
        if(oldAdmin.isPresent()){
        admin.setName(admin.getName());
        admin.setEmail(admin.getEmail());
        admin.setStatus(admin.isStatus());
        adminRepository.save(admin);
        return true;
        }
        return false;
    }

    public void delete(Long id){
        adminRepository.deleteById(id);
    }
}
