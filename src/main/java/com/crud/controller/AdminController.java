package com.crud.controller;

import com.crud.entity.Admin;
import com.crud.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/signup")
    public String getForm(@ModelAttribute Admin admin){
        return "admin/admin_form";
    }

    @PostMapping("/save")
    public String saveAdmin(@ModelAttribute Admin admin){
        adminService.save(admin);
        return "success";
    }

    @GetMapping("/")
    public String listAdmin(ModelMap modelMap){
        modelMap.addAttribute("listAdmin" , adminService.getAll());
        return "admin/admin_list";
    }

    @GetMapping("getAdmin/{id}")
    public String getAdmin(@PathVariable Long id , ModelMap modelMap){
        modelMap.addAttribute("admin" , adminService.getAdmin(id));
        return "admin/updateUser";
    }

    @PostMapping("/update")
    public String updateAdmin(@ModelAttribute Admin admin){
        adminService.update(admin);
        return "redirect:/admin/";
    }

}
