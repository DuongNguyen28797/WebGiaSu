package controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


import constant.Defines;
import dao.BaiVietDAO;
import dao.BinhLuanBaiVietDAO;
import dao.ChatDAO;
import dao.DangKyDAO;
import dao.GiaSuDAO;
import dao.LichLamViecDAO;
import dao.PhuHuynhDAO;
import dao.ThongBaoDAO;
import dao.UserDAO;
import entities.Chat;
import entities.DangKyMon;
import entities.HoaDon;
import entities.KetNoi;
import entities.LichLamViec;
import entities.User;
import utils.SlugUtils;
import utils.Split;


@Controller
@RequestMapping(value="/giasu", method=RequestMethod.GET)
public class PublicGiaSuController {
	@Autowired
	private Defines defines;	
	@Autowired
	private SlugUtils slugUtils;
	@Autowired
	private DangKyDAO dangkyDAO;
	@Autowired
	private GiaSuDAO giasuDAO;
	@Autowired
	private PhuHuynhDAO phuhuynhDAO;
	@Autowired
	private BaiVietDAO baivietDAO;
	@Autowired
	private BinhLuanBaiVietDAO binhluanDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private ThongBaoDAO thongbaodao;
	@Autowired
	private Split split;
	@Autowired
	private ChatDAO chatdao;
	@Autowired
	private LichLamViecDAO lichlamviecDAO;
	@Autowired
	private BinhLuanBaiVietDAO binhluanGSDAO;
	
	@ModelAttribute
	public void addCommons(ModelMap modelMap, HttpSession session){
		User GiaSuInfo = (User) session.getAttribute("GiaSuInfo");
		int id_user = GiaSuInfo.getId_user();
		if(dangkyDAO.getDK(id_user, 1)!=null){
		modelMap.addAttribute("dangky1", dangkyDAO.getDK(id_user, 1));
		}
		if(dangkyDAO.getDK(id_user, 2)!=null){
		modelMap.addAttribute("dangky2", dangkyDAO.getDK(id_user, 2));
		}
		if(dangkyDAO.getDK(id_user, 3)!=null){
		modelMap.addAttribute("dangky3", dangkyDAO.getDK(id_user, 3));
		}
		ArrayList<KetNoi> listKetNoi = (ArrayList<KetNoi>) userDAO.getListketNoiGS(id_user);
		ArrayList<User> listPhuHuynh = new ArrayList<>();
		for(KetNoi objKN: listKetNoi){
			listPhuHuynh.add(userDAO.getItem(objKN.getId_phuhuynh()));
		}
		modelMap.addAttribute("listPhuHuynh", listPhuHuynh);
		modelMap.addAttribute("sothongbao", thongbaodao.count(id_user));
		modelMap.addAttribute("listThongBao", thongbaodao.getList(id_user));
		modelMap.addAttribute("listTatCaThongBao", thongbaodao.getListThongBao(id_user));
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slugUtils", slugUtils);
		modelMap.addAttribute("listQuanHuyen", dangkyDAO.getListQuanHuyen());
		modelMap.addAttribute("listMon", dangkyDAO.getListMon());
		modelMap.addAttribute("listLop", dangkyDAO.getListLop());
		modelMap.addAttribute("listGiaSu", userDAO.getListGiaSU());
		modelMap.addAttribute("split", split);
	}
	@RequestMapping(value="", method=RequestMethod.GET)
	public String indexGiaSu(ModelMap modelMap){
		modelMap.addAttribute("listDKM", dangkyDAO.getListDKM());
		modelMap.addAttribute("listBaiViet", baivietDAO.getListBaiViet());
		return "giasu.index";
	}
	
	@RequestMapping(value="/nap-tien-thanh-cong/{username}/{tongtien}" , method=RequestMethod.POST)
    public String suawebxu(@PathVariable("username") String username, @PathVariable("tongtien") int tongtien, HttpServletRequest request){
		     User objUser = userDAO.getUser(username);
		     int id_user = objUser.getId_user();
		     int xucu = objUser.getWebxu();
	           giasuDAO.editWebXu(id_user, xucu+tongtien);
			   thongbaodao.ThongBaoWebXu(id_user, xucu+tongtien, tongtien);
			   return "giasu.index"; 
    }
	
	@ResponseBody
	@RequestMapping(value="/nap-tien", method=RequestMethod.POST)
	public void naptien(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		PrintWriter out = response.getWriter();
		User GiaSuInfo = (User) session.getAttribute("GiaSuInfo");
		String username = GiaSuInfo.getUsername();
		int id_user = Integer.parseInt(request.getParameter("id_user"));
		int sotien = Integer.parseInt(request.getParameter("sotien"));
		HoaDon obj = new HoaDon("", 0, id_user, sotien, 1);
		userDAO.addHoaDon(obj);
		String urlThanhCong = "http://giasuonline.jelastic.tsukaeru.net/giasu/nap-tien-thanh-cong/"+username+"/"+sotien;
        	out.println(
        			"<input id=\"sotien\" name=\"sotien\" value=\""+sotien+"\" style=\"display:none\">"+
        			"<input id=\"id_user\" name=\"id_user\" value=\""+id_user+"\" style=\"display:none\">"+
        			"<a  style=\"margin-left: 100px\" target=\"_blank\" href=\"https://www.nganluong.vn/button_payment.php?receiver=leekhaia3@gmail.com&product_name=("+id_user+")&price=("+sotien+")&return_url=("+urlThanhCong+")&comments=(Ghi chú về đơn hàng)\"><img src=\"https://www.nganluong.vn/css/newhome/img/button/safe-pay-3.png\"border=\"0\" /></a><br>"
        			);
	                 
	}	
	
	
	@RequestMapping(value="/tai-khoan-gia-su-{id_user}", method=RequestMethod.GET)
	public String taikhoangiasu(@PathVariable("id_user") int id_user,ModelMap modelMap, HttpSession session){
		modelMap.addAttribute("GiaSu", userDAO.getItem(id_user));
		modelMap.addAttribute("t2", lichlamviecDAO.getList(id_user,2));
		modelMap.addAttribute("t3", lichlamviecDAO.getList(id_user,3));
		modelMap.addAttribute("t4", lichlamviecDAO.getList(id_user,4));
		modelMap.addAttribute("t5", lichlamviecDAO.getList(id_user,5));
		modelMap.addAttribute("t6", lichlamviecDAO.getList(id_user,6));
		modelMap.addAttribute("t7", lichlamviecDAO.getList(id_user,7));
		modelMap.addAttribute("cn", lichlamviecDAO.getList(id_user,8));
		modelMap.addAttribute("listDKM", dangkyDAO.getListDKM());
		modelMap.addAttribute("listPhuHuynh", userDAO.getListPhuHuynh());
		modelMap.addAttribute("index", "index");
		return "giasu.chitiet.giasu";
	}
	
	@RequestMapping(value="/xoa/{id_tkb}", method=RequestMethod.GET)
	public String taikhoangiasu(@PathVariable("id_tkb") int id_tkb,ModelMap modelMap){
		lichlamviecDAO.delTKB(id_tkb);
		return "redirect:/giasu/tai-khoan-gia-su?msg=deletetkb";
	}
	
	@RequestMapping(value="/chatbox", method=RequestMethod.GET)
	public String chatbox(ModelMap modelMap){
		modelMap.addAttribute("chat", "chat");
		return "giasu.chatbox";
	}
	
	@ResponseBody
	@RequestMapping(value="/tu-choi", method=RequestMethod.POST)
	public void tuchoi(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		PrintWriter out = response.getWriter();
		out.println(	 
				 "<textarea  class=\"password required form-control\" id=\"lido\"  name=\"lido\" placeholder=\"lí do .... \" rows=\"4\" style=\"border:1px solid;-moz-border-radius: 10px;-webkit-border-radius: 5px;font-family: arial;width: 55%; margin-left: 20%; margin-top: 3%\"></textarea>"+
			      "<div class=\"form-group\">"+
	                    "<input type=\"submit\" class=\"btn btn-primary btn-lg1 btn-block\" onclick=\"return getLiDo()\" value=\"Send\" style=\"width: 20%; margin-left: 37%; margin-top: 1%; margin-bottom: 1%\">"+
                 "</div>"
		 );
	}	
	
	@ResponseBody
	@RequestMapping(value="/li-do", method=RequestMethod.POST)
	public void lido(HttpServletRequest request, HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		int id_phuhuynh = Integer.parseInt(request.getParameter("id_phuhuynh"));
		int id_thongbao = Integer.parseInt(request.getParameter("id_thongbao"));
		int id_giasu = Integer.parseInt(request.getParameter("id_giasu"));
		String name_giasu = userDAO.getItem(id_giasu).getFullname();
		String name_phuhuynh = new String(request.getParameter("name_phuhuynh"));
		String lido = new String(request.getParameter("lido"));
        	thongbaodao.ThongBaoTuChoi(id_phuhuynh,id_phuhuynh, name_giasu, name_phuhuynh, lido);
        	thongbaodao.delItem(id_thongbao);
        	out.println(	 
   				 "<h4 style=\"color: red; font-family: arial; margin-left: 41%\"><b>Ä�Ã£ gá»Ÿi !</b></h4>"
   		 );
        	
	}	
	
	@RequestMapping(value="/dong-y", method=RequestMethod.POST)
	public String dongy(ModelMap modelMap, HttpServletRequest request){
		int id_phuhuynh = Integer.parseInt(request.getParameter("id_phuhuynh"));
		int id_giasu = Integer.parseInt(request.getParameter("id_giasu"));
		int id_thongbao = Integer.parseInt(request.getParameter("id_thongbao"));
		String name_giasu = userDAO.getItem(id_giasu).getFullname();
		String name_phuhuynh = new String(request.getParameter("name_phuhuynh"));
        if(userDAO.getListketNoi(id_phuhuynh, id_giasu).size() == 0){
        	thongbaodao.KetNoi(id_giasu, id_phuhuynh);
        }
		thongbaodao.ThongBaoDongY(id_giasu, id_phuhuynh, name_giasu, name_phuhuynh);
		thongbaodao.ThongBaoNhanDongY(id_phuhuynh, id_giasu, name_giasu, name_phuhuynh);
		int xugiasu = userDAO.getItem(id_giasu).getWebxu() - 10000;
		int xuphuhuynh = userDAO.getItem(id_giasu).getWebxu() - 10000;
		giasuDAO.editWebXu(id_giasu, xugiasu);
		thongbaodao.editChapNhan(id_thongbao);
		phuhuynhDAO.editWebXu(id_phuhuynh, xuphuhuynh);
		thongbaodao.delItem(id_thongbao);
		return "giasu.index";
	}
	
	@ResponseBody
	@RequestMapping(value="/check", method=RequestMethod.POST)
	public void checkbox(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		PrintWriter out = response.getWriter();
		int id_phuhuynh = Integer.parseInt(request.getParameter("id_phuhuynh"));
		User GiaSuInfo = (User) session.getAttribute("GiaSuInfo");
		int id_giasu = GiaSuInfo.getId_user();
		int id_ketnoi = chatdao.getKetNoi(id_giasu, id_phuhuynh).getId_ketnoi();
        if(chatdao.getChuaDocPH(id_ketnoi).size()!=0){
		out.println(	 
      		  "<input value=\""+id_ketnoi+"\" id=\"id_ketnoi\" style=\"display: none;\"/>"
		 );
        }else{
        	out.println("");
        }
	}	
	
	
	@ResponseBody
	@RequestMapping(value="/check-online", method=RequestMethod.POST)
	public void online(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		PrintWriter out = response.getWriter();
		User GiaSuInfo = (User) session.getAttribute("GiaSuInfo");
		int id_giasu = GiaSuInfo.getId_user();
		ArrayList<KetNoi> listKetNoi = (ArrayList<KetNoi>) userDAO.getListketNoiGS(id_giasu);
		ArrayList<User> listPhuHuynh = new ArrayList<>();
		for(KetNoi objKN: listKetNoi){
			listPhuHuynh.add(userDAO.getItem(objKN.getId_phuhuynh()));
		}
		
		for (User objPH: listPhuHuynh) {
			String urlPicPH = request.getContextPath()+"/files/"+objPH.getPicture();
			if(objPH.getOnline()==1){
			out.println(
			"<div class=\"lv-item media\" id=\""+objPH.getId_user()+"\" style=\"margin-left: 7%; margin-bottom: 5%\">"+
			"<div class=\"lv-avatar pull-left\">"+
				"<img src=\""+urlPicPH+"\">"+
			"</div>"+
		"<div class=\"media-body\" style=\"margin-top: 4%\">"+
				"<div class=\"lv-title\"><b>"+objPH.getFullname()+"</b><span style=\"margin-left: 8px; position: absolute; margin-top: 8px; width: 8px; height: 8px; line-height: 8px; border-radius: 50%; background-color: #80d3ab;\"></span></div>"+
			"</div>"+
		"</div>"
					);
			}else{
				out.println(
				"<div class=\"lv-item media\" id=\""+objPH.getId_user()+"\" style=\"margin-left: 7%; margin-bottom: 5%\">"+
						"<div class=\"lv-avatar pull-left\">"+
							"<img src=\""+urlPicPH+"\">"+
						"</div>"+
					"<div class=\"media-body\" style=\"margin-top: 4%\">"+
							"<div class=\"lv-title\"><b>"+objPH.getFullname()+"</b></div>"+
						"</div>"+
					"</div>"
						);
			}
		}
			
}
	
	@ResponseBody
	@RequestMapping(value="/changebox", method=RequestMethod.POST)
	public void changebox(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		PrintWriter out = response.getWriter();
		int id_phuhuynh = Integer.parseInt(request.getParameter("id_phuhuynh"));
		User GiaSuInfo = (User) session.getAttribute("GiaSuInfo");
		int id_giasu = GiaSuInfo.getId_user();
		User PhuHuynh = userDAO.getItem(id_phuhuynh);
		String urlPicPH = request.getContextPath()+"/files/"+PhuHuynh.getPicture();
		int id_ketnoi = chatdao.getKetNoi(id_giasu, id_phuhuynh).getId_ketnoi();
		ArrayList<Chat> listChat = (ArrayList<Chat>) chatdao.getList(id_ketnoi);
		chatdao.editTrangthaiPH(id_ketnoi);
		for(Chat obj: listChat){
			if(obj.getRole().equals("PHUHUYNH")){
				out.println(
						"<div class=\"lv-item media\" style=\"margin-top:-2%\">"+
						"<div class=\"lv-avatar pull-left\">"+
							"<img src=\""+urlPicPH+"\">"+
						"</div>"+
						"<div class=\"media-body\">"+
							"<div class=\"ms-item\">"+
								"<span class=\"glyphicon glyphicon-triangle-left\" style=\"color: #000000;\">"+"</span>"+ 
							obj.getNoidung()+
							"</div>"+
							"<small class=\"ms-date\"><span class=\"glyphicon glyphicon-time\">"+"</span>&nbsp;"+obj.getTime()+"</small>"+
						"</div>"+
						"</div>"
						 );
	          }else{
	        	  out.println(
	        	  "<div class=\"lv-item media right\" style=\"margin-top:-2%\">"+
					"<div class=\"media-body\">"+
						"<div class=\"ms-item\">"+obj.getNoidung()+
						"</div>"+
						"<small class=\"ms-date\"><span class=\"glyphicon glyphicon-time\">"+"</span>&nbsp;"+obj.getTime()+"</small>"+
					"</div>"+
					"</div>"
	        			  );
	          }
			
}
		out.println(	 
      		  "<input value=\""+id_phuhuynh+"\" id=\"id_phuhuynh\" style=\"display: none;\"/>"
		 );
	}	
	
	
	@ResponseBody
	@RequestMapping(value="/sendBox", method=RequestMethod.POST)
	public void sendBox(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		PrintWriter out = response.getWriter();
		User GiaSuInfo = (User) session.getAttribute("GiaSuInfo");
		int id_giasu = GiaSuInfo.getId_user();
		int id_phuhuynh = Integer.parseInt(request.getParameter("id_phuhuynh"));
		int id_ketnoi = chatdao.getKetNoi(id_giasu, id_phuhuynh).getId_ketnoi();
		User PhuHuynh = userDAO.getItem(id_phuhuynh);
		String urlPicPH = request.getContextPath()+"/files/"+PhuHuynh.getPicture();
		String noidung = new String(request.getParameter("noidung"));
		if(!noidung.equals("")){
	    Date dNow = new Date(System.currentTimeMillis());
	    SimpleDateFormat ft = new SimpleDateFormat(" 'lúc' hh:mm a 'ngày' dd/MM/yyyy");
	    String time = ft.format(dNow);
		Chat objItem = new Chat(0, id_ketnoi, noidung, "GiaSu",time, 0);
		chatdao.addItem(objItem);
		}
		ArrayList<Chat> listChat = (ArrayList<Chat>) chatdao.getList(id_ketnoi);
		chatdao.editTrangthaiPH(id_ketnoi);
		for(Chat obj: listChat){
			if(obj.getRole().equals("PHUHUYNH")){
				out.println(
						"<div class=\"lv-item media\" style=\"margin-top:-2%\">"+
						"<div class=\"lv-avatar pull-left\">"+
							"<img src=\""+urlPicPH+"\">"+
						"</div>"+
						"<div class=\"media-body\">"+
							"<div class=\"ms-item\">"+
								"<span class=\"glyphicon glyphicon-triangle-left\" style=\"color: #000000;\">"+"</span>"+ 
							obj.getNoidung()+
							"</div>"+
							"<small class=\"ms-date\"><span class=\"glyphicon glyphicon-time\">"+"</span>&nbsp;"+obj.getTime()+"</small>"+
						"</div>"+
						"</div>"
						 );
	          }else{
	        	  out.println(
	        	  "<div class=\"lv-item media right\" style=\"margin-top:-2%\">"+
					"<div class=\"media-body\">"+
						"<div class=\"ms-item\">"+obj.getNoidung()+
						"</div>"+
						"<small class=\"ms-date\"><span class=\"glyphicon glyphicon-time\">"+"</span>&nbsp;"+obj.getTime()+"</small>"+
					"</div>"+
					"</div>"
	        			  );
	          }
			out.println(	 
	        		  "<input value=\""+id_phuhuynh+"\" id=\"id_phuhuynh\" style=\"display: none;\"/>"
			 );
	}
	}
	
	@ResponseBody
	@RequestMapping(value="/lapBox", method=RequestMethod.POST)
	public void lapBox(HttpServletRequest request, HttpServletResponse response) throws IOException{
		int id_ketnoi = Integer.parseInt(request.getParameter("id_ketnoi"));
		PrintWriter out = response.getWriter();
		int id_phuhuynh =userDAO.getItemKetNoi(id_ketnoi).getId_phuhuynh();
		User PhuHuynh = userDAO.getItem(id_phuhuynh);
		String urlPicPH = request.getContextPath()+"/files/"+PhuHuynh.getPicture();
		ArrayList<Chat> listChat = (ArrayList<Chat>) chatdao.getList(id_ketnoi);
		chatdao.editTrangthaiPH(id_ketnoi);
		for(Chat obj: listChat){
			if(obj.getRole().equals("PHUHUYNH")){
				out.println(
						"<div class=\"lv-item media\" style=\"margin-top:-2%\">"+
						"<div class=\"lv-avatar pull-left\">"+
							"<img src=\""+urlPicPH+"\">"+
						"</div>"+
						"<div class=\"media-body\">"+
							"<div class=\"ms-item\">"+
								"<span class=\"glyphicon glyphicon-triangle-left\" style=\"color: #000000;\">"+"</span>"+ 
							obj.getNoidung()+
							"</div>"+
							"<small class=\"ms-date\"><span class=\"glyphicon glyphicon-time\">"+"</span>&nbsp;"+obj.getTime()+"</small>"+
						"</div>"+
						"</div>"
						 );
	          }else{
	        	  out.println(
	        	  "<div class=\"lv-item media right\" style=\"margin-top:-2%\">"+
					"<div class=\"media-body\">"+
						"<div class=\"ms-item\">"+obj.getNoidung()+
						"</div>"+
						"<small class=\"ms-date\"><span class=\"glyphicon glyphicon-time\">"+"</span>&nbsp;"+obj.getTime()+"</small>"+
					"</div>"+
					"</div>"
	        			  );
	          }
			out.println(	 
	        		  "<input value=\""+id_phuhuynh+"\" id=\"id_phuhuynh\" style=\"display: none;\"/>"
			 );
	}
	}
	
	@RequestMapping(value="/bai-viet", method=RequestMethod.GET)
	public String baiviet(ModelMap modelMap){
		modelMap.addAttribute("listBaiViet", baivietDAO.getListBV());
		return "giasu.baiviet";
	}
	
	@RequestMapping(value="/tim-kiem-gia-su", method=RequestMethod.POST)
	public String Sualich(ModelMap modelMap, HttpServletRequest request){
		int id_lop = Integer.parseInt(request.getParameter("id_lop"));
		int id_quanhuyen = Integer.parseInt(request.getParameter("id_quanhuyen"));
		int id_mon = Integer.parseInt(request.getParameter("id_mon"));
		ArrayList<DangKyMon> listDK = (ArrayList<DangKyMon>) dangkyDAO.getListTimKiemGiaSu(id_lop, id_quanhuyen, id_mon);
		ArrayList<User> listTimKiem = new ArrayList<>();
		for(DangKyMon objdk: listDK){
			listTimKiem.add(userDAO.getItem(objdk.getId_user()));
		}
		modelMap.addAttribute("listTimKiem", listTimKiem);
		modelMap.addAttribute("listDKM", dangkyDAO.getListDKM());
		modelMap.addAttribute("lop", dangkyDAO.getLop(id_lop));
		modelMap.addAttribute("mon", dangkyDAO.getMon(id_mon));
		modelMap.addAttribute("quanhuyen", dangkyDAO.getQuanHuyen(id_quanhuyen));
		return "giasu.list.timkiem";
	}
	
	@RequestMapping(value="/sua-lich-lam-viec/{id_thu}-{id_tkb}", method=RequestMethod.GET)
	public String Sualich(@PathVariable("id_tkb") int id_tkb, @PathVariable("id_thu") int id_thu,ModelMap modelMap){
			modelMap.addAttribute("id_thu", id_thu);
			modelMap.addAttribute("objTKB", lichlamviecDAO.getobjSUA(id_tkb));
		return "giasu.lich.sua";
	}
	

	
	@RequestMapping(value="/sua-lich/{id_tkb}-{id_thu}", method=RequestMethod.POST)
	public String sualich(@PathVariable("id_tkb") int id_tkb ,@PathVariable("id_thu") int id_thu ,ModelMap modelMap,HttpServletRequest request, HttpSession session){
		User GiaSuInfo = (User) session.getAttribute("GiaSuInfo");
		int id_user = GiaSuInfo.getId_user();
		String diadiem = new String(request.getParameter("diadiem"));
		String noidung = new String(request.getParameter("noidung"));
		int id_phuhuynh = Integer.parseInt(request.getParameter("id_phuhuynh"));
		int giodau = Integer.parseInt(request.getParameter("giodau"));
		int giocuoi = Integer.parseInt(request.getParameter("giocuoi"));
		  if(giodau>giocuoi){
			   modelMap.addAttribute("id_thu", id_thu);
			   modelMap.addAttribute("eror","eror");
			   modelMap.addAttribute("objTKB", lichlamviecDAO.getobjSUA(id_tkb));
			   return "giasu.lich.sua";
		   }else{
		int phutdau = Integer.parseInt(request.getParameter("phutdau"));
		int phutcuoi = Integer.parseInt(request.getParameter("phutcuoi"));
		LichLamViec objTKB =  new LichLamViec(id_tkb, id_thu, id_user, id_phuhuynh, giodau, giocuoi, phutdau, phutcuoi, noidung,diadiem);
		ArrayList<LichLamViec> listTKB = (ArrayList<LichLamViec>) lichlamviecDAO.getList(id_user, id_thu);
		for(LichLamViec obj: listTKB){
		 if(obj.getId_tkb() != id_tkb){	
		 
		   if((obj.getGiodau()<giodau && giodau<obj.getGiocuoi()) || (obj.getGiodau()<giocuoi && giocuoi<obj.getGiocuoi() || (obj.getGiodau()>giodau && obj.getGiocuoi()<giocuoi) || (obj.getGiodau()==giodau && obj.getGiocuoi()==giocuoi) || (obj.getGiocuoi()==giodau && obj.getPhutcuoi()==30) || (obj.getGiocuoi()==giocuoi && obj.getPhutcuoi()==30 && obj.getGiodau()>giodau)|| (obj.getGiocuoi()==giocuoi && obj.getPhutcuoi()==30 && obj.getGiodau()>giodau))){
			   modelMap.addAttribute("objTKBtrung", obj);
			   modelMap.addAttribute("phuhuynh",  userDAO.getItem(obj.getId_phuhuynh()));
			   modelMap.addAttribute("msg", "msg");
			   modelMap.addAttribute("id_thu", id_thu);
			   modelMap.addAttribute("objTrung", objTKB);
			   return "giasu.lich.sua";
		    }
		}
		}
		if (lichlamviecDAO.editLich(objTKB)> 0){
			return "redirect:/giasu/tai-khoan-gia-su?msg=edit";
		}else{
			return "redirect:/giasu/them-lich-lam-viec-thu?msg=nonedit";
	}
	}	
}
	@RequestMapping(value="/them-lich-lam-viec-thu/{id}", method=RequestMethod.GET)
	public String lich(@PathVariable("id") int id, ModelMap modelMap){
			modelMap.addAttribute("id_thu", id);
		return "giasu.lich";
	}
	
	@RequestMapping(value="/them-lich/{id}", method=RequestMethod.POST)
	public String themlich(@PathVariable("id") int id, ModelMap modelMap,HttpServletRequest request, HttpSession session){
		User GiaSuInfo = (User) session.getAttribute("GiaSuInfo");
		int id_user = GiaSuInfo.getId_user();
		String diadiem = new String(request.getParameter("diadiem"));
		String noidung = new String(request.getParameter("noidung"));
		int id_thu = Integer.parseInt(request.getParameter("id_thu"));
		int id_giasu = Integer.parseInt(request.getParameter("id_giasu"));
		int id_phuhuynh = Integer.parseInt(request.getParameter("id_phuhuynh"));
		int giodau = Integer.parseInt(request.getParameter("giodau"));
		int giocuoi = Integer.parseInt(request.getParameter("giocuoi"));
		  if(giodau>giocuoi){
			   modelMap.addAttribute("id_thu", id_thu);
			   modelMap.addAttribute("eror","eror");
			   return "giasu.lich";
		   }else{
		int phutdau = Integer.parseInt(request.getParameter("phutdau"));
		int phutcuoi = Integer.parseInt(request.getParameter("phutcuoi"));
		LichLamViec objTKB =  new LichLamViec(0, id_thu, id_giasu, id_phuhuynh, giodau, giocuoi, phutdau, phutcuoi, noidung,diadiem);
		ArrayList<LichLamViec> listTKB = (ArrayList<LichLamViec>) lichlamviecDAO.getList(id_user, id_thu);
		for(LichLamViec obj: listTKB){
		   if((obj.getGiodau()<giodau && giodau<obj.getGiocuoi()) || (obj.getGiodau()<giocuoi && giocuoi<obj.getGiocuoi() || (obj.getGiodau()>giodau && obj.getGiocuoi()<giocuoi) || (obj.getGiodau()==giodau && obj.getGiocuoi()==giocuoi) || (obj.getGiocuoi()==giodau && obj.getPhutcuoi()==30) || (obj.getGiocuoi()==giocuoi && obj.getPhutcuoi()==30 && obj.getGiodau()>giodau) || (giodau>giocuoi))){
			   modelMap.addAttribute("objTKBtrung", obj);
			   modelMap.addAttribute("phuhuynh",  userDAO.getItem(obj.getId_phuhuynh()));
			   modelMap.addAttribute("msg", "msg");
			   modelMap.addAttribute("id_thu", id_thu);
			   modelMap.addAttribute("objTrung", objTKB);
			   return "giasu.lich";
		    }
		}
		if (lichlamviecDAO.addItem(objTKB)> 0){
			return "redirect:/giasu/tai-khoan-gia-su?msg=add";
		}else{
			return "redirect:/giasu/them-lich-lam-viec-thu?msg=nonadd";
	}	
		   }
	}
	@RequestMapping(value="/chi-tiet-bai-viet/{slug}-{id}", method=RequestMethod.GET)
	public String detail(@PathVariable("id") int id , ModelMap modelMap){
		modelMap.addAttribute("listBinhLuan", binhluanDAO.getbinhluan(id));
		modelMap.addAttribute("itemNews", baivietDAO.getItem(id));
		modelMap.addAttribute("id_baiviet", id);
		return "giasu.chitiet.baiviet";
	}
	
	@RequestMapping(value="/huong-dan-su-dung-website", method=RequestMethod.GET)
	public String huongdan(){
		return "public.huongdan";
	}
	
	@RequestMapping(value="/danh-sach-gia-su", method=RequestMethod.GET)
	public String danhsach(){
		return "public.list.giasu";
	}
	
	@RequestMapping(value="/tai-khoan-gia-su", method=RequestMethod.GET)
	public String taikhoangiasu(ModelMap modelMap, HttpSession session){
		User GiaSuInfo = (User) session.getAttribute("GiaSuInfo");
		int id_user = GiaSuInfo.getId_user();
		modelMap.addAttribute("GiaSu", userDAO.getItem(id_user));
		modelMap.addAttribute("t2", lichlamviecDAO.getList(id_user,2));
		modelMap.addAttribute("t3", lichlamviecDAO.getList(id_user,3));
		modelMap.addAttribute("t4", lichlamviecDAO.getList(id_user,4));
		modelMap.addAttribute("t5", lichlamviecDAO.getList(id_user,5));
		modelMap.addAttribute("t6", lichlamviecDAO.getList(id_user,6));
		modelMap.addAttribute("t7", lichlamviecDAO.getList(id_user,7));
		modelMap.addAttribute("cn", lichlamviecDAO.getList(id_user,8));
		modelMap.addAttribute("listPhuHuynh", userDAO.getListPhuHuynh());
		modelMap.addAttribute("listBinhLuanGiaSu", binhluanGSDAO.getListBLGS(id_user));
		return "giasu.chitiet";
	}
	
	@RequestMapping(value="/sua-tai-khoan", method=RequestMethod.GET)
	public String suataikhoangiasu(ModelMap modelMap, HttpSession session){
		User GiaSuInfo = (User) session.getAttribute("GiaSuInfo");
		int id_user = GiaSuInfo.getId_user();
		modelMap.addAttribute("GiaSu", userDAO.getItem(id_user));
		return "giasu.suataikhoan";
	}
	
	@RequestMapping(value="/suaGiaSu", method=RequestMethod.POST)	
	public String addLienHe(HttpServletRequest request, HttpServletResponse response, @RequestParam("file") CommonsMultipartFile multipartFile, HttpSession session) throws IOException{	
		String fullname = new String(request.getParameter("fullname"));
		String phone = new String(request.getParameter("phone"));
		String sonamkinhnghiem1 = new String(request.getParameter("sonamkinhnghiem"));
		int sonamkinhnghiem = Integer.parseInt(sonamkinhnghiem1);
		String diachi = new String(request.getParameter("diachi"));
		String gioithieubanthan = new String(request.getParameter("gioithieubanthan"));
		User GiaSuInfo = (User) session.getAttribute("GiaSuInfo");
		int id_user = GiaSuInfo.getId_user();
		User obj = userDAO.getItem(id_user);
		User objItem = new User(id_user, fullname, "", "", diachi, 1, phone, "", "", 1, "", 1, "", 1, 1, sonamkinhnghiem, gioithieubanthan);
		
		String fileName = multipartFile.getOriginalFilename();
          
		if (!fileName.isEmpty()) {
			String dirPath = request.getServletContext().getRealPath("files");
			String filePath = dirPath + File.separator + fileName;
			System.out.println(filePath);
			File file = new File(filePath);
			try {
				multipartFile.transferTo(file);
				System.out.println("up file thÃ nh cÃ´ng ");
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			objItem.setPicture(fileName);
			//xÃ³a hÃ¬nh cÅ©
			
			if(!obj.getPicture().equals("")) {
				String fileOld = dirPath + File.separator + obj.getPicture();
				File old = new File(fileOld);
				if (!old.exists())
				old.delete();
			}
		} else {
			objItem.setPicture(obj.getPicture());
		}
	
		if (userDAO.editGiaSu(objItem)> 0){
			return "redirect:/giasu/tai-khoan-gia-su?msg=edit";
		}else{
			return "redirect:/giasu/sua-tai-khoan/edit?msg=nonedit";
	}
		
	}
	
	
	
	@RequestMapping(value="/thong-bao", method=RequestMethod.GET)
	public String thongbao(){
		return "giasu.thongbao";
	}
	
	@RequestMapping(value="/giasu-logout", method=RequestMethod.POST)
	public String logout(HttpSession session, ModelMap modelMap){
		User GiaSuInfo = (User) session.getAttribute("GiaSuInfo");
		chatdao.onlineDX(GiaSuInfo.getId_user());
		session.removeAttribute("GiaSuInfo");
		modelMap.clear();
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/edit-da-doc", method=RequestMethod.POST)
	public void editDaDoc(HttpSession session,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		User GiaSuInfo = (User) session.getAttribute("GiaSuInfo");
		int id_user = GiaSuInfo.getId_user();
		thongbaodao.editdAdOC(id_user);
		out.print("");
	}
	
	
	@RequestMapping(value="/dang-ky-day", method=RequestMethod.POST)	
	public void dkday(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		 PrintWriter out = response.getWriter();
		User GiaSuInfo = (User) session.getAttribute("GiaSuInfo");
		String check="";
		int id_user = GiaSuInfo.getId_user();
		int id_quanhuyen = GiaSuInfo.getId_quanhuyen();
		String mon1 = new String(request.getParameter("mon1"));
		String lop1 = new String(request.getParameter("lop1"));
		
		if(!mon1.equals("") && !lop1.equals("") && dangkyDAO.getListDangKy(id_user,1).size()!=0){
			int id_mon1 = Integer.parseInt(mon1);
			int id_lop1 = Integer.parseInt(lop1);
			String dk_lop = dangkyDAO.getMon(id_mon1).getDk_lop();
			String[] listid_Lop=dk_lop.split(",");
			int n = listid_Lop.length-1;
			
			for(int i=0; i<n+1; i++){
				int id=Integer.parseInt(listid_Lop[i]);
				if(id==id_lop1){
					 dangkyDAO.editDangKy(id_mon1, id_lop1, id_user, 1);
					break;
				}else{
					if(n==i){
						out.print("<h4 style=\"margin-left: 26%; color:red;font-family: arial\"><b>Bạn chọn"+dangkyDAO.getMon(id_mon1).getName_mon()+" "+dangkyDAO.getLop(id_lop1).getLop()+" là không phù hợp !</b></h4>");
						check="erorr";
					}
				}
			}
		   
		}else{
			if(!mon1.equals("") && !lop1.equals("")){
			int id_mon1 = Integer.parseInt(mon1);
			int id_lop1 = Integer.parseInt(lop1);
			String dk_lop = dangkyDAO.getMon(id_mon1).getDk_lop();
			String[] listid_Lop=dk_lop.split(",");
			int n = listid_Lop.length-1;
			
			for(int i=0; i<n+1; i++){
				int id=Integer.parseInt(listid_Lop[i]);
				if(id==id_lop1){
					dangkyDAO.addDangKy(id_mon1, id_lop1, id_quanhuyen, id_user,1);
					break;
				}else{
					if(n==i){
						out.print("<h4 style=\"margin-left: 26%; color:red;font-family: arial\"><b>Bạn chọn "+dangkyDAO.getMon(id_mon1).getName_mon()+" "+dangkyDAO.getLop(id_lop1).getLop()+" là không phù hợp !</b></h4>");
						check="erorr";
					}
				}
			}
			
		   }
		}
		
		String mon2 = new String(request.getParameter("mon2"));
		String lop2 = new String(request.getParameter("lop2"));
		
		if(!mon2.equals("") && !lop2.equals("") && dangkyDAO.getListDangKy(id_user,2).size()!=0){
			int id_mon2 = Integer.parseInt(mon2);
			int id_lop2 = Integer.parseInt(lop2);
			
			String dk_lop = dangkyDAO.getMon(id_mon2).getDk_lop();
			String[] listid_Lop=dk_lop.split(",");
			int n = listid_Lop.length-1;
			
			for(int i=0; i<n+1; i++){
				int id=Integer.parseInt(listid_Lop[i]);
				if(id==id_lop2){
					dangkyDAO.editDangKy(id_mon2, id_lop2, id_user, 2);
					break;
				}else{
					if(n==i){
						out.print("<h4 style=\"margin-left: 26%; color:red;font-family: arial\"><b>Bạn chọn"+dangkyDAO.getMon(id_mon2).getName_mon()+" "+dangkyDAO.getLop(id_lop2).getLop()+" là không phù hợp !</b></h4>");
						check="erorr";
					}
				}
			}
		    
		}else{
			if(!mon2.equals("") && !lop2.equals("")){
			int id_mon2 = Integer.parseInt(mon2);
			int id_lop2 = Integer.parseInt(lop2);
			String dk_lop = dangkyDAO.getMon(id_mon2).getDk_lop();
			String[] listid_Lop=dk_lop.split(",");
			int n = listid_Lop.length-1;
			
			for(int i=0; i<n+1; i++){
				int id=Integer.parseInt(listid_Lop[i]);
				if(id==id_lop2){
					dangkyDAO.addDangKy(id_mon2, id_lop2, id_quanhuyen, id_user,2);
					break;
				}else{
					if(n==i){
						out.print("<h4 style=\"margin-left: 26%; color:red;font-family: arial\"><b>Bạn chọn "+dangkyDAO.getMon(id_mon2).getName_mon()+" "+dangkyDAO.getLop(id_lop2).getLop()+" là không phù hợp !</b></h4>");
						check="erorr";
					}
				}
			}
			
		   }
		}
		
		String mon3 = new String(request.getParameter("mon3"));
		String lop3 = new String(request.getParameter("lop3"));
		
		if(!mon3.equals("") && !lop3.equals("") && dangkyDAO.getListDangKy(id_user,3).size()!=0){
			int id_mon3 = Integer.parseInt(mon3);
			int id_lop3 = Integer.parseInt(lop3);
			String dk_lop = dangkyDAO.getMon(id_mon3).getDk_lop();
			String[] listid_Lop=dk_lop.split(",");
			int n = listid_Lop.length-1;
			
			for(int i=0; i<n+1; i++){
				int id=Integer.parseInt(listid_Lop[i]);
				if(id==id_lop3){
					dangkyDAO.editDangKy(id_mon3, id_lop3, id_user, 3);
					break;
				}else{
					if(n==i){
						out.print("<h4 style=\"margin-left: 26%; color:red;font-family: arial\"><b>Bạn chọn"+dangkyDAO.getMon(id_mon3).getName_mon()+" "+dangkyDAO.getLop(id_lop3).getLop()+" là không phù hợp !</b></h4>");
						check="erorr";
					}
				}
			}
		    
		}else{
			if(!mon3.equals("") && !lop3.equals("")){
			int id_mon3 = Integer.parseInt(mon3);
			int id_lop3 = Integer.parseInt(lop3);
			String dk_lop = dangkyDAO.getMon(id_mon3).getDk_lop();
			String[] listid_Lop=dk_lop.split(",");
			int n = listid_Lop.length-1;
			
			for(int i=0; i<n+1; i++){
				int id=Integer.parseInt(listid_Lop[i]);
				if(id==id_lop3){
					dangkyDAO.addDangKy(id_mon3, id_lop3, id_quanhuyen, id_user,3);
					break;
				}else{
					if(n==i){
						out.print("<h4 style=\"margin-left: 26%; color:red;font-family: arial\"><b>Bạn chọn"+dangkyDAO.getMon(id_mon3).getName_mon()+" "+dangkyDAO.getLop(id_lop3).getLop()+"  là không phù hợp !</b></h4>");
						check="erorr";
					}
				}
			}
			
		   }
		}
	if(check.equals("")){
		out.print("<h4 style=\"margin-left: 36%; color:#1E90FF;font-family: arial\"><b>Đăng ký thành công !!</b></h4>");
	}
	}
}
