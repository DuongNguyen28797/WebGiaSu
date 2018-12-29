package controller;


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

import constant.Defines;
import dao.BaiVietDAO;
import dao.BinhLuanBaiVietDAO;
import dao.ChatDAO;
import dao.DangKyDAO;
import dao.GiaSuDAO;
import dao.PhuHuynhDAO;
import dao.UserDAO;
import entities.BinhLuanBaiViet;
import entities.DangKyMon;
import entities.User;
import utils.SlugUtils;


@Controller

public class PublicIndexController {
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
	private ChatDAO chatDAO;
	
	
	@ModelAttribute
	public void addCommons(ModelMap modelMap){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slugUtils", slugUtils);
		modelMap.addAttribute("listBaiViet", baivietDAO.getListBV());
		modelMap.addAttribute("listQuanHuyen", dangkyDAO.getListQuanHuyen());
		modelMap.addAttribute("listMon", dangkyDAO.getListMon());
		modelMap.addAttribute("listLop", dangkyDAO.getListLop());
		modelMap.addAttribute("listGiaSu", userDAO.getListGiaSU());
		modelMap.addAttribute("listDKM", dangkyDAO.getListDKM());
	}
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String index(ModelMap modelMap){
		modelMap.addAttribute("listQuanHuyen", dangkyDAO.getListQuanHuyen());
		modelMap.addAttribute("listMon", dangkyDAO.getListMon());
		modelMap.addAttribute("listLop", dangkyDAO.getListLop());
		modelMap.addAttribute("listGiaSu", userDAO.getListGiaSU());
		modelMap.addAttribute("listBaiViet", baivietDAO.getListBaiViet());
		return "public.index";
	}
	
	@RequestMapping(value="/403" , method=RequestMethod.GET)
    public String er403(){	
    	return "public.auth.403";
    }
	
	@RequestMapping(value="/dang-nhap-gia-su", method=RequestMethod.POST)
	public String checkloginGS(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session){
		if(giasuDAO.checklogin(username, password) != null){
			User GiaSuInfo = giasuDAO.checklogin(username, password);
			chatDAO.onlineDN(GiaSuInfo.getId_user());
			session.setAttribute("GiaSuInfo", GiaSuInfo);
		}else{
			return  "redirect:/";
		}
		return "redirect:/giasu";	
	}
	
	@RequestMapping(value="/dang-nhap-phu-huynh", method=RequestMethod.POST)
	public String checkloginPH(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session){
		if(phuhuynhDAO.checklogin(username, password) != null){
			User PhuHuynhInfo = phuhuynhDAO.checklogin(username, password);
			chatDAO.onlineDN(PhuHuynhInfo.getId_user());
			session.setAttribute("PhuHuynhInfo", PhuHuynhInfo);
			return "redirect:/phuhuynh";	
		}else{
			return  "redirect:/";
		}
		 
	}
	
	
	@RequestMapping(value="/chi-tiet-bai-viet/{slug}-{id}", method=RequestMethod.GET)
	public String detail(@PathVariable("id") int id , ModelMap modelMap){
		modelMap.addAttribute("listBinhLuan", binhluanDAO.getbinhluan(id));
		modelMap.addAttribute("itemNews", baivietDAO.getItem(id));
		modelMap.addAttribute("id_baiviet", id);
		return "public.chitiet.baiviet";
	}
	
	@RequestMapping(value="/dang-ky-gia-su", method=RequestMethod.GET)
	public String dangkygiasu(ModelMap modelMap){
		modelMap.addAttribute("listquanhuyen", dangkyDAO.getListQuanHuyen());
		return "public.dangky.giasu";
	}
	
	@RequestMapping(value="/dang-ky-phu-huynh", method=RequestMethod.GET)
	public String dangkyphuhuynh(ModelMap modelMap){
		modelMap.addAttribute("listquanhuyen", dangkyDAO.getListQuanHuyen());
		return "public.dangky.phuhuynh";
	}
	
	@RequestMapping(value="/bai-viet", method=RequestMethod.GET)
	public String baiviet(){
		return "public.baiviet";
	}
	
	@RequestMapping(value="/huong-dan-su-dung-website", method=RequestMethod.GET)
	public String huongdan(){
		return "public.huongdan";
	}
	
	@RequestMapping(value="/dang-ky-gia-su", method=RequestMethod.POST)
	public String checklogin(@ModelAttribute("objGiasu") User objGiasu, ModelMap modelMap){
		if(userDAO.getUser(objGiasu.getUsername())!=null){
			return "redirect:/dang-ky-gia-su?msg=trung";	
		}else{
			giasuDAO.addGiaSu(objGiasu);
			modelMap.addAttribute("dkgs", "dkgs");
			return "public.dangky.giasu";
		}
		
	}
	
	@RequestMapping(value="/dang-ky-phu-huynh", method=RequestMethod.POST)
	public String dkph(@ModelAttribute("objPhuHuynh") User objPhuHuynh, ModelMap modelMap){
		if(userDAO.getUser(objPhuHuynh.getUsername())!=null){
			return "redirect:/dang-ky-phu-huynh?msg=trung";	
		}else{
		phuhuynhDAO.addPhuHuynh(objPhuHuynh);
		modelMap.addAttribute("dkph", "dkph");
		return "public.dangky.phuhuynh";
		}
	}
	
	@RequestMapping(value="/binh-luan-bai-viet", method=RequestMethod.POST)	
	public void addLienHe(HttpServletRequest request, HttpServletResponse response) throws IOException{	
		 PrintWriter out = response.getWriter();
		String name = new String(request.getParameter("name"));
		String email = new String(request.getParameter("email"));
		String id_baiviet1 = new String(request.getParameter("id_baiviet"));
		int id_baiviet = Integer.parseInt(id_baiviet1);
		String comment = new String(request.getParameter("comment"));
		    Date dNow = new Date(System.currentTimeMillis());
		    SimpleDateFormat ft = new SimpleDateFormat (" 'lúc' hh:mm a 'ngày' dd/MM/yyyy");
		    String time = ft.format(dNow);
	    BinhLuanBaiViet   obj = new BinhLuanBaiViet(0, id_baiviet, name, email, comment, time);
		if(binhluanDAO.addItem(obj)>0){
			out.println(
					"<ul class=\"comment-list\">"
					);
			 ArrayList<BinhLuanBaiViet> list = (ArrayList<BinhLuanBaiViet>) binhluanDAO.getbinhluan(id_baiviet);			
			  for(BinhLuanBaiViet obj1: list){
				   out.println(		
						   "<li style=\"margin-bottom: -6%\">"+
								     "<div class=\"author-box\">"+
								       "<div class=\"author-box_left\">"+"<img src=\""+request.getContextPath()+"/templates/public/images/author.png\"" +"class=\"img-responsive\"/>"+"</div>"+
								       "<div class=\"author-box_right\">"+
								       "<p>"+obj1.getName()+"</p>"+
							            "<span class=\"m_1\">"+obj1.getTime()+"</span>"+
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
