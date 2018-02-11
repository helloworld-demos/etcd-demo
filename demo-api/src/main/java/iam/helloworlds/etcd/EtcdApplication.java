package iam.helloworlds.etcd;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.util.UUID;

@SpringBootApplication
public class EtcdApplication {
    public static Logger LOGGER = LoggerFactory.getLogger(EtcdApplication.class.getName());

    public static void main(String[] args) {
        SpringApplication.run(EtcdApplication.class, args);
    }

    @Bean
    public String assignedUuid() {
        String uuid = UUID.randomUUID().toString();

        LOGGER.info("UUID is assigned as {} for this service.", uuid);

        return uuid;
    }
}
