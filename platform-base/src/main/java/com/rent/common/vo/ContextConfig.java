package com.rent.common.vo;

/**
 * 存储全局上下文
 * Created by liu_gl on 2016/5/9.
 */
public class ContextConfig {
    private String ctx;//系统上下文
    private String webCtx;//前台系统变量
    private String staticCtx;//静态资源
    private String staticCdnCtx;//cdn静态资源
    private String staticUpfileCtx;//集群的时候解决文件上传共享问题

    public String getWebCtx() {
        return webCtx;
    }

    public void setWebCtx(String webCtx) {
        this.webCtx = webCtx;
    }

    public String getCtx() {
        return ctx;
    }

    public void setCtx(String ctx) {
        this.ctx = ctx;
    }

    public String getStaticCtx() {
        return staticCtx;
    }

    public void setStaticCtx(String staticCtx) {
        this.staticCtx = staticCtx;
    }

    public String getStaticCdnCtx() {
        return staticCdnCtx;
    }

    public void setStaticCdnCtx(String staticCdnCtx) {
        this.staticCdnCtx = staticCdnCtx;
    }

    public String getStaticUpfileCtx() {
        return staticUpfileCtx;
    }

    public void setStaticUpfileCtx(String staticUpfileCtx) {
        this.staticUpfileCtx = staticUpfileCtx;
    }
}
