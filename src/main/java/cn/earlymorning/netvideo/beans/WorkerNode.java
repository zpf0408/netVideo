package cn.earlymorning.netvideo.beans;

import java.sql.Date;
import java.sql.Timestamp;

public class WorkerNode {

	private Integer id;
	private String hostName;
	private String port;
	private Integer type;
	private Date date;
	private Timestamp modified;
	private Timestamp created;

	public WorkerNode(Integer id, String hostName, String port, Integer type, Date date, Timestamp modified, Timestamp created) {
		this.id = id;
		this.hostName = hostName;
		this.port = port;
		this.type = type;
		this.date = date;
		this.modified = modified;
		this.created = created;
	}

	public WorkerNode() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getHostName() {
		return hostName;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Timestamp getModified() {
		return modified;
	}

	public void setModified(Timestamp modified) {
		this.modified = modified;
	}

	public Timestamp getCreated() {
		return created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}

	@Override
	public String toString() {
		return "WorkerNode{" +
				"id=" + id +
				", hostName='" + hostName + '\'' +
				", port='" + port + '\'' +
				", type=" + type +
				", date=" + date +
				", modified=" + modified +
				", created=" + created +
				'}';
	}
}
