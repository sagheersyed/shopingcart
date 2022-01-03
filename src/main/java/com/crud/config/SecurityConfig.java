package com.crud.config;
        import com.crud.entity.Role;
        import com.crud.entity.UserEntity;
        import com.crud.repository.RoleRepository;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.context.annotation.Bean;
        import org.springframework.context.annotation.Configuration;
        import org.springframework.security.authentication.AuthenticationManager;
        import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
        import org.springframework.security.config.annotation.web.builders.HttpSecurity;
        import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
        import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
        import org.springframework.security.core.userdetails.UserDetailsService;
        import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
        import org.springframework.security.crypto.password.NoOpPasswordEncoder;
        import org.springframework.security.crypto.password.PasswordEncoder;

        import java.util.List;
// this section is for authorization.
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeRequests().antMatchers("/admin/**").hasRole("admin")
                .antMatchers("/cart/**").hasRole("user")
                .antMatchers(("/favorite/**")).hasRole("user")
                .antMatchers("/product/**").permitAll()
                .and() // when the user role is admin then this link will be open.
                .formLogin().successHandler(successHandler())

                /*.and()
                .logout().permitAll().logoutSuccessUrl("/login")*/;

    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    };

    @Bean
    public AuthSuccessHandler successHandler() {
        return new AuthSuccessHandler();
    }

}

