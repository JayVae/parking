package com.hu.parking.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Component
public class Ppftbuserecord implements Serializable {
    private String ppftbuserecordid;

    private String parkingplaceftbid;
    
    @JsonFormat(pattern="HH",timezone = "GMT+8")
    private Date ppftbtime;

    private String isused;

    private static final long serialVersionUID = 1L;

    public String getPpftbuserecordid() {
        return ppftbuserecordid;
    }

    public void setPpftbuserecordid(String ppftbuserecordid) {
        this.ppftbuserecordid = ppftbuserecordid;
    }

    public String getParkingplaceftbid() {
        return parkingplaceftbid;
    }

    public void setParkingplaceftbid(String parkingplaceftbid) {
        this.parkingplaceftbid = parkingplaceftbid;
    }

    public Date getPpftbtime() {
        return ppftbtime;
    }

    public void setPpftbtime(Date ppftbtime) {
        this.ppftbtime = ppftbtime;
    }

    public String getIsused() {
        return isused;
    }

    public void setIsused(String isused) {
        this.isused = isused == null ? null : isused.trim();
    }
}