package com.javaverse.projectone.authentication.config;

import com.github.mongobee.Mongobee;
import com.mongodb.MongoClient;
import lombok.extern.log4j.Log4j2;
import org.springframework.boot.autoconfigure.mongo.MongoProperties;
import org.springframework.context.annotation.*;
import org.springframework.data.mongodb.core.MongoTemplate;


@Configuration
@Log4j2
public class MongobeeConfig {
    @Bean
    public Mongobee mongobee(MongoClient mongoClient, MongoTemplate mongoTemplate, MongoProperties mongoProperties) {
        log.debug("Configuring Mongobee");
        Mongobee mongobee = new Mongobee(mongoClient);
        mongobee.setDbName(mongoProperties.getMongoClientDatabase());
        mongobee.setMongoTemplate(mongoTemplate);
        // package to scan for migrations
        mongobee.setChangeLogsScanPackage(MongobeeConfig.class.getPackageName());
        mongobee.setEnabled(true);
        return mongobee;
    }
}
