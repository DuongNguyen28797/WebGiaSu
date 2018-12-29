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
import dao.ThongBaoDAO;
import dao.UserDAO;
import entities.BinhLuanGiaSu;
import entities.Chat;
import entities.DangKyMon;
import entities.KetNoi;
import entities.LuuGiaSu;
import entities.User;
import utils.SlugUtils;
import utils.Split;


@Controller
@RequestMapping(value="/phuhuynh", method=RequestMethod.GET)
public class PublicPhuHuynhController {
	@Autowired
	private Defines defines;	
	@Autowired
	private SlugUtils slugUtils;
	@Autowired
	private GiaSuDAO giasuDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private ChatDAO chatdao;
	@Autowired
	private DangKyDAO dangkyDAO;
	@Autowired
	private BaiVietDAO baivietDao;
	@Autowired
	private Split split;
	@Autowired
	private BinhLuanBaiVietDAO binhluanDAO;
	@Autowired
	private BaiVietDAO baivietDAO;
	@Autowired
	private LichLamViecDAO lichlamviecDAO;
	@Autowired
	private ThongBaoDAO thongbaoDAO;
	@Autowired
	private BinhLuanBaiVietDAO binhluanGSDAO;
	
	@ModelAttribute
	public void addCommons(ModelMap modelMap, HttpSession session){
		User PhuHuynhInfo = (User) session.getAttribute("PhuHuynhInfo");
		int id_user = PhuHuynhInfo.getId_user();
		ArrayList<LuuGiaSu> listLuu = (ArrayList<LuuGiaSu>) giasuDAO.getListLuu(id_user);
		ArrayList<User> listGS = new ArrayList<>();
		for(LuuGiaSu obj: listLuu){
			listGS.add(userDAO.getItem(obj.getId_giasu()));
		}
		modelMap.addAttribute("listGS", listGS);
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slugUtils", slugUtils);
		modelMap.addAttribute("split", split);
		modelMap.addAttribute("listQuanHuyen", dangkyDAO.getListQuanHuyen());
		modelMap.addAttribute("listMon", dangkyDAO.getListMon());
		modelMap.addAttribute("listLop", dangkyDAO.getListLop());
		modelMap.addAttribute("listThongBao", thongbaoDAO.getList(id_user));
		modelMap.addAttribute("sothongbao", thongbaoDAO.count(id_user));
		modelMap.addAttribute("listTatCaThongBao", thongbaoDAO.getListThongBao(id_user));
		modelMap.addAttribute("listGiaSu", userDAO.getListGiaSU());
	}
	@RequestMapping(value="", method=RequestMethod.GET)
	public String indexPhuHuynh(ModelMap modelMap){
		modelMap.addAttribute("listDKM", dangkyDAO.getListDKM());
		modelMap.addAttribute("listBaiViet", baivietDao.getListBaiViet());
		return "phuhuynh.index";
	}
	@ResponseBody
	@RequestMapping(value="/check", method=RequestMethod.POST)
	public void checkbox(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		PrintWriter out = response.getWriter();
		int id_giasu = Integer.parseInt(request.getParameter("id_giasu"));
		User PhuHuynhInfo = (User) session.getAttribute("PhuHuynhInfo");
		int id_phuhuynh = PhuHuynhInfo.getId_user();
		int id_ketnoi = chatdao.getKetNoi(id_giasu, id_phuhuynh).getId_ketnoi();
        if(chatdao.getChuaDocGS(id_ketnoi).size()!=0){
		out.println(	 
      		  "<input value=\""+id_ketnoi+"\" id=\"id_ketnoi\" style=\"display: none;\"/>"
		 );
        }else{
        	out.println("");
        }
	}	
	
	@ResponseBody
	@RequestMapping(value="/nap-tien", method=RequestMethod.POST)
	public void naptien(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		PrintWriter out = response.getWriter();
		int id_user = Integer.parseInt(request.getParameter("id_user"));
		int sotien = Integer.parseInt(request.getParameter("sotien"));
        	out.println(
        			"<a style=\"margin-left: 100px\" target=\"_blank\" href=\"https://www.nganluong.vn/button_payment.php?receiver=leekhaia3@gmail.com&product_name=("+id_user+")&price=("+sotien+")&return_url=()&comments=(Ghi chú đơn hàng)\"><img src=\"https://www.nganluong.vn/css/newhome/img/button/safe-pay-3.png\"border=\"0\" /></a><br>");
	}	
	
	@RequestMapping(value="/chatbox", method=RequestMethod.GET)
	public String chatbox(ModelMap modelMap, HttpSession session){
		User PhuHuynhInfo = (User) session.getAttribute("PhuHuynhInfo");
		int id_phuhuynh = PhuHuynhInfo.getId_user();
		ArrayList<KetNoi> listKetNoi = (ArrayList<KetNoi>) userDAO.getListketNoiPH(id_phuhuynh);
		ArrayList<User> listGiaSu = new ArrayList<>();
		for(KetNoi objKN: listKetNoi){
			listGiaSu.add(userDAO.getItem(objKN.getId_giasu()));
		}
		modelMap.addAttribute("chat", "chat");
		modelMap.addAttribute("listGiaSu", listGiaSu);
		return "phuhuynh.chatbox";
	}
	@ResponseBody
	@RequestMapping(value="/check-online", method=RequestMethod.POST)
	public void online(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		PrintWriter out = response.getWriter();
		User PhuHuynhInfo = (User) session.getAttribute("PhuHuynhInfo");
		int id_phuhuynh = PhuHuynhInfo.getId_user();
		ArrayList<KetNoi> listKetNoi = (ArrayList<KetNoi>) userDAO.getListketNoiPH(id_phuhuynh);
		ArrayList<User> listGiaSu = new ArrayList<>();
		for(KetNoi objKN: listKetNoi){
			listGiaSu.add(userDAO.getItem(objKN.getId_giasu()));
		}
		
		for (User objGS: listGiaSu) {
			String urlPicGS = request.getContextPath()+"/files/"+objGS.getPicture();
			if(objGS.getOnline()==1){
			out.println(
			"<div class=\"lv-item media\" id=\""+objGS.getId_user()+"\" style=\"margin-left: 7%; margin-bottom: 5%\">"+
			"<div class=\"lv-avatar pull-left\">"+
				"<img src=\""+urlPicGS+"\">"+
			"</div>"+
		"<div class=\"media-body\" style=\"margin-top: 4%\">"+
				"<div class=\"lv-title\"><b>"+objGS.getFullname()+"</b><span style=\"margin-left: 8px; position: absolute; margin-top: 8px; width: 8px; height: 8px; line-height: 8px; border-radius: 50%; background-color: #80d3ab;\"></span></div>"+
			"</div>"+
		"</div>"
					);
			}else{
				out.println(
				"<div class=\"lv-item media\" id=\""+objGS.getId_user()+"\" style=\"margin-left: 7%; margin-bottom: 5%\">"+
						"<div class=\"lv-avatar pull-left\">"+
							"<img src=\""+urlPicGS+"\">"+
						"</div>"+
					"<div class=\"media-body\" style=\"margin-top: 4%\">"+
							"<div class=\"lv-title\"><b>"+objGS.getFullname()+"</b></div>"+
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
		int id_giasu = Integer.parseInt(request.getParameter("id_giasu"));
		User PhuHuynhInfo = (User) session.getAttribute("PhuHuynhInfo");
		int id_phuhuynh = PhuHuynhInfo.getId_user();
		User GiaSu = userDAO.getItem(id_giasu);
		String urlPicGS = request.getContextPath()+"/files/"+GiaSu.getPicture();
		int id_ketnoi = chatdao.getKetNoi(id_giasu, id_phuhuynh).getId_ketnoi();
		ArrayList<Chat> listChat = (ArrayList<Chat>) chatdao.getList(id_ketnoi);
		chatdao.editTrangthaiGS(id_ketnoi);
		for(Chat obj: listChat){
			if(obj.getRole().equals("GiaSu")){
				out.println(
						"<div class=\"lv-item media\" style=\"margin-top:-2%\">"+
								"<div class=\"lv-avatar pull-left\">"+
									"<img src=\""+urlPicGS+"\">"+
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
				"<input value=\""+id_giasu+"\" id=\"id_giasu\" style=\"display: none;\"/>"
		 );
	}	
	
	
	@ResponseBody
	@RequestMapping(value="/sendBox", method=RequestMethod.POST)
	public void sendBox(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		PrintWriter out = response.getWriter();
		User PhuHuynhInfo = (User) session.getAttribute("PhuHuynhInfo");
		int id_phuhuynh = PhuHuynhInfo.getId_user();
		int id_giasu = Integer.parseInt(request.getParameter("id_giasu"));
		int id_ketnoi = chatdao.getKetNoi(id_giasu, id_phuhuynh).getId_ketnoi();
		User GiaSu = userDAO.getItem(userDAO.getItemKetNoi(id_ketnoi).getId_giasu());
		String urlPicGS = request.getContextPath()+"/files/"+GiaSu.getPicture();
		String noidung = new String(request.getParameter("noidung"));
		if(!noidung.equals("")){
		    Date dNow = new Date(System.currentTimeMillis());
		    SimpleDateFormat ft = new SimpleDateFormat (" 'lÃºc' hh:mm a 'ngÃ y' dd/MM/yyyy");
		    String time = ft.format(dNow);
		Chat objItem = new Chat(0, id_ketnoi, noidung, "PHUHUYNH", time, 0);
		chatdao.addItem(objItem);
		}
		ArrayList<Chat> listChat = (ArrayList<Chat>) chatdao.getList(id_ketnoi);
		chatdao.editTrangthaiGS(id_ketnoi);
		for(Chat obj: listChat){
			if(obj.getRole().equals("GiaSu")){
				out.println(
						"<div class=\"lv-item media\" style=\"margin-top:-2%\">"+
								"<div class=\"lv-avatar pull-left\">"+
									"<img src=\""+urlPicGS+"\">"+
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
					 "<input value=\""+id_giasu+"\" id=\"id_giasu\" style=\"display: none;\"/>"
			 );
	}
	}
	
	@ResponseBody
	@RequestMapping(value="/lapBox", method=RequestMethod.POST)
	public void lapBox(HttpServletRequest request, HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		int id_ketnoi = Integer.parseInt(request.getParameter("id_ketnoi"));
		int id_giasu =userDAO.getItemKetNoi(id_ketnoi).getId_giasu();
		User GiaSu = userDAO.getItem(userDAO.getItemKetNoi(id_ketnoi).getId_giasu());
		String urlPicGS = request.getContextPath()+"/files/"+GiaSu.getPicture();
		ArrayList<Chat> listChat = (ArrayList<Chat>) chatdao.getList(id_ketnoi);
		chatdao.editTrangthaiGS(id_ketnoi);
		for(Chat obj: listChat){
			if(obj.getRole().equals("GiaSu")){
				out.println(
						"<div class=\"lv-item media\" style=\"margin-top:-2%\">"+
								"<div class=\"lv-avatar pull-left\">"+
									"<img src=\""+urlPicGS+"\">"+
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
	        		  "<input value=\""+id_giasu+"\" id=\"id_giasu\" style=\"display: none;\"/>"
			 );
	}
	}
	@ResponseBody
	@RequestMapping(value="/goi-loi-moi", method=RequestMethod.POST)
	public void denghi(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		int webxu = Integer.parseInt(request.getParameter("webxu"));
		if(webxu<10000){
			out.println(
					"<h5 style=\"color: red;margin-left: 65%; margin-top: -3%\">Báº¡n khÃ´ng Ä‘á»§ Web xu Ä‘á»ƒ gá»Ÿi lá»�i má»�i ! Báº¡n cáº§n náº¡p thÃªm web xu vÃ  lá»›n hÆ¡n 10.000 xu thÃ¬ má»›i thá»±c hiá»‡n Ä‘Æ°á»£c Ä‘áº§y Ä‘á»§ cÃ¡c chá»©c nÄƒng.</h5>"
					);
		}else{
			User PhuHuynhInfo = (User) session.getAttribute("PhuHuynhInfo");
			int id_user = PhuHuynhInfo.getId_user();
			int id_giasu = Integer.parseInt(request.getParameter("id_giasu"));
			String name_phuhuynh = new String(request.getParameter("name_phuhuynh"));
			thongbaoDAO.ThongBaoLoiMoi(id_giasu, id_user, name_phuhuynh);
			out.println(
					"<button  data-toggle=\"modal\" data-target=\"#login\" name=\"submit\" type=\"submit\" style=\"width: 100%;display: inline; font-family: arial;\">Ä�Ã£ gá»Ÿi lá»�i má»�i </button>"
		   );
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/danh-gia", method=RequestMethod.POST)
	public void login(HttpServletRequest request){
		int sosao = Integer.parseInt(request.getParameter("sosao"));
		int id_giasu = Integer.parseInt(request.getParameter("id_giasu"));
		int sobauchoncu = userDAO.getItem(id_giasu).getSobauchon();
		int sobauchon = sobauchoncu+sosao;
		giasuDAO.editSoBauChon(id_giasu, sobauchon);
	}
	
	@ResponseBody
	@RequestMapping(value="/luu-thong-tin", method=RequestMethod.POST)
	public void luu(HttpSession session,HttpServletRequest request){
		User PhuHuynhInfo = (User) session.getAttribute("PhuHuynhInfo");
		int id_user = PhuHuynhInfo.getId_user();
		int id_giasu = Integer.parseInt(request.getParameter("id_giasu"));
		if(giasuDAO.getLuu(id_giasu, id_user) == null){
		giasuDAO.luu(id_user, id_giasu);
		}
	}
	
	@RequestMapping(value="/edit-da-doc", method=RequestMethod.POST)
	public void editDaDoc(HttpSession session,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		User PhuHuynhInfo = (User) session.getAttribute("PhuHuynhInfo");
		int id_user = PhuHuynhInfo.getId_user();
		thongbaoDAO.editdAdOC(id_user);
		out.print("");
	}
	
	@RequestMapping(value="/tai-khoan-gia-su-{id_user}", method=RequestMethod.GET)
	public String taikhoangiasu(@PathVariable("id_user") int id_user,ModelMap modelMap, HttpSession session){
		User PhuHuynhInfo = (User) session.getAttribute("PhuHuynhInfo");
		int id_phuhuynh = PhuHuynhInfo.getId_user();
		modelMap.addAttribute("PhuHuynh", userDAO.getItem(id_phuhuynh));
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
		modelMap.addAttribute("listBinhLuanGiaSu", binhluanGSDAO.getListBLGS(id_user));
		if(userDAO.getListketNoi(id_phuhuynh, id_user).size()==1){
			modelMap.addAttribute("daketnoi", "daketnoi");
		}else{
			if(userDAO.getThongBaoGoiLoiMoi(id_phuhuynh, id_user).size()==1){
				modelMap.addAttribute("dagoiloimoi", "dagoiloimoi");
			}else{
					modelMap.addAttribute("ketnoi", "ketnoi");
				}
			}
		return "phuhuynh.chitiet.giasu";
	}
	@RequestMapping(value="/bai-viet", method=RequestMethod.GET)
	public String baiviet(ModelMap modelMap){
		modelMap.addAttribute("listBaiViet", baivietDAO.getListBV());
		return "phuhuynh.baiviet";
	}
	
	@RequestMapping(value="/huong-dan-su-dung-website", method=RequestMethod.GET)
	public String huongdan(){
		return "public.huongdan";
	}
	
	@RequestMapping(value="/chi-tiet-bai-viet/{slug}-{id}", method=RequestMethod.GET)
	public String detail(@PathVariable("id") int id , ModelMap modelMap){
		modelMap.addAttribute("listBinhLuan", binhluanDAO.getbinhluan(id));
		modelMap.addAttribute("itemNews", baivietDAO.getItem(id));
		modelMap.addAttribute("id_baiviet", id);
		return "phuhuynh.chitiet.baiviet";
	}
	
	@RequestMapping(value="/danh-sach-gia-su", method=RequestMethod.GET)
	public String danhsach(){
		return "public.list.giasu";
	}
	
	@RequestMapping(value="/sua-noi-dung", method=RequestMethod.GET)
	public String suaNoiDung(){
		return "phuhuynh.suanoidung";
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
		return "phuhuynh.list.timkiem";
	}
	
	
	@RequestMapping(value="/tai-khoan-phu-huynh", method=RequestMethod.GET)
	public String taikhoangiasu(HttpSession session, ModelMap modelMap){
		User PhuHuynhInfo = (User) session.getAttribute("PhuHuynhInfo");
		int id_user = PhuHuynhInfo.getId_user();
		modelMap.addAttribute("PhuHuynhInfo", userDAO.getItem(id_user));
		return "phuhuynh.chitiet";
	}
	
	@RequestMapping(value="/sua-tai-khoan", method=RequestMethod.GET)
	public String suataikhoangiasu(ModelMap modelMap, HttpSession session){
		User PhuHuynhInfo = (User) session.getAttribute("PhuHuynhInfo");
		int id_user = PhuHuynhInfo.getId_user();
		modelMap.addAttribute("PhuHuynh", userDAO.getItem(id_user));
		return "phuhuynh.suataikhoan";
	}
	
	@RequestMapping(value="/suaPhuHuynh", method=RequestMethod.POST)	
	public String suaPhuHuynh(HttpServletRequest request, HttpServletResponse response, @RequestParam("file") CommonsMultipartFile multipartFile, HttpSession session) throws IOException{	
		String fullname = new String(request.getParameter("fullname"));
		String phone = new String(request.getParameter("phone"));
		String email = new String(request.getParameter("email"));
		String diachi = new String(request.getParameter("diachi"));
		User PhuHuynhInfo = (User) session.getAttribute("PhuHuynhInfo");
		int id_user = PhuHuynhInfo.getId_user();
		User obj = userDAO.getItem(id_user);
		User objItem = new User(id_user, fullname, "", "", diachi, 0, phone, email, "", 1, "", 0, "", 0, 1, 0, "");
		
		String fileName = multipartFile.getOriginalFilename();
          
		if (!fileName.isEmpty()) {
			String dirPath = request.getServletContext().getRealPath("files");
			String filePath = dirPath + File.separator + fileName;
			File file = new File(filePath);
			try {
				multipartFile.transferTo(file);
				System.out.println("up file thành công ");
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			objItem.setPicture(fileName);
			//xÃ³a hÃ¬nh cÅ©
			
			if (!obj.getPicture().equals("")) {
				String fileOld = dirPath + File.separator + obj.getPicture();
				File old = new File(fileOld);
				if (!old.exists())
				old.delete();
			}
		} else {
			objItem.setPicture(obj.getPicture());
		}
	
		if (userDAO.editPhuHuynh(objItem)> 0){
			return "redirect:/phuhuynh/tai-khoan-phu-huynh?msg=edit";
		}else{
			return "redirect:/phuhuynh/sua-tai-khoan?msg=nonedit";
	}
		
	}
	
	
	
	@RequestMapping(value="/thong-bao", method=RequestMethod.GET)
	public String thongbao(){
		return "phuhuynh.thongbao";
	}
	
	@RequestMapping(value="/phuhuynh-logout", method=RequestMethod.POST)
	public String logout(HttpSession session, ModelMap modelMap){
		User PhuHuynhInfo = (User) session.getAttribute("PhuHuynhInfo");
		chatdao.onlineDX(PhuHuynhInfo.getId_user());
		session.removeAttribute("PhuHuynhInfo");
		modelMap.clear();
		return "redirect:/";
	}
   
	@RequestMapping(value="/binh-luan-gia-su", method=RequestMethod.POST)	
	public void addLienHe(HttpServletRequest request, HttpServletResponse response) throws IOException{	
		 PrintWriter out = response.getWriter();
		String name = new String(request.getParameter("name"));
		String picture = new String(request.getParameter("picture"));
		String email = new String(request.getParameter("email"));
		String id_giasu1 = new String(request.getParameter("id_giasu"));
		int id_giasu = Integer.parseInt(id_giasu1);
		String comment = new String(request.getParameter("comment"));
		 Date dNow = new Date(System.currentTimeMillis());
		    SimpleDateFormat ft = new SimpleDateFormat (" 'lÃºc' hh:mm a 'ngÃ y' dd/MM/yyyy");
		    String time = ft.format(dNow);
		BinhLuanGiaSu obj = new BinhLuanGiaSu(0, id_giasu, name, email, comment, time, picture);
		if(binhluanDAO.addItemGS(obj)>0){
			out.println(
					"<ul class=\"comment-list\">"
					);
			 ArrayList<BinhLuanGiaSu> list = (ArrayList<BinhLuanGiaSu>) binhluanDAO.getListBLGS(id_giasu);			
			  for(BinhLuanGiaSu obj1: list){
				   out.println(		
						   "<li style=\"margin-bottom: -6%\">"+
								     "<div class=\"author-box\">"+
								     "<div class=\"lv-avatar pull-left\" style=\"margin-top: -1%; display: inline;\">"+
           	            "<img src=\""+request.getContextPath()+"/files/"+obj.getPicture()+"\" style=\"width: 5%px; height: 5%px;\"/>"+
                         "</div>"+
								       "<div class=\"author-box_right\">"+
								       "<p style=\"display: inline\">"+obj1.getName()+"</p>"+
							            "<span class=\"m_1\" style=\"display: inline\">"+obj1.getTime()+"</span>"+
							            "<p>"+obj1.getComment()+"</p>"+
								      "</div>"+
								     "</div>"+
							"</li>"
				   );
		   }
			out.print(
					"</ul>"	
		     );
		}
	}
	
}
