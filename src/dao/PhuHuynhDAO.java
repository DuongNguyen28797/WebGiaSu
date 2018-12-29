package dao;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.BaiViet;
import entities.User;
import utils.StringUtils;

@Repository
public class PhuHuynhDAO {
	 @Autowired
		private JdbcTemplate jdbcTemplate;
	 @Autowired
		private StringUtils stringUtils;
	 
	 public int addPhuHuynh(User objItem) {
			String query = "INSERT INTO users(fullname, username, password, diachi, id_quanhuyen, phone, email, role, picture) VALUES (?,?,?,?,?,?,?,?,?)";
			return jdbcTemplate.update(query, new Object[] {objItem.getFullname(), objItem.getUsername(), stringUtils.md5(objItem.getPassword()), objItem.getDiachi(), objItem.getId_quanhuyen(), objItem.getPhone(), objItem.getEmail(), "PHUHUYNH","user-icon-png-pnglogocom.png"});
		}
	 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<User> getListPhuHuynh(){
			String query= "SELECT * FROM users WHERE role=?";
			return jdbcTemplate.query(query,new Object[] {"PHUHUYNH"},new BeanPropertyRowMapper(User.class) );
		}
	 public int editTrangthai(int id_sp, int atrangthai){
			String query="UPDATE users SET enable=? WHERE id_user=?";
			return jdbcTemplate.update(query, new Object[]{atrangthai, id_sp} );			
		} 
	
	 public int editWebXu(int id_phuhuynh, int webxu){
			String query="UPDATE users SET webxu=? WHERE id_user=?";
			return jdbcTemplate.update(query, new Object[]{webxu, id_phuhuynh} );			
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
			return jdbcTemplate.update(query, new Object[] {id});
		}
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public User checklogin(String username, String password){
			String query= "SELECT * FROM users WHERE username=? && password=? && role=?";
		try{	
			return (User) jdbcTemplate.queryForObject(query,new Object[]{username,stringUtils.md5(password),"PHUHUYNH"}, new BeanPropertyRowMapper(User.class) );
	     }catch (EmptyResultDataAccessException e) {
			return null;
		}	
	 }
}
