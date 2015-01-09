package com.dm.bean;

import java.util.Date;

public class TicketBean {
	
	String tktid;
	String tktsub;
	String tktdesc;
	int tktstatus;
	Date tktlastmodified;
	Date createdate;
	String roleid;
	String ticketuserid;
	String ticketusername;
	
	@Override
	public String toString() {
		return "TicketBean [tktsub=" + tktsub + ", tktdesc=" + tktdesc + "]";
	}
	public String getTktsub() {
		return tktsub;
	}
	public void setTktsub(String tktsub) {
		this.tktsub = tktsub;
	}
	public String getTktdesc() {
		return tktdesc;
	}
	public void setTktdesc(String tktdesc) {
		this.tktdesc = tktdesc;
	}
	public String getTktid() {
		return tktid;
	}
	public void setTktid(String tktid) {
		this.tktid = tktid;
	}
	public int getTktstatus() {
		return tktstatus;
	}
	public void setTktstatus(int tktstatus) {
		this.tktstatus = tktstatus;
	}
	public Date getTktlastmodified() {
		return tktlastmodified;
	}
	public void setTktlastmodified(Date tktlastmodified) {
		this.tktlastmodified = tktlastmodified;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public String getRoleid() {
		return roleid;
	}
	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}
	public String getTicketuserid() {
		return ticketuserid;
	}
	public void setTicketuserid(String ticketuserid) {
		this.ticketuserid = ticketuserid;
	}
	public String getTicketusername() {
		return ticketusername;
	}
	public void setTicketusername(String ticketusername) {
		this.ticketusername = ticketusername;
	}

}
