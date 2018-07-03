package com.hu.parking.vo;


/**
 * 用于页面数据传递
 * @author leeyuan
 *
 */
public class IncomeVo {
	private String parkingplaceid;
	private String parkingplaceno;
	private String slicename;
	private String parkinglotname;
	private double income;
	
	public double getIncome() {
		return income;
	}
	public void setIncome(double income) {
		this.income = income;
	}
	public String getParkingplaceno() {
		return parkingplaceno;
	}
	public void setParkingplaceno(String parkingplaceno) {
		this.parkingplaceno = parkingplaceno;
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
	
	
	
}
