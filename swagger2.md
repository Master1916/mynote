# SPRINGBOOT 添加swagger2
## 引入包
<!--swagger2 -->
      <dependency>
          <groupId>io.springfox</groupId>
          <artifactId>springfox-swagger2</artifactId>
          <version>2.8.0</version>
      </dependency>
      <dependency>
          <groupId>io.springfox</groupId>
          <artifactId>springfox-swagger-ui</artifactId>
          <version>2.8.0</version>
      </dependency>
      <dependency>
          <groupId>javax.xml.bind</groupId>
          <artifactId>jaxb-api</artifactId>
          <version>2.3.0</version>
      </dependency>
<!--swagger2 -->
## 添加文件

```
@Configuration
@EnableSwagger2
public class Swagger2 {
    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.btse.merchant.controller.merchant"))
                .paths(PathSelectors.any())
                .build()
                .apiInfo(apiInfo());
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("Marketplace API")
                .description("Marketplace API Description")
                .termsOfServiceUrl("API terms of service")
                .version("1.0.0")
                .build();
    }
}
```
