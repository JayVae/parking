package com.hu.parking.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Component
public class Parkingplaceftb implements Serializable {
    private String parkingplaceftbid;

    private String parkingplacefreetimeid;

    @JsonFormat(pattern="HH:mm:ss",timezone = "GMT+8")
    private Date freetimebucketbegin;

    @JsonFormat(pattern="HH:mm:ss",timezone = "GMT+8")
    private Date freetimebucketend;

    private Double price;
    
    private List<Ppftbuserecord> ppftbuserecordList;

    private static final long serialVersionUID = 1L;

    public String getParkingplaceftbid() {
        return parkingplaceftbid;
    }

    public void setParkingplaceftbid(String parkingplaceftbid) {
        this.parkingplaceftbid = parkingplaceftbid;
    }

    public String getParkingplacefreetimeid() {
        return parkingplacefreetimeid;
    }

    public void setParkingplacefreetimeid(String parkingplacefreetimeid) {
        this.parkingplacefreetimeid = parkingplacefreetimeid;
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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

	public List<Ppftbuserecord> getPpftbuserecordList() {
		return ppftbuserecordList;
	}

	public void setPpftbuserecordList(List<Ppftbuserecord> ppftbuserecordList) {
		this.ppftbuserecordList = ppftbuserecordList;
	}

    
    
    
}