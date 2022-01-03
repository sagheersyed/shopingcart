package com.crud.service;

import com.crud.entity.Category;
import com.crud.entity.Product;
import com.crud.entity.Role;
import com.crud.entity.UserEntity;
import com.crud.repository.RoleRepository;
import com.crud.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


@Service("UserService")
public class UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private CategoryService categoryService;

    public UserEntity addUser(UserEntity userEntity){
        List<Role> roles = new ArrayList<>();
        roles.add(roleRepository.getById(2l));
        userEntity.setRoles(roles);
        UserEntity user = userRepository.save(userEntity);
        return user;
    }

    public List<UserEntity> getAllUsers(){
        return userRepository.findAll();
    }

    public UserEntity getUserById(long id){
        UserEntity user = userRepository.findById(id).get();
        List<Category> list = categoryService.categoryList();
        list.stream().map(product -> product.getCategoryName()).forEach(System.out::println);
        return user;
    }

    public void deleteUser(Long id){
        userRepository.deleteById(id);
    }

    public  boolean updateUser(UserEntity userEntity){
        Optional<UserEntity> oldUser = userRepository.findById(userEntity.getId());
        if(oldUser.isPresent()){
            UserEntity user = oldUser.get();
            user.setEmail(userEntity.getEmail());
            user.setName(userEntity.getName());
            userRepository.save(user);
            return true;
        }
        return false;
    }

}
