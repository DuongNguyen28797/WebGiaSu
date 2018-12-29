package dao;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.HoaDon;
import entities.KetNoi;
import entities.User;

@Repository
public class UserDAO {
	 @Autowired
		private JdbcTemplate jdbcTemplate;
	 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<KetNoi> getListketNoi(int id_phuhuynh, int id_giasu){
			String query= "SELECT * FROM ketnoi WHERE id_phuhuynh=? && id_giasu=?";
			return jdbcTemplate.query(query,new Object[]{id_phuhuynh, id_giasu},new BeanPropertyRowMapper(KetNoi.class) );
		}
	 public int addHoaDon(HoaDon obj) {
			String query = "INSERT INTO hoadon(id_user, webxunapvao) VALUES (?,?)";
			return jdbcTemplate.update(query, new Object[] {obj.getId_user(), obj.getWebxunapvao()});
		}
	 public int delHoaDon(int id_hoadon) {
			String query = "DELETE FROM hoadon WHERE id_hoadon=? ";
			return jdbcTemplate.update(query, new Object[] { id_hoadon});
		}
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<HoaDon> getListHoaDon(){
			String query= "SELECT * FROM hoadon";
			return jdbcTemplate.query(query,new BeanPropertyRowMapper(HoaDon.class) );
		}
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public HoaDon getHoaDon(int id_hoadon){
			String query= "SELECT * FROM  hoadon WHERE id_hoadon=? ";
			return (HoaDon) jdbcTemplate.queryForObject(query,new Object[]{id_hoadon}, new BeanPropertyRowMapper(HoaDon.class) );
		}
	
	 public int editHoaDon(int id_hoadon) {
			String query = "UPDATE hoadon SET trangthai=?  WHERE id_hoadon=?";
			return jdbcTemplate.update(query, new Object[] {0,id_hoadon});
		}
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<KetNoi> getThongBaoGoiLoiMoi(int id_phuhuynh, int id_giasu){
			String query= "SELECT * FROM thongbao WHERE id_phuhuynh=? && id_giasu=? && loaithongbao=?";
			return jdbcTemplate.query(query,new Object[]{id_phuhuynh, id_giasu, 3},new BeanPropertyRowMapper(KetNoi.class) );
		}
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<KetNoi> getListketNoiGS(int id_giasu){
			String query= "SELECT * FROM ketnoi WHERE id_giasu=?";
			return jdbcTemplate.query(query,new Object[]{id_giasu},new BeanPropertyRowMapper(KetNoi.class) );
		}
	 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<KetNoi> getListketNoiPH(int id_phuhuynh){
			String query= "SELECT * FROM ketnoi WHERE id_phuhuynh=?";
			return jdbcTemplate.query(query,new Object[]{id_phuhuynh},new BeanPropertyRowMapper(KetNoi.class) );
		}
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public KetNoi getItemKetNoi(int id_ketnoi){
			String query= "SELECT * FROM  ketnoi WHERE id_ketnoi=? ";
			return (KetNoi) jdbcTemplate.queryForObject(query,new Object[]{id_ketnoi}, new BeanPropertyRowMapper(KetNoi.class) );
		}
	 
	 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<User> getListUser(){
			String query= "SELECT * FROM users";
			return jdbcTemplate.query(query,new BeanPropertyRowMapper(User.class) );
		}
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public User getItem(int id){
			String query= "SELECT * FROM  users WHERE id_user=? ";
			return (User) jdbcTemplate.queryForObject(query,new Object[]{id}, new BeanPropertyRowMapper(User.class) );
		}
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<User> getListGiaSU(){
			String query= "SELECT * FROM users WHERE role=? ORDER BY sobauchon DESC";
			return jdbcTemplate.query(query,new Object[]{"GIASU"},new BeanPropertyRowMapper(User.class) );
		}
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<User> getListPhuHuynh(){
			String query= "SELECT * FROM users WHERE role=?";
			return jdbcTemplate.query(query,new Object[]{"PHUHUYNH"},new BeanPropertyRowMapper(User.class) );
		}
	 public int editGiaSu(User objItem) {
			String query = "UPDATE users SET fullname=?, sonamkinhnghiem=?, diachi=?, phone=?, gioithieubanthan=?, picture=?  WHERE id_user=?";
			return jdbcTemplate.update(query, new Object[] { objItem.getFullname(), objItem.getSonamkinhnghiem(), objItem.getDiachi(), objItem.getPhone(), objItem.getGioithieubanthan(), objItem.getPicture(), objItem.getId_user()});
		}
	 public int editPhuHuynh(User objItem) {
			String query = "UPDATE users SET fullname=?, diachi=?, phone=?, email=?, picture=?  WHERE id_user=?";
			return jdbcTemplate.update(query, new Object[] { objItem.getFullname(), objItem.getDiachi(), objItem.getPhone(), objItem.getEmail(), objItem.getPicture(), objItem.getId_user()});
		}
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public User getUser(String user){
		 try{
			String query= "SELECT * FROM  users WHERE username=? ";
			return (User) jdbcTemplate.queryForObject(query,new Object[]{user}, new BeanPropertyRowMapper(User.class) );
	 }catch (EmptyResultDataAccessException e) {
			return null;
		}	
	 }

}
