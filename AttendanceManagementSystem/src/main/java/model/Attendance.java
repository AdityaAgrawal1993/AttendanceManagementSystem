package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Attendance {

	@Id
	@GeneratedValue  
	private int aid;
	private String date;
	private int studentid;
	private int subjectid;
	private String present;
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getStudentid() {
		return studentid;
	}
	public void setStudentid(int studentid) {
		this.studentid = studentid;
	}
	public int getSubjectid() {
		return subjectid;
	}
	public void setSubjectid(int subjectid) {
		this.subjectid = subjectid;
	}
	public String getPresent() {
		return present;
	}
	public void setPresent(String present) {
		this.present = present;
	}
	@Override
	public String toString() {
		return "Attendance [aid=" + aid + ", date=" + date + ", studentid=" + studentid + ", subjectid=" + subjectid
				+ ", present=" + present + "]";
	}
	
}
