package controller;



import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import constant.Defines;
import dao.BaiVietDAO;
import dao.BinhLuanBaiVietDAO;
import dao.DangKyDAO;
import dao.GiaSuDAO;
import dao.ThongBaoDAO;
import entities.BaiViet;
import entities.User;
import utils.SlugUtils;
import utils.Split;


@Controller
@RequestMapping(value="admin/giasu")
public class AdminGiaSuController {
	@Autowired
	private Split split;
	@Autowired
	private Defines defines;	
	@Autowired
	private SlugUtils slugUtils;
	@Autowired
	private DangKyDAO dangkyDAO;
	@Autowired
	private GiaSuDAO giasuDAO;
	@Autowired
	private BaiVietDAO baivietDAO;
	@Autowired
	private ThongBaoDAO thongbaoDAO;
	@Autowired
	private BinhLuanBaiVietDAO binhluanbaivietDAO;
	@ModelAttribute
	public void addCommons(ModelMap modelMap){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slugUtils", slugUtils);
		modelMap.addAttribute("split", split);
		modelMap.addAttribute("giasu", "active");
		modelMap.addAttribute("listMon", dangkyDAO.getListMon());
		modelMap.addAttribute("listLop", dangkyDAO.getListLop());
	}
	
	@RequestMapping(value="" , method=RequestMethod.GET)
    public String indexBaiviet(ModelMap modelMap){
		modelMap.addAttribute("listgiasu", giasuDAO.getListGiaSu());
    	return "admin.index.giasu";
    }
	
	
	
	@RequestMapping(value="/chitiet/{id}" , method=RequestMethod.GET)
    public String chitiet(@PathVariable("id") int id,ModelMap modelMap){
		if(dangkyDAO.getDK(id, 1)!=null){
			modelMap.addAttribute("dangky1", dangkyDAO.getDK(id, 1));
			}
			if(dangkyDAO.getDK(id, 2)!=null){
			modelMap.addAttribute("dangky2", dangkyDAO.getDK(id, 2));
			}
			if(dangkyDAO.getDK(id, 3)!=null){
			modelMap.addAttribute("dangky3", dangkyDAO.getDK(id, 3));
			}
			modelMap.addAttribute("index", "index");
		modelMap.addAttribute("GiaSu", giasuDAO.getItem(id));
		modelMap.addAttribute("listBinhLuanGiaSu", binhluanbaivietDAO.getListBLGS(id));
    	return "admin.giasu.chitiet";
    }
	
	@RequestMapping(value="/tangxu/{id}" , method=RequestMethod.GET)
    public String webxu(@PathVariable("id") int id,ModelMap modelMap){
		    if(dangkyDAO.getDK(id, 1)!=null){
			modelMap.addAttribute("dangky1", dangkyDAO.getDK(id, 1));
			}
			if(dangkyDAO.getDK(id, 2)!=null){
			modelMap.addAttribute("dangky2", dangkyDAO.getDK(id, 2));
			}
			if(dangkyDAO.getDK(id, 3)!=null){
			modelMap.addAttribute("dangky3", dangkyDAO.getDK(id, 3));
			}
			modelMap.addAttribute("GiaSu", giasuDAO.getItem(id));
    	return "admin.suawebxu";
    }
	
	@RequestMapping(value="/tangxu/{id}" , method=RequestMethod.POST)
    public String suawebxu(@PathVariable("id") int id, HttpServletRequest request){
		int webxu = Integer.parseInt(request.getParameter("webxu"));
		int webxucu = Integer.parseInt(request.getParameter("webxucu"));
		int webxunapvao = webxu - webxucu;
		   if(giasuDAO.editWebXu(id, webxu)>0){
			   thongbaoDAO.ThongBaoWebXu(id, webxu, webxunapvao);
			   return "redirect:/admin/giasu?msg=edit";
		   }
		   return "redirect:/admin/giasu/tangxu?msg=noedit";
    }
	
	@RequestMapping(value="/add" , method=RequestMethod.GET)
    public String addBaiViet(){
    	return "admin.baiviet.add";
    }
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("objItem") BaiViet objItem, @RequestParam("file") CommonsMultipartFile multipartFile,HttpServletRequest request) {
		if (!objItem.getName_baiviet().trim().equals("")){
			objItem.setName_baiviet(objItem.getName_baiviet().trim());
		String fileName = multipartFile.getOriginalFilename();
		if (!fileName.isEmpty()) {
			String dirPath = request.getServletContext().getRealPath("files");
			// tạo thư mục file nếu chưa có
			File dir = new File(dirPath);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			String filePath = dirPath + File.separator + fileName;
			System.out.println(filePath);
			File file = new File(filePath);
			try {
				multipartFile.transferTo(file);
				System.out.println("up file thành công ");
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		objItem.setPicture(fileName);
		if (baivietDAO.addItem(objItem) > 0) {
			return "redirect:/admin/baiviet?msg=add";
		}		
		}
		return "admin.baiviet.add";
		
	}
    
	
	@RequestMapping(value="edit/{id}", method=RequestMethod.GET)
	public String edit(@PathVariable("id") int id , ModelMap modelMap){
		modelMap.addAttribute("objItem", baivietDAO.getItem(id));
		return "admin.baiviet.edit";
	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
	public String edit(@PathVariable("id") int id, @ModelAttribute("objItem") BaiViet objItem,
			@RequestParam("file") CommonsMultipartFile multipartFile, HttpServletRequest request) {
		objItem.setId_baiviet(id);
		// xử lý ảnh
		BaiViet obj = baivietDAO.getItem(id);
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
			//xóa hình cũ
			
			if (!obj.getPicture().equals("")) {
				String fileOld = dirPath + File.separator + obj.getPicture();
				File old = new File(fileOld);
				if (!old.exists())
				old.delete();
			}
		} else {
			objItem.setPicture(obj.getPicture());
		}
	
		if (baivietDAO.editItem(objItem) > 0){
			return "redirect:/admin/baiviet?msg=edit";
		}else{
			return "redirect:/admin/baiviet/edit?msg=nonedit";
	}
	}	
	@RequestMapping(value = "del/{id}", method = RequestMethod.GET)
	public String del(@PathVariable("id") int id, HttpServletRequest request) {
		User obj = giasuDAO.getItem(id);
		if (giasuDAO.delItem(id) > 0) {
			
			if (!obj.getPicture().equals("")) {
				String dirPath = request.getServletContext().getRealPath("files");
				String filePath = dirPath + File.separator + obj.getPicture();
				File file = new File(filePath);
				if (!file.exists())
				file.delete();
				
			}
			return "redirect:/admin/giasu?msg=del&soluongdel="+1;
		}
		return "redirect:/admin/giasu?msg=nondel";
	}
	@RequestMapping(value = "/dels", method = RequestMethod.GET)
	public String dels(HttpServletRequest request) {	
		String id_GiaSu[]=request.getParameterValues("iddel[]");
		int soluong = id_GiaSu.length;
		for(int i=0; i< id_GiaSu.length ; i++){
			int id_giasu = Integer.parseInt(id_GiaSu[i]);
			if(giasuDAO.delItem(id_giasu)<0){
				return "redirect:/admin/giasu?msg=nondel";
			}
		
		}				
		    return "redirect:/admin/giasu?msg=del&soluongdel="+soluong;
	}
	
	
	
	
	
	
	
	@RequestMapping(value="/kichhoat", method=RequestMethod.POST)
	public void kichhoat(HttpServletRequest request, HttpServletResponse response) throws IOException{	
		PrintWriter out = response.getWriter();
		int trangthai= Integer.parseInt(request.getParameter("trangthai"));
		int atrangthai;
		if(trangthai==1){
		    atrangthai = 0;
		}else{
			atrangthai =1;
		}
		int id_sp = Integer.parseInt(request.getParameter("id_sp"));
		giasuDAO.editTrangthai(id_sp, atrangthai);		
		if(trangthai== 0){
			out.print(
					"<a href=\"javascrip:void(0)\"  title=\"ngừng kích hoạt\" class=\"noactive\"> "+
							"<img src=\""+request.getContextPath()+"/templates/admin/assets/img/active.gif \">"+
						"</a>"
		);
		}else{
			out.print(
					"<a href=\"javascrip:void(0)\"  title=\"kích hoạt\" > "+
							"<img src=\""+request.getContextPath()+"/templates/admin/assets/img/noactive.gif\">"+
						"</a>"
				);
		}
	}
	
	
}
