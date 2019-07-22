package model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Student {

	@Id
	private int sroll;
	private String sname;
	private String spassword;
	private String sbranch;
	private String ssem;
	private String sdob;
	private String semail;
	private String smobile;

	public int getSroll() {
		return sroll;
	}
	public void setSroll(int sroll) {
		this.sroll = sroll;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSpassword() {
		return spassword;
	}
	public void setSpassword(String spassword) {
		this.spassword = spassword;
	}
	public String getSbranch() {
		return sbranch;
	}
	public void setSbranch(String sbranch) {
		this.sbranch = sbranch;
	}
	public String getSsem() {
		return ssem;
	}
	public void setSsem(String ssem) {
		this.ssem = ssem;
	}
	public String getSdob() {
		return sdob;
	}
	public void setSdob(String sdob) {
		this.sdob = sdob;
	}
	public String getSemail() {
		return semail;
	}
	public void setSemail(String semail) {
		this.semail = semail;
	}
	public String getSmobile() {
		return smobile;
	}
	public void setSmobile(String smobile) {
		this.smobile = smobile;
	}
	
	@Override
	public String toString() {
		return "Student [sroll=" + sroll + ", sname=" + sname + ", spassword=" + spassword + ", sbranch=" + sbranch
				+ ", ssem=" + ssem + ", sdob=" + sdob + ", semail=" + semail + ", smobile=" + smobile + "]";
	}

}
