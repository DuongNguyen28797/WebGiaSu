package dao;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Chat;
import entities.KetNoi;

@Repository
public class ChatDAO {
	 @Autowired
		private JdbcTemplate jdbcTemplate;
	
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<Chat> getChuaDocPH(int id_ketnoi){
			String query= "SELECT * FROM chatbox WHERE id_ketnoi=? && trangthai=? && role=?";
			return jdbcTemplate.query(query,new Object[] {id_ketnoi,1,"PHUHUYNH"},new BeanPropertyRowMapper(Chat.class) );
		}
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<Chat> getChuaDocGS(int id_ketnoi){
			String query= "SELECT * FROM chatbox WHERE id_ketnoi=? && trangthai=? && role=?";
			return jdbcTemplate.query(query,new Object[] {id_ketnoi,1,"GiaSu"},new BeanPropertyRowMapper(Chat.class) );
		}
	 public int editTrangthaiGS(int id_ketnoi){
			String query="UPDATE chatbox SET trangthai=? WHERE id_ketnoi=? && role=?";
			return jdbcTemplate.update(query, new Object[]{0, id_ketnoi,"GiaSu"});			
		}
	 public int onlineDN(int id_user){
			String query="UPDATE users SET online=? WHERE id_user=?";
			return jdbcTemplate.update(query, new Object[]{1, id_user});			
		}
	 public int onlineDX(int id_user){
			String query="UPDATE users SET online=? WHERE id_user=?";
			return jdbcTemplate.update(query, new Object[]{0, id_user});			
		}
	 public int editTrangthaiPH(int id_ketnoi){
			String query="UPDATE chatbox SET trangthai=? WHERE id_ketnoi=? && role=?";
			return jdbcTemplate.update(query, new Object[]{0, id_ketnoi, "PHUHUYNH"});			
		}
	 public int count(int id_ketnoi){
			String query= "SELECT COUNT(*) FROM chatbox WHERE trangthai=1 && id_ketnoi=?";
			return  jdbcTemplate.queryForObject(query, new Object[] {id_ketnoi},Integer.class);
		}
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<Chat> getList(int id_ketnoi){
			String query= "SELECT * FROM chatbox WHERE id_ketnoi=? ORDER BY id_chat ASC";
			return jdbcTemplate.query(query,new Object[] {id_ketnoi},new BeanPropertyRowMapper(Chat.class) );
		}
	 public KetNoi getKetNoi(int id_giasu, int id_phuhuynh) {
			String query = "SELECT * FROM ketnoi WHERE id_giasu=? && id_phuhuynh=?";
			return jdbcTemplate.queryForObject(query, new Object[] {id_giasu, id_phuhuynh}, new BeanPropertyRowMapper<KetNoi>(KetNoi.class));
		}
	 public int addItem(Chat objItem) {
			String query = "INSERT INTO chatbox(noidung,role,id_ketnoi, time) VALUES (?,?,?,?)";
			return jdbcTemplate.update(query, new Object[] { objItem.getNoidung(), objItem.getRole(), objItem.getId_ketnoi(), objItem.getTime()});
		}

}
