package entities;

public class Chat {
     private int id_chat;
     private int id_ketnoi;
     private String noidung;
     private String role;
     private String time;
     private int trangthai;
	public int getId_chat() {
		return id_chat;
	}
	public void setId_chat(int id_chat) {
		this.id_chat = id_chat;
	}
	public int getId_ketnoi() {
		return id_ketnoi;
	}
	public void setId_ketnoi(int id_ketnoi) {
		this.id_ketnoi = id_ketnoi;
	}
	public String getNoidung() {
		return noidung;
	}
	public void setNoidung(String noidung) {
		this.noidung = noidung;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getTrangthai() {
		return trangthai;
	}
	public void setTrangthai(int trangthai) {
		this.trangthai = trangthai;
	}
	public Chat(int id_chat, int id_ketnoi, String noidung, String role, String time, int trangthai) {
		super();
		this.id_chat = id_chat;
		this.id_ketnoi = id_ketnoi;
		this.noidung = noidung;
		this.role = role;
		this.time = time;
		this.trangthai = trangthai;
	}
	public Chat() {
		super();
		// TODO Auto-generated constructor stub
	}
     
     
}
