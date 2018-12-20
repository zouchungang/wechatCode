package com.rent.common.validation;

import java.util.Map;

public class ValidationResult {
    //校验结果是否有错
    private boolean hasErrors;

    //校验错误信息
    private Map<String, String> errorMsg;

    public boolean isHasErrors() {
        return hasErrors;
    }

    public void setHasErrors(boolean hasErrors) {
        this.hasErrors = hasErrors;
    }

    public Map<String, String> getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(Map<String, String> errorMsg) {
        this.errorMsg = errorMsg;
    }

    @Override
    public String toString() {
        String returnStr = "";
        for (String v : errorMsg.values()) {
            returnStr = returnStr + v + "<br>";
        }
        return returnStr;
    }
}
