package com.hu.parking.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Component
public class Usercar implements Serializable {
    private String usercarid;

    private String orduserid;

    private String carnumber;

    private String cartype;

    private String carmodels;

    private String licensepic;
    
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date regtime;

    private String state;

    private static final long serialVersionUID = 1L;

    public String getUsercarid() {
        return usercarid;
    }

    public void setUsercarid(String usercarid) {
        this.usercarid = usercarid;
    }

    public String getOrduserid() {
        return orduserid;
    }

    public void setOrduserid(String orduserid) {
        this.orduserid = orduserid;
    }

    public String getCarnumber() {
        return carnumber;
    }

    public void setCarnumber(String carnumber) {
        this.carnumber = carnumber == null ? null : carnumber.trim();
    }

    public String getCartype() {
        return cartype;
    }

    public void setCartype(String cartype) {
        this.cartype = cartype == null ? null : cartype.trim();
    }

    public String getCarmodels() {
        return carmodels;
    }

    public void setCarmodels(String carmodels) {
        this.carmodels = carmodels == null ? null : carmodels.trim();
    }

    public String getLicensepic() {
        return licensepic;
    }

    public void setLicensepic(String licensepic) {
        this.licensepic = licensepic == null ? null : licensepic.trim();
    }

    public Date getRegtime() {
        return regtime;
    }

    public void setRegtime(Date regtime) {
        this.regtime = regtime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }
}