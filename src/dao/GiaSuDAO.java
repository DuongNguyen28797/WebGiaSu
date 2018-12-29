package dao;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.BaiViet;
import entities.LuuGiaSu;
import entities.User;
import utils.StringUtils;

@Repository
public class GiaSuDAO {
	 @Autowired
		private JdbcTemplate jdbcTemplate;
	 @Autowired
		private StringUtils stringUtils;
	 
	 public int luu(int id_phuhuynh, int id_giasu) {
			String query = "INSERT INTO luugiasu(id_phuhuynh,id_giasu) VALUES (?,?)";
			return jdbcTemplate.update(query, new Object[] {id_phuhuynh, id_giasu});
		}
	 
	 public int editSoBauChon(int id_giasu, int sobauchon){
			String query="UPDATE users SET sobauchon=? WHERE id_user=?";
			return jdbcTemplate.update(query, new Object[]{sobauchon,id_giasu} );			
		} 
	 
	 public LuuGiaSu getLuu(int id_giasu, int id_phuhuynh) {
			String query = "SELECT * FROM luugiasu WHERE id_giasu=? && id_phuhuynh=?";
			try{
			return jdbcTemplate.queryForObject(query, new Object[] {id_giasu, id_phuhuynh}, new BeanPropertyRowMapper<LuuGiaSu>(LuuGiaSu.class));
			}catch (EmptyResultDataAccessException e) {
				return null;
			}
		}
	 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<LuuGiaSu> getListLuu(int id_phuhuynh){
			String query= "SELECT * FROM luugiasu WHERE id_phuhuynh=? ORDER BY id_luugiasu DESC";
			return jdbcTemplate.query(query,new Object[] {id_phuhuynh},new BeanPropertyRowMapper(LuuGiaSu.class) );
		}
	 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<User> getListGiaSu(){
			String query= "SELECT * FROM users WHERE role=? ORDER BY sobauchon DESC LIMIT 9";
			return jdbcTemplate.query(query,new Object[] {"GIASU"},new BeanPropertyRowMapper(User.class) );
		}
	 public int editTrangthai(int id_sp, int atrangthai){
			String query="UPDATE users SET enable=? WHERE id_user=?";
			return jdbcTemplate.update(query, new Object[]{atrangthai, id_sp} );			
		} 
	 public int editWebXu(int id_giasu, int webxu){
			String query="UPDATE users SET webxu=? WHERE id_user=?";
			return jdbcTemplate.update(query, new Object[]{webxu, id_giasu} );			
		} 
	 public int addItem(BaiViet objItem) {
			String query = "INSERT INTO baiviet(name_baiviet,mota,chitiet,picture) VALUES (?,?,?,?)";
			return jdbcTemplate.update(query, new Object[] { objItem.getName_baiviet(), objItem.getMota(), objItem.getChitiet(), objItem.getPicture()});
		}
	 
	 public User getItem(int id) {
			String query = "SELECT * FROM users WHERE id_user=?";
			return jdbcTemplate.queryForObject(query, new Object[] { id }, new BeanPropertyRowMapper<User>(User.class));
		}
	 public int editItem(BaiViet objItem) {
			String query = "UPDATE baiviet SET name_baiviet=?,mota=?,chitiet=?,picture=?  WHERE id_baiviet=?";
			return jdbcTemplate.update(query, new Object[] { objItem.getName_baiviet(), objItem.getMota(), objItem.getChitiet(), objItem.getPicture(), objItem.getId_baiviet()});
		}
	 public int delItem(int id) {
			String query = "DELETE FROM users WHERE id_user=? ";
			return jdbcTemplate.update(query, new Object[] { id });
		}
	 public int addGiaSu(User objItem) {
			String query = "INSERT INTO users(fullname, username, password, diachi, id_quanhuyen, phone, email, role, picture) VALUES (?,?,?,?,?,?,?,?,?)";
			return jdbcTemplate.update(query, new Object[] {objItem.getFullname(), objItem.getUsername(), stringUtils.md5(objItem.getPassword()), objItem.getDiachi(), objItem.getId_quanhuyen(), objItem.getPhone(), objItem.getEmail(), "GIASU","user-icon-png-pnglogocom.png"});
		}
	 
	
		public User checklogin(String username, String password){
			String query= "SELECT * FROM users WHERE username=? && password=? && role=?";
			try{
			return jdbcTemplate.queryForObject(query,new Object[]{username,stringUtils.md5(password),"GIASU"}, new BeanPropertyRowMapper<User>(User.class) );
			}catch (EmptyResultDataAccessException e) {
				return null;
			}
			}
	
}
