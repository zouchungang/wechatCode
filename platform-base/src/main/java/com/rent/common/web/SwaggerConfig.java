package com.rent.common.web;

import com.google.common.base.Predicate;
import org.springframework.context.annotation.Bean;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

import java.util.ArrayList;

import static com.google.common.base.Predicates.or;
import static springfox.documentation.builders.PathSelectors.regex;

//@Configuration
//@EnableWebMvc
//@EnableSwagger2
public class SwaggerConfig {
    @Bean
    public Docket swaggerSpringMvcPlugin() {
        return new Docket(DocumentationType.SWAGGER_2)
                .select()
                .paths(paths()) // and by paths
                .build()
                .apiInfo(apiInfo());
    }

    /**
     * 设置文档说明的基础信息
     *
     * @return
     */
    private ApiInfo apiInfo() {
        Contact contact = new Contact("", "", "");
        ApiInfo apiInfo = new ApiInfo(
                "租房网(API)",//大标题
                "文档说明：此文档是提供给租房网开发人员使用" +
                        "<br>主要功能：" +
                        "<br>&nbsp;&nbsp;1.接口说明。" +
                        "<br>&nbsp;&nbsp;2.接口在线测试。",//文档说明
                "1.0 version",//版本
                "",
                contact,
                "",
                "", new ArrayList());
        return apiInfo;
    }

    /**
     * 使用正则表达式过滤路径
     *
     * @return
     */
    private Predicate<String> paths() {
        return or(
//                regex("/demo.*"),
//                regex("/some.*"),
//                regex("/contacts.*"),
//                regex("/pet.*"),
//                regex("/platform.*"),
                regex("/api.*"));
    }
}