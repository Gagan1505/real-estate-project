package com.xworkz.real_estate_app.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.xworkz.real_estate_app")
@PropertySource("classpath:connection.properties")
public class SpringConfiguration {
    @Autowired
    Environment env;


    @Bean
    public javax.validation.Validator localValidatorFactoryBean(){
        LocalValidatorFactoryBean validatorFactoryBean = new LocalValidatorFactoryBean();
        validatorFactoryBean.setProviderClass(org.hibernate.validator.HibernateValidator.class);
        return validatorFactoryBean;
    }

    @Bean
    public DataSource getDatasource(){
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(env.getProperty("jdbc.driverClassName"));
        dataSource.setUsername(env.getProperty("jdbc.username"));
        dataSource.setPassword(env.getProperty("jdbc.password"));
        dataSource.setUrl(env.getProperty("jdbc.url"));
        return dataSource;
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean getFactoryBean(){
        LocalContainerEntityManagerFactoryBean factoryBean = new LocalContainerEntityManagerFactoryBean();
        factoryBean.setDataSource(getDatasource());

        factoryBean.setPackagesToScan(new String[]{"com.xworkz.real_estate_app.dto"});

        HibernateJpaVendorAdapter hibernateJpaVendorAdapter = new HibernateJpaVendorAdapter();
        factoryBean.setJpaVendorAdapter(hibernateJpaVendorAdapter);
        factoryBean.setJpaProperties(getHibernateProperties());

        return factoryBean;
    }

    private Properties getHibernateProperties() {
        Properties properties = new Properties();
        properties.setProperty("hibernate.dialect",env.getProperty("hibernate.dialect"));
        properties.setProperty("hibernate.show_sql",env.getProperty("hibernate.show_sql"));
        properties.setProperty("hibernate.hbm2ddl.auto",env.getProperty("hibernate.hbm2ddl.auto"));

        return properties;
    }


    @Bean
    public ViewResolver viewResolver(){
        ViewResolver resolver = new InternalResourceViewResolver("/",".jsp");
        return resolver;
    }
}
