package org.example.keymotionback;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
public class KeymotionBackApplication {
	public static void main(String[] args) {
		SpringApplication.run(KeymotionBackApplication.class, args);
	}
}
