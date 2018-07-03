package com.hu.parking.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Component
public class Rentrecord implements Serializable {
    private String rentrecordid;

    private String parkingplacefreetimeid;

    private String usercarid;

    private String usercouponid;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date appointmenttime;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date appointmentbegintime;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date appointmentendtime;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date factbegintime;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date factendtime;

    private Double appointmentcost;

    private Double freetimecost;

    private Double omittimecostscale;

    private Double omittimecost;

    private Double exceedtimecostscale;

    private Double exceedtimecost;

    private Double punishtimecostscale;

    private Double punishcost;

    private Double preferentialratio;

    private Double preferentialcost;

    private Double payablecost;

    private Double paidcost;

    private String paymethod;

    private String ispay;
    
    private String acpaystate;
    
    private String parkingplaceid;
    
    private String carnumber;
    private String parkingplaceno;
    private String realname;
    private String slicename;
    private String parkinglotname;
    private BigDecimal longitude;
    private BigDecimal latitude;
    private String parkinglotaddress;
    private String ingressmap;
    private static final long serialVersionUID = 1L;

    public String getRentrecordid() {
        return rentrecordid;
    }

    public void setRentrecordid(String rentrecordid) {
        this.rentrecordid = rentrecordid;
    }

    public String getParkingplacefreetimeid() {
        return parkingplacefreetimeid;
    }

    public void setParkingplacefreetimeid(String parkingplacefreetimeid) {
        this.parkingplacefreetimeid = parkingplacefreetimeid;
    }

    public String getUsercarid() {
        return usercarid;
    }

    public void setUsercarid(String usercarid) {
        this.usercarid = usercarid;
    }

    public String getUsercouponid() {
        return usercouponid;
    }

    public void setUsercouponid(String usercouponid) {
        this.usercouponid = usercouponid;
    }

    public Date getAppointmenttime() {
        return appointmenttime;
    }

    public void setAppointmenttime(Date appointmenttime) {
        this.appointmenttime = appointmenttime;
    }

    public Date getAppointmentbegintime() {
        return appointmentbegintime;
    }

    public void setAppointmentbegintime(Date appointmentbegintime) {
        this.appointmentbegintime = appointmentbegintime;
    }

    public Date getAppointmentendtime() {
        return appointmentendtime;
    }

    public void setAppointmentendtime(Date appointmentendtime) {
        this.appointmentendtime = appointmentendtime;
    }

    public Date getFactbegintime() {
        return factbegintime;
    }

    public void setFactbegintime(Date factbegintime) {
        this.factbegintime = factbegintime;
    }

    public Date getFactendtime() {
        return factendtime;
    }

    public void setFactendtime(Date factendtime) {
        this.factendtime = factendtime;
    }

    public Double getAppointmentcost() {
        return appointmentcost;
    }

    public void setAppointmentcost(Double appointmentcost) {
        this.appointmentcost = appointmentcost;
    }

    public Double getFreetimecost() {
        return freetimecost;
    }

    public void setFreetimecost(Double freetimecost) {
        this.freetimecost = freetimecost;
    }

    public Double getOmittimecostscale() {
        return omittimecostscale;
    }

    public void setOmittimecostscale(Double omittimecostscale) {
        this.omittimecostscale = omittimecostscale;
    }

    public Double getOmittimecost() {
        return omittimecost;
    }

    public void setOmittimecost(Double omittimecost) {
        this.omittimecost = omittimecost;
    }

    public Double getExceedtimecostscale() {
        return exceedtimecostscale;
    }

    public void setExceedtimecostscale(Double exceedtimecostscale) {
        this.exceedtimecostscale = exceedtimecostscale;
    }

    public Double getExceedtimecost() {
        return exceedtimecost;
    }

    public void setExceedtimecost(Double exceedtimecost) {
        this.exceedtimecost = exceedtimecost;
    }

    public Double getPunishtimecostscale() {
        return punishtimecostscale;
    }

    public void setPunishtimecostscale(Double punishtimecostscale) {
        this.punishtimecostscale = punishtimecostscale;
    }

    public Double getPunishcost() {
        return punishcost;
    }

    public void setPunishcost(Double punishcost) {
        this.punishcost = punishcost;
    }

    public Double getPreferentialratio() {
        return preferentialratio;
    }

    public void setPreferentialratio(Double preferentialratio) {
        this.preferentialratio = preferentialratio;
    }

    public Double getPreferentialcost() {
        return preferentialcost;
    }

    public void setPreferentialcost(Double preferentialcost) {
        this.preferentialcost = preferentialcost;
    }

    public Double getPayablecost() {
        return payablecost;
    }

    public void setPayablecost(Double payablecost) {
        this.payablecost = payablecost;
    }

    public Double getPaidcost() {
        return paidcost;
    }

    public void setPaidcost(Double paidcost) {
        this.paidcost = paidcost;
    }

    public String getPaymethod() {
        return paymethod;
    }

    public void setPaymethod(String paymethod) {
        this.paymethod = paymethod == null ? null : paymethod.trim();
    }

    public String getIspay() {
        return ispay;
    }

    public void setIspay(String ispay) {
        this.ispay = ispay == null ? null : ispay.trim();
    }

	public String getAcpaystate() {
		return acpaystate;
	}

	public void setAcpaystate(String acpaystate) {
		this.acpaystate = acpaystate;
	}

	public String getCarnumber() {
		return carnumber;
	}

	public void setCarnumber(String carnumber) {
		this.carnumber = carnumber;
	}

	public String getParkingplaceno() {
		return parkingplaceno;
	}

	public void setParkingplaceno(String parkingplaceno) {
		this.parkingplaceno = parkingplaceno;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
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
    
	public String getParkingplaceid() {
        return parkingplaceid;
    }

    public void setParkingplaceid(String parkingplaceid) {
        this.parkingplaceid = parkingplaceid;
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

	public String getParkinglotaddress() {
		return parkinglotaddress;
	}

	public void setParkinglotaddress(String parkinglotaddress) {
		this.parkinglotaddress = parkinglotaddress;
	}

	public String getIngressmap() {
		return ingressmap;
	}

	public void setIngressmap(String ingressmap) {
		this.ingressmap = ingressmap;
	}
    
    
}