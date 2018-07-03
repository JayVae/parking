package com.hu.parking.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Component
public class Parkingplacefreetime implements Serializable {
    private String parkingplacefreetimeid;

    private String parkingplaceid;

    private String orduserid;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date freetimebucketbegin;
    
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date freetimebucketend;

    private String ruletype;

    private Double unitprice;

    private Float unittimelong;

    private Double startprice;

    private Float starttimelong;

    private Double punishunitprice;

    private Float punishunittimelong;

    private String punishtype;

    private String usestate;

    private String isappointment;

    private String isvalid;
    
    //自定义
    private String parkingplaceno;
    
    private String parkinglotname;
    
    private BigDecimal longitude;

    private BigDecimal latitude;

    private static final long serialVersionUID = 1L;

    public String getParkingplacefreetimeid() {
        return parkingplacefreetimeid;
    }

    public void setParkingplacefreetimeid(String parkingplacefreetimeid) {
        this.parkingplacefreetimeid = parkingplacefreetimeid;
    }

    public String getParkingplaceid() {
        return parkingplaceid;
    }

    public void setParkingplaceid(String parkingplaceid) {
        this.parkingplaceid = parkingplaceid;
    }

    public String getOrduserid() {
        return orduserid;
    }

    public void setOrduserid(String orduserid) {
        this.orduserid = orduserid;
    }

    public Date getFreetimebucketbegin() {
        return freetimebucketbegin;
    }

    public void setFreetimebucketbegin(Date freetimebucketbegin) {
        this.freetimebucketbegin = freetimebucketbegin;
    }

    public Date getFreetimebucketend() {
        return freetimebucketend;
    }

    public void setFreetimebucketend(Date freetimebucketend) {
        this.freetimebucketend = freetimebucketend;
    }

    public String getRuletype() {
        return ruletype;
    }

    public void setRuletype(String ruletype) {
        this.ruletype = ruletype == null ? null : ruletype.trim();
    }

    public Double getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(Double unitprice) {
        this.unitprice = unitprice;
    }

    public Float getUnittimelong() {
        return unittimelong;
    }

    public void setUnittimelong(Float unittimelong) {
        this.unittimelong = unittimelong;
    }

    public Double getStartprice() {
        return startprice;
    }

    public void setStartprice(Double startprice) {
        this.startprice = startprice;
    }

    public Float getStarttimelong() {
        return starttimelong;
    }

    public void setStarttimelong(Float starttimelong) {
        this.starttimelong = starttimelong;
    }

    public Double getPunishunitprice() {
        return punishunitprice;
    }

    public void setPunishunitprice(Double punishunitprice) {
        this.punishunitprice = punishunitprice;
    }

    public Float getPunishunittimelong() {
        return punishunittimelong;
    }

    public void setPunishunittimelong(Float punishunittimelong) {
        this.punishunittimelong = punishunittimelong;
    }

    public String getPunishtype() {
        return punishtype;
    }

    public void setPunishtype(String punishtype) {
        this.punishtype = punishtype == null ? null : punishtype.trim();
    }

    public String getUsestate() {
        return usestate;
    }

    public void setUsestate(String usestate) {
        this.usestate = usestate == null ? null : usestate.trim();
    }

    public String getIsappointment() {
        return isappointment;
    }

    public void setIsappointment(String isappointment) {
        this.isappointment = isappointment == null ? null : isappointment.trim();
    }

    public String getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(String isvalid) {
        this.isvalid = isvalid == null ? null : isvalid.trim();
    }

	public String getParkingplaceno() {
		return parkingplaceno;
	}

	public void setParkingplaceno(String parkingplaceno) {
		this.parkingplaceno = parkingplaceno;
	}

	public String getParkinglotname() {
		return parkinglotname;
	}

	public void setParkinglotname(String parkinglotname) {
		this.parkinglotname = parkinglotname;
	}

	public BigDecimal getLongitude() {
		return longitude;
	}

	public void setLongitude(BigDecimal longitude) {
		this.longitude = longitude;
	}

	public BigDecimal getLatitude() {
		return latitude;
	}

	public void setLatitude(BigDecimal latitude) {
		this.latitude = latitude;
	}
    
    
}