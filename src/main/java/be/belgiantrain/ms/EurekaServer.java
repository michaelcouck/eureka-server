package be.belgiantrain.ms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        class Tuple implements Comparable<Tuple> {
            Object one;
            Object two;
            Object three;
            public Tuple(final Object one, final Object two, final Object three) {
                this.one = one;
                this.two = two;
                this.three = three;
            }
            @Override
            public int compareTo(final Tuple that) {
                // TODO: Do your comparison here for the fields one, two and three
                return 0;
            }
        }
        Map<Tuple, Object> mapKeyedByCompositeTuple = new HashMap<>();
        // TODO: Inside your loop
        Tuple key = new Tuple("cell-one-value", "cell-two-value", "cell-three-value");
        mapKeyedByCompositeTuple.put(key, "cell-four-value");
    }

}