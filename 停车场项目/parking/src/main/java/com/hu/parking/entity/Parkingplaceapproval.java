package com.hu.parking.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Component
public class Parkingplaceapproval implements Serializable {
    private String parkingplaceapprovalid;

    private String parkingplaceid;

    private String orduserid;

    private String propertyuserid;

    private String sysuserid;

    private String approvalstate;

    private String reason;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date applytime;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date approvaltime;

    private String note;
    
    private String realname;
    
    private String phone;
    
    private String slicename;
    
    private String parkinglotname;
    
    private String parkingplaceno;
    

    private static final long serialVersionUID = 1L;

    public String getParkingplaceapprovalid() {
        return parkingplaceapprovalid;
    }

    public void setParkingplaceapprovalid(String parkingplaceapprovalid) {
        this.parkingplaceapprovalid = parkingplaceapprovalid;
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

    public String getPropertyuserid() {
        return propertyuserid;
    }

    public void setPropertyuserid(String propertyuserid) {
        this.propertyuserid = propertyuserid;
    }

    public String getSysuserid() {
        return sysuserid;
    }

    public void setSysuserid(String sysuserid) {
        this.sysuserid = sysuserid;
    }

    public String getApprovalstate() {
        return approvalstate;
    }

    public void setApprovalstate(String approvalstate) {
        this.approvalstate = approvalstate == null ? null : approvalstate.trim();
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    public Date getApplytime() {
        return applytime;
    }

    public void setApplytime(Date applytime) {
        this.applytime = applytime;
    }

    public Date getApprovaltime() {
        return approvaltime;
    }

    public void setApprovaltime(Date approvaltime) {
        this.approvaltime = approvaltime;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSlicename() {
		return slicename;
	}

	public void setSlicename(String slicename) {
		this.slicename = slicename;
	}

	public String getParkinglotname() {
		return parkinglotname;
	}

	public void setParkinglotname(String parkinglotname) {
		this.parkinglotname = parkinglotname;
	}

	public String getParkingplaceno() {
		return parkingplaceno;
	}

	public void setParkingplaceno(String parkingplaceno) {
		this.parkingplaceno = parkingplaceno;
	}
    
    
}