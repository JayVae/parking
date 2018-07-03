package com.hu.parking.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Component
public class Parkingplace implements Serializable {
    private String parkingplaceid;

    private String parkinglotsliceid;

    private String orduserid;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date regtime;

    private String usestate;//使用状态 

    private String positionofmap;
    
    private String parkingplaceno;
    
    //自定义
    private String parkinglotname;
    
    private String parkinglotid; 
    
    private String slicename;
    
    private String realname;
    
    private List<Parkingplacefreetime> parkingplacefreetimeList;

    private static final long serialVersionUID = 1L;

    public String getParkingplaceid() {
        return parkingplaceid;
    }

    public void setParkingplaceid(String parkingplaceid) {
        this.parkingplaceid = parkingplaceid;
    }

    public String getParkinglotsliceid() {
        return parkinglotsliceid;
    }

    public void setParkinglotsliceid(String parkinglotsliceid) {
        this.parkinglotsliceid = parkinglotsliceid;
    }

    public String getOrduserid() {
        return orduserid;
    }

    public void setOrduserid(String orduserid) {
        this.orduserid = orduserid;
    }

    public Date getRegtime() {
        return regtime;
    }

    public void setRegtime(Date regtime) {
        this.regtime = regtime;
    }

    public String getUsestate() {
        return usestate;
    }

    public void setUsestate(String usestate) {
        this.usestate = usestate == null ? null : usestate.trim();
    }

    public String getPositionofmap() {
        return positionofmap;
    }

    public void setPositionofmap(String positionofmap) {
        this.positionofmap = positionofmap == null ? null : positionofmap.trim();
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

	public String getSlicename() {
		return slicename;
	}

	public void setSlicename(String slicename) {
		this.slicename = slicename;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public List<Parkingplacefreetime> getParkingplacefreetimeList() {
		return parkingplacefreetimeList;
	}

	public void setParkingplacefreetimeList(
			List<Parkingplacefreetime> parkingplacefreetimeList) {
		this.parkingplacefreetimeList = parkingplacefreetimeList;
	}

	public String getParkinglotid() {
		return parkinglotid;
	}

	public void setParkinglotid(String parkinglotid) {
		this.parkinglotid = parkinglotid;
	}
    
    
}