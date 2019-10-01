package com.javaverse.projectone.api.entity.converter;

import com.javaverse.projectone.api.entity.Common;
import com.javaverse.projectone.api.entity.Product;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;
import java.util.Objects;

@Converter(autoApply = true)
public class StatusAttributeConverter implements AttributeConverter<Common.Status, String> {

  @Override
  public String convertToDatabaseColumn(Product.Status status) {
    return Objects.isNull(status) ? null : status.getCode();
  }

  @Override
  public Product.Status convertToEntityAttribute(String code) {
    return Objects.isNull(code) ? null : Common.Status.toStatus(code);
  }
}
