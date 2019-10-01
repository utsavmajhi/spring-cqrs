package com.javaverse.projectone.api.config;

import org.jasypt.commons.CommonUtils;
import org.jasypt.encryption.StringEncryptor;
import org.jasypt.encryption.pbe.PooledPBEStringEncryptor;
import org.jasypt.encryption.pbe.config.SimpleStringPBEConfig;
import org.jasypt.salt.RandomSaltGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class JasyptConfig {

    @Bean
    public StringEncryptor commonEncryptor() {
        var encryptor = new PooledPBEStringEncryptor();
        var config = new SimpleStringPBEConfig();
        config.setPassword("J@vav3rs3");
        config.setAlgorithm("PBEWITHHMACSHA256ANDAES_256");
        config.setKeyObtentionIterations("1000");
        config.setPoolSize("2");
        config.setProviderName("SunJCE");
        config.setSaltGeneratorClassName(RandomSaltGenerator.class.getName());
        config.setStringOutputType(CommonUtils.STRING_OUTPUT_TYPE_BASE64);
        encryptor.setConfig(config);
        return encryptor;
    }

    //    public static void main(String[] args) {
    //        JasyptConfig config  = new JasyptConfig();
    //        String enc = config.commonEncryptor().encrypt("120000");
    //        System.out.println(enc);
    //        System.out.println(config.commonEncryptor().decrypt(enc));
    //    }

}
