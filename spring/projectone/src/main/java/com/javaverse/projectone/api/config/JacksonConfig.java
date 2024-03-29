package com.javaverse.projectone.api.config;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateDeserializer;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;

@Configuration
public class JacksonConfig {

  @Bean
  public Jackson2ObjectMapperBuilder jacksonBuilder() {
    var dateFormatter = DateTimeFormatter.ofPattern("d-M-yyyy");
    var dateTimeFormatter = DateTimeFormatter.ofPattern("d-M-yyyy HH:mm:ss");
    var module = new JavaTimeModule();
    module.addSerializer(
        OffsetDateTime.class,
        new JsonSerializer<>() {
          @Override
          public void serialize(
              OffsetDateTime offsetDateTime,
              JsonGenerator jsonGenerator,
              SerializerProvider serializerProvider)
              throws IOException {
            jsonGenerator.writeString(dateTimeFormatter.format(offsetDateTime));
          }
        });
    module.addSerializer(LocalDate.class, new LocalDateSerializer(dateFormatter));
    module.addDeserializer(LocalDate.class, new LocalDateDeserializer(dateFormatter));
    module.addSerializer(LocalDateTime.class, new LocalDateTimeSerializer(dateTimeFormatter));
    module.addDeserializer(LocalDateTime.class, new LocalDateTimeDeserializer(dateTimeFormatter));
    new Jackson2ObjectMapperBuilder();
    return Jackson2ObjectMapperBuilder.json()
        .modules(module)
        .propertyNamingStrategy(PropertyNamingStrategy.KEBAB_CASE)
        .serializationInclusion(JsonInclude.Include.NON_EMPTY)
        .featuresToEnable(SerializationFeature.INDENT_OUTPUT)
        .featuresToDisable(
            SerializationFeature.WRITE_DATES_AS_TIMESTAMPS,
            SerializationFeature.FAIL_ON_EMPTY_BEANS,
            //                        DeserializationFeature.ADJUST_DATES_TO_CONTEXT_TIME_ZONE,
            DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES,
            DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);
  }
}
