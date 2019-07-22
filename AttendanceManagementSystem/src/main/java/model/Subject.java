package model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Subject {
	
	@Id
	private int subid;
	private String subname;
	private String subdepartment;
	private String subsem;
	@ManyToOne
	private Faculty fac;
	
	public int getSubid() {
		return subid;
	}
	public void setSubid(int subid) {
		this.subid = subid;
	}
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	public String getSubdepartment() {
		return subdepartment;
	}
	public void setSubdepartment(String subdepartment) {
		this.subdepartment = subdepartment;
	}
	public String getSubsem() {
		return subsem;
	}
	public void setSubsem(String subsem) {
		this.subsem = subsem;
	}
	public Faculty getFac() {
		return fac;
	}
	public void setFac(Faculty fac) {
		this.fac = fac;
	}
	@Override
	public String toString() {
		return "Subject [subid=" + subid + ", subname=" + subname + ", subdepartment=" + subdepartment + ", subsem="
				+ subsem + "]";
	}
	
}