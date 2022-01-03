package com.crud.service;

import com.crud.entity.Role;
import com.crud.entity.UserEntity;
import com.crud.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
// the all work is for authentication
@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserEntity user = userRepository.findUserEntityByName(username);
        User.UserBuilder builder = null;
        if(user != null){
            builder = User.withUsername(user.getName());
            builder.password(new BCryptPasswordEncoder().encode(user.getPassword()));
            String[] stringRolesArray =
                    user.getRoles().stream().map(r->r.getName()).toArray(String[]::new);
    // stream.map() will convert our Object to String name add to an array.
    // and then we can get our roles.
            builder.roles(stringRolesArray);
        }
        else {
            throw new UsernameNotFoundException("user not found");
        }
        return builder.build();
    }
}
