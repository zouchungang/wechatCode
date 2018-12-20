package com.rent.common.myenum;

/**
 * 订单状态枚举类
 */
public enum OrderState {
    WaitPay(1), //待付款
    Payed(2),    //已付款
    DrawerTicket(3), //已出票
    Finish(4),   //交易完成
    Settlement(5),   //已结算
    ApplyReturn(6),   //退订申请
    AuditReturn(7),   //退订审核
    ReturnFinish(8);   //已退订

    private int value;

    OrderState(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }

    public static String valueOf(int value) {
        switch (value) {
            case 1:
                return "待付款";
            case 2:
                return "已付款";
            case 3:
                return "已出票";
            case 4:
                return "交易完成";
            case 5:
                return "已结算";
            case 6:
                return "退订申请";
            case 7:
                return "退订审核";
            case 8:
                return "已退订";
            default:
                return "";
        }
    }
}
