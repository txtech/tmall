package tmall.controller;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @author bernie
 * @date 2021/6/8
 */
@EnableWebMvc
@EnableSwagger2
@Configuration
public class SwaggerConfig {
    @Bean
    public Docket createRestApi() {

        return new Docket(DocumentationType.SWAGGER_2)
            .apiInfo(apiInfo())
            .groupName("parana")
            .select()
            .apis(RequestHandlerSelectors.basePackage("tmall.controller.pay"))
            .paths(PathSelectors.any())
            .build();
    }

    @Bean
    public Docket createTestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
            .apiInfo(apiInfo())
            .groupName("test")
            .select()
            .apis(RequestHandlerSelectors.basePackage("tmall.controller.test"))
            .paths(PathSelectors.any())
            .build();

    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
            .title("接口列表 v1.1.0") // 任意，请稍微规范点
            .description("接口测试") // 任意，请稍微规范点
            .termsOfServiceUrl("http://url/swagger-ui.html")
            // 将“url”换成自己的ip:port
            .contact("laowu") // 无所谓（这里是作者的别称）
            .version("1.1.0")
            .build();
    }


    //@Bean
    //public Docket createFrontRestApi() {
    //    return new Docket(DocumentationType.SWAGGER_2)
    //        .apiInfo(apiInfo())
    //        .groupName("geega")
    //        .select()
    //        //.apis(RequestHandlerSelectors.basePackage("tmall.controller.front"))
    //        // 注意修改此处的包名
    //        .paths(PathSelectors.any())
    //        .build();
    //}



    //private ApiInfo frontApiInfo() {
    //    return new ApiInfoBuilder()
    //        .title("前端接口列表 v1.1.0") // 任意，请稍微规范点
    //        .description("前端接口测试") // 任意，请稍微规范点
    //        .termsOfServiceUrl("http://url/swagger-ui.html")
    //        // 将“url”换成自己的ip:port
    //        .contact("laowu") // 无所谓（这里是作者的别称）
    //        .version("1.1.0")
    //        .build();
    //}
}
