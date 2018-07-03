package com.hu.parking.entity;


import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class Permissions implements Serializable {
	
	
	

	private List<Permissions> children; //自定义字段，用于构造Tree结构,表示它的子数据
	private boolean checked; //自定义字段，用于构造Tree结构,表示它是否已勾选
	
	private String permissionsid;
	private String parentid;
	private String title;
	private String permstr;
	private String url;
	private Integer ordernum;
	private String icncls;
	private String type;
	private String notes;
	private Integer level;
	private String usablestate;
	private static final long serialVersionUID = 1L;


	public String getPermissionsid() {
		return permissionsid;
	}

	public void setPermissionsid(String permissionsid) {
		this.permissionsid = permissionsid == null ? null : permissionsid.trim();
	}

	public String getParentid() {
		return parentid;
	}

	public void setParentid(String parentid) {
		this.parentid = parentid == null ? null : parentid.trim();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	

	public String getPermstr() {
		return permstr;
	}

	public void setPermstr(String permstr) {
		this.permstr = permstr;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url == null ? null : url.trim();
	}

	public Integer getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(Integer ordernum) {
		this.ordernum = ordernum;
	}

	public String getIcncls() {
		return icncls;
	}

	public void setIcncls(String icncls) {
		this.icncls = icncls == null ? null : icncls.trim();
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type == null ? null : type.trim();
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes == null ? null : notes.trim();
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getUsablestate() {
		return usablestate;
	}

	public void setUsablestate(String usablestate) {
		this.usablestate = usablestate == null ? null : usablestate.trim();
	}

	

	
	public List<Permissions> getChildren() {
		return children;
	}

	public void setChildren(List<Permissions> children) {
		this.children = children;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
	

	
}