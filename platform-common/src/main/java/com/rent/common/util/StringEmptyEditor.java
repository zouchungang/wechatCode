package com.rent.common.util;

import java.beans.PropertyEditorSupport;

/**
 * 将空串转换成null
 *
 * @author liu_gl
 */
public class StringEmptyEditor extends PropertyEditorSupport {
    @Override
    public void setAsText(String text) {
        if (text == null || "".equals(text)) {
            setValue(null);
        } else {
            setValue(text);
        }
    }

    @Override
    public String getAsText() {
        Object value = getValue();
        return (value != null ? value.toString() : "");
    }

}
