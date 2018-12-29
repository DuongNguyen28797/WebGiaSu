package entities;

public class BinhLuanGiaSu {
        private int id_binhluangs;
        private int id_giasu;
        private String name;
        private String email;
        private String comment;
        private String time;
        private String picture;
		public int getId_binhluangs() {
			return id_binhluangs;
		}
		public void setId_binhluangs(int id_binhluangs) {
			this.id_binhluangs = id_binhluangs;
		}
		public int getId_giasu() {
			return id_giasu;
		}
		public void setId_giasu(int id_giasu) {
			this.id_giasu = id_giasu;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getComment() {
			return comment;
		}
		public void setComment(String comment) {
			this.comment = comment;
		}
		public String getTime() {
			return time;
		}
		public void setTime(String time) {
			this.time = time;
		}
		public String getPicture() {
			return picture;
		}
		public void setPicture(String picture) {
			this.picture = picture;
		}
		public BinhLuanGiaSu(int id_binhluangs, int id_giasu, String name, String email, String comment, String time,
				String picture) {
			super();
			this.id_binhluangs = id_binhluangs;
			this.id_giasu = id_giasu;
			this.name = name;
			this.email = email;
			this.comment = comment;
			this.time = time;
			this.picture = picture;
		}
		public BinhLuanGiaSu() {
			super();
			// TODO Auto-generated constructor stub
		}
        
}
