package com.rent.common.annotation;

import java.lang.annotation.*;

/**
 * @author lgl
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SystemLog {
    String description() default "";

    String modelName() default "";
}
