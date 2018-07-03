package com.hu.parking.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Component
public class Freetimebucket implements Serializable {
    private String freetimebucketid;

    private String freetimetmpid;
    
    @JsonFormat(pattern="HH",timezone = "GMT+8")
    private Date freetimebucketbegin;
    
    @JsonFormat(pattern="HH",timezone = "GMT+8")
    private Date freetimebucketend;

    private Double price;
    
    private static final long serialVersionUID = 1L;

    public String getFreetimebucketid() {
        return freetimebucketid;
    }

    public void setFreetimebucketid(String freetimebucketid) {
        this.freetimebucketid = freetimebucketid;
    }

    public String getFreetimetmpid() {
        return freetimetmpid;
    }

    public void setFreetimetmpid(String freetimetmpid) {
        this.freetimetmpid = freetimetmpid;
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
    
}