package entities;

public class User {
    private int id_user;
    private String fullname;
    private String username;
    private String password;
	private String diachi;
	private int id_quanhuyen;
	private String phone;
	private String email;
	private String role;
	private int enable;
	private String picture;
	private int webxu;
	private String ngaydk;
	private int sobauchon;
	private int online;
	private int sonamkinhnghiem;
	private String gioithieubanthan;
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public int getId_quanhuyen() {
		return id_quanhuyen;
	}
	public void setId_quanhuyen(int id_quanhuyen) {
		this.id_quanhuyen = id_quanhuyen;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getWebxu() {
		return webxu;
	}
	public void setWebxu(int webxu) {
		this.webxu = webxu;
	}
	public String getNgaydk() {
		return ngaydk;
	}
	public void setNgaydk(String ngaydk) {
		this.ngaydk = ngaydk;
	}
	public int getSobauchon() {
		return sobauchon;
	}
	public void setSobauchon(int sobauchon) {
		this.sobauchon = sobauchon;
	}
	public int getOnline() {
		return online;
	}
	public void setOnline(int online) {
		this.online = online;
	}
	public int getSonamkinhnghiem() {
		return sonamkinhnghiem;
	}
	public void setSonamkinhnghiem(int sonamkinhnghiem) {
		this.sonamkinhnghiem = sonamkinhnghiem;
	}
	public String getGioithieubanthan() {
		return gioithieubanthan;
	}
	public void setGioithieubanthan(String gioithieubanthan) {
		this.gioithieubanthan = gioithieubanthan;
	}
	public User(int id_user, String fullname, String username, String password, String diachi, int id_quanhuyen,
			String phone, String email, String role, int enable, String picture, int webxu, String ngaydk,
			int sobauchon, int online, int sonamkinhnghiem, String gioithieubanthan) {
		super();
		this.id_user = id_user;
		this.fullname = fullname;
		this.username = username;
		this.password = password;
		this.diachi = diachi;
		this.id_quanhuyen = id_quanhuyen;
		this.phone = phone;
		this.email = email;
		this.role = role;
		this.enable = enable;
		this.picture = picture;
		this.webxu = webxu;
		this.ngaydk = ngaydk;
		this.sobauchon = sobauchon;
		this.online = online;
		this.sonamkinhnghiem = sonamkinhnghiem;
		this.gioithieubanthan = gioithieubanthan;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}	