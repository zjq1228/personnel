package com.dj.personnel.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class LoginConfig implements WebMvcConfigurer {

   /* @Override
    public void addInterceptors(InterceptorRegistry registry) {
       //注册TestInterceptor拦截器
        InterceptorRegistration registration = registry.addInterceptor(new com.dj.personnel.config.MyInterceptor());
        //所有路径都被拦截
        registration.addPathPatterns("/**");
        //放过路径
        registration.excludePathPatterns("/toLogin");
    }*/
}
