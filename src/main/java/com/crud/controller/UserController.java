package com.crud.controller;


import com.crud.entity.UserEntity;
import com.crud.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/form")
    public String addUser(ModelMap map){
            UserEntity user = new UserEntity();
            map.addAttribute("user" , user);
            return "user/users";
    }

    @PostMapping("/save")
    public String saveUser( UserEntity userEntity){
        userService.addUser(userEntity);
        return "redirect:/";
    }

    @GetMapping("/")
    public String listUsers(ModelMap modelMap){
        List<UserEntity> userList = userService.getAllUsers();
        modelMap.addAttribute("listUsers" , userList);
        return "user/userList";
    }

    @GetMapping("/deleteUser/{id}")
    public String  deleteUser(@PathVariable Long id){
        userService.deleteUser(id);
        return "redirect:/";
    }

    @RequestMapping(value = "/getUser/{id}" , method = {RequestMethod.GET})
    public String getUserById(ModelMap map , @PathVariable Long id){
        UserEntity user = userService.getUserById(id);
        map.addAttribute("user" , user);
        return "/user/editUser";
    }

    @PostMapping("/updateUser")
    public String updateUser(@ModelAttribute UserEntity user){
        userService.updateUser(user);
        return "redirect:/";
    }

}