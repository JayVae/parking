package com.hu.parking.entity;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Verifier implements Serializable {
    private String verifierid;

    private String parkinglotid;

    private String verifiercode;

    private String entrancetype;

    private static final long serialVersionUID = 1L;

    public String getVerifierid() {
        return verifierid;
    }

    public void setVerifierid(String verifierid) {
        this.verifierid = verifierid;
    }

    public String getParkinglotid() {
        return parkinglotid;
    }

    public void setParkinglotid(String parkinglotid) {
        this.parkinglotid = parkinglotid;
    }

    public String getVerifiercode() {
        return verifiercode;
    }

    public void setVerifiercode(String verifiercode) {
        this.verifiercode = verifiercode == null ? null : verifiercode.trim();
    }

    public String getEntrancetype() {
        return entrancetype;
    }

    public void setEntrancetype(String entrancetype) {
        this.entrancetype = entrancetype == null ? null : entrancetype.trim();
    }
}