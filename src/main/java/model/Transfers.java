package model;

import java.sql.Date;

public class Transfers {
    int id;
    Double money;
    Double fee;
    int depoId;
    int withId;
    Date fullday;

    public Transfers() {
    }

    public Transfers(int id, Double money, Double fee, int depoId, int withId, Date fullday) {
        this.id = id;
        this.money = money;
        this.fee = fee;
        this.depoId = depoId;
        this.withId = withId;
        this.fullday = fullday;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Double getFee() {
        return fee;
    }

    public void setFee(Double fee) {
        this.fee = fee;
    }

    public int getDepoId() {
        return depoId;
    }

    public void setDepoId(int depoId) {
        this.depoId = depoId;
    }

    public int getWithId() {
        return withId;
    }

    public void setWithId(int withId) {
        this.withId = withId;
    }

    public Date getFullday() {
        return fullday;
    }

    public void setFullday(Date fullday) {
        this.fullday = fullday;
    }
}