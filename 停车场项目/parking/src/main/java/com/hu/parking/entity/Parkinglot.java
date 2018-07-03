package com.hu.parking.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Component;

@Component
public class Parkinglot implements Serializable {
    private String parkinglotid;

    private String propertycompanyid;

    private String parkinglotname;

    private BigDecimal longitude;

    private BigDecimal latitude;

    private Integer parkingplacenum;

    private Integer freeparkingplacenum;

    private String note;

    private String state;
    
    private String parkinglotaddress;
    
    private String ingressmap;
    
    private Double distance; //距离
    
    private List<Parkinglotslice> parkinglotsliceList;
    private List<Parkingplace> parkingplaceList;
    private List<Parkingplacefreetime> parkingplacefreetimeList;
    private List<Parkingplaceftb> parkingplaceftbList;

    private static final long serialVersionUID = 1L;

    public String getParkinglotid() {
        return parkinglotid;
    }

    public void setParkinglotid(String parkinglotid) {
        this.parkinglotid = parkinglotid;
    }

    public String getPropertycompanyid() {
        return propertycompanyid;
    }

    public void setPropertycompanyid(String propertycompanyid) {
        this.propertycompanyid = propertycompanyid;
    }

    public String getParkinglotname() {
        return parkinglotname;
    }

    public void setParkinglotname(String parkinglotname) {
        this.parkinglotname = parkinglotname == null ? null : parkinglotname.trim();
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

    public Integer getParkingplacenum() {
        return parkingplacenum;
    }

    public void setParkingplacenum(Integer parkingplacenum) {
        this.parkingplacenum = parkingplacenum;
    }

    public Integer getFreeparkingplacenum() {
        return freeparkingplacenum;
    }

    public void setFreeparkingplacenum(Integer freeparkingplacenum) {
        this.freeparkingplacenum = freeparkingplacenum;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

	public String getParkinglotaddress() {
		return parkinglotaddress;
	}

	public void setParkinglotaddress(String parkinglotaddress) {
		this.parkinglotaddress = parkinglotaddress  == null ? null : parkinglotaddress.trim();
	}

	public List<Parkinglotslice> getParkinglotsliceList() {
		return parkinglotsliceList;
	}

	public void setParkinglotsliceList(List<Parkinglotslice> parkinglotsliceList) {
		this.parkinglotsliceList = parkinglotsliceList;
	}

	public List<Parkingplace> getParkingplaceList() {
		return parkingplaceList;
	}

	public void setParkingplaceList(List<Parkingplace> parkingplaceList) {
		this.parkingplaceList = parkingplaceList;
	}

	public List<Parkingplacefreetime> getParkingplacefreetimeList() {
		return parkingplacefreetimeList;
	}

	public void setParkingplacefreetimeList(
			List<Parkingplacefreetime> parkingplacefreetimeList) {
		this.parkingplacefreetimeList = parkingplacefreetimeList;
	}

	public List<Parkingplaceftb> getParkingplaceftbList() {
		return parkingplaceftbList;
	}

	public void setParkingplaceftbList(List<Parkingplaceftb> parkingplaceftbList) {
		this.parkingplaceftbList = parkingplaceftbList;
	}

	public String getIngressmap() {
		return ingressmap;
	}

	public void setIngressmap(String ingressmap) {
		this.ingressmap = ingressmap;
	}

	public Double getDistance() {
		return distance;
	}

	public void setDistance(Double distance) {
		this.distance = distance;
	}
    
    
}