package be.belgiantrain.ms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * This class is the entry point for the service registry. The registry is a dynamic index of services that are maintained
 * and queried by the gateway load balancer.
 *
 * @author MCOUCK
 * @version 1.00
 * @since 21-05-2019
 */
@Configuration
@EnableEurekaServer
@EnableDiscoveryClient
@SpringBootApplication
@ComponentScan({"be.belgiantrain"})
public class EurekaServer {

    public static void main(final String[] args) {
        SpringApplication.run(EurekaServer.class, args);
    }

}