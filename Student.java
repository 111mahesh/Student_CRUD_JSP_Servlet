package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Student {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int sid;
	private String sname;
	private String scity;
	private String sgender;
	private String saddress;
	private String sstream;
	private double sper;
	private String shobbies;
	private byte[] simage;
	private byte[] sresume;
	public byte[] getSimage() {
		return simage;
	}
	public void setSimage(byte[] simage) {
		this.simage = simage;
	}
	public byte[] getSresume() {
		return sresume;
	}
	public void setSresume(byte[] sresume) {
		this.sresume = sresume;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getScity() {
		return scity;
	}
	public void setScity(String scity) {
		this.scity = scity;
	}
	public String getSgender() {
		return sgender;
	}
	public void setSgender(String sgender) {
		this.sgender = sgender;
	}
	public String getSaddress() {
		return saddress;
	}
	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}
	public String getSstream() {
		return sstream;
	}
	public void setSstream(String sstream) {
		this.sstream = sstream;
	}
	public double getSper() {
		return sper;
	}
	public void setSper(double sper) {
		this.sper = sper;
	}
	public String getShobbies() {
		return shobbies;
	}
	public void setShobbies(String shobbies) {
		this.shobbies = shobbies;
	}
	@Override
	public String toString() {
		return "Student [sid=" + sid + ", sname=" + sname + ", scity=" + scity + ", sgender=" + sgender + ", saddress="
				+ saddress + ", sstream=" + sstream + ", sper=" + sper + ", shobbies=" + shobbies + "]";
	}
}
