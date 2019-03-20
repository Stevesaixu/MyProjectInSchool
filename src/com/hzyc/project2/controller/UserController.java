package com.hzyc.project2.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hzyc.project2.po.Adm;
import com.hzyc.project2.po.House;
import com.hzyc.project2.po.Img;
import com.hzyc.project2.po.User;
import com.hzyc.project2.service.UserSev;
import com.hzyc.project2.util.Page;

@Controller
public class UserController {
	@Autowired
	private UserSev us;

	@RequestMapping("selectByPhone.do")
	public String selectByPhone(String phone, HttpServletRequest request) {

		User user = us.selectByPhone(phone);
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		if (user != null) {
			return "redirect:/house/index.jsp";
		} else {

			return "redirect:/house/introduce.jsp";// 个人设置那页，后续修改
		}

	}

	@RequestMapping("selectAdm.do")
	public String selectAdm(Adm adm, HttpServletRequest request) {
		adm = us.selectAdm(adm.getName(), adm.getPassword());
		HttpSession session = request.getSession();

		if (adm != null) {
			session.setAttribute("adm", adm);
			return "redirect:/adm/adm_index.jsp";
		} else {

			session.setAttribute("message", "登录名和密码错误,请重新输入");
			return "redirect:/adm/adm_login.jsp";
		}

	}

	@RequestMapping("selectHouse.do")
	public String selectHouseByPage(HttpServletRequest request) throws Exception {
		List<House> house = new ArrayList<House>();
		String pageNow = request.getParameter("pageNow");

		Page page = null;
		int totalCount = (int) us.getHouseCount();
		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			house = us.selectHouseByPage(pageNow, page);
		} else {
			page = new Page(totalCount, 1);
			house = us.selectHouseByPage(pageNow, page);
		}
		HttpSession session = request.getSession();
		session.setAttribute("house", house);
		session.setAttribute("page", page);
		return "adm/adm_list.jsp";

	}

	@RequestMapping("selectUser.do")
	public String selectUserByPage(HttpServletRequest request) throws Exception {
		List<User> user = new ArrayList<User>();
		String pageNow = request.getParameter("pageNow");

		Page page = null;
		int totalCount = (int) us.getUserCount();
		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			user = us.selectUserByPage(pageNow, page);
		} else {
			page = new Page(totalCount, 1);
			user = us.selectUserByPage(pageNow, page);
		}
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		session.setAttribute("page", page);
		return "adm/adm_user_list.jsp";

	}

	@RequestMapping("addHouse.do")
	public void addHouse(House house) throws Exception {
		System.out.println("231231231212312");
		String phone = house.getHouse_phone();
		User user = us.selectByPhone(phone);
		String id = user.getId();
		us.addHouse(house, id);

	}

	@RequestMapping("addHousePictrue.do")
	public String addHousePictrue( String houseId,MultipartFile file, HttpServletRequest req) {

		// 获得上传的文件的名字
		String oldName = file.getOriginalFilename();

		// 把图片名字存到数据库
		String newImageName = UUID.randomUUID() + oldName;
		

		// 把图片写到服务器
		String tomcatPath = req.getSession().getServletContext().getRealPath("/") + "image\\";
		
		// F:\2018\workspace\java\61_3\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\lesson10.all\img\djsakdj.jpg
		String target = tomcatPath + newImageName;
		File fTarget = new File(target);

		/* 
		 * 源《--输入流 byte 目标《---输出流
		 */
		try {

			file.transferTo(fTarget);// io对接

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 调用业务层方法，同业业务接口调用
		us.addHousePictrue(newImageName,houseId);

		return "redirect:/house/introduce.jsp";
	}

	

	@RequestMapping("addHousePre.do")
	public String addHousePre(House house) throws Exception {
		System.out.println("231231231212312");
		String phone = house.getHouse_phone();
		User user = us.selectByPhone(phone);
		String id = user.getId();
		us.addHouse(house, id);
		return "redirect:/house/introduce.jsp";
	}

	@RequestMapping("addUser.do")
	public void addUser(User user) throws Exception {

		us.addUser(user);

	}

	@RequestMapping("addUserRegist.do")
	public String addUserRegist(User user, HttpServletRequest request) throws Exception {

		us.addUserRegist(user);
		HttpSession session = request.getSession();
		session.setAttribute("user", user);

		return "redirect:/house/index.jsp";
	}

	@RequestMapping("selectHouseById.do")
	public String selectHouseById(String id, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		House house = us.selectHouseById(id);
		if (house != null) {
			session.setAttribute("house", house);
			return "adm/adm_update_house.jsp";
		} else {
			return "adm/adm_list.jsp";
		}

	}

	@RequestMapping("selectUserById.do")
	public String selectUserById(String id, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		User user = us.selectUserById(id);
		if (user != null) {
			session.setAttribute("user", user);
			return "adm/adm_update_user.jsp";
		} else {
			return "adm/adm_user_list.jsp";
		}

	}

	@RequestMapping("updateHouse.do")
	public void updateHouse(House house) throws Exception {
		us.updateHouse(house);
	}

	@RequestMapping("updateUser.do")
	public void updateUser(User user) throws Exception {
		us.updateUser(user);
	}

	@RequestMapping("updateUserHouse.do")
	public String updateUserHouse(User user) throws Exception {
		us.updateUserHouse(user);
		return "redirect:/house/index.jsp";

	}

	@RequestMapping("deleteHouse.do")
	public String deleteHouse(String id) throws Exception {
		us.deleteHouse(id);
		return "adm/adm_list.jsp";
	}

	@RequestMapping("deleteUser.do")
	public String deleteUser(String id) throws Exception {
		us.deleteUser(id);
		return "adm/adm_user_list.jsp";
	}

	@ResponseBody
	@RequestMapping("queryHouse.do")
	public String queryHouse(String storey) {

		return us.queryHouse(storey);

	}

	@ResponseBody
	@RequestMapping("queryUser.do")
	public String queryUser(String name, String idCard) {

		return us.queryUser(name, idCard);

	}

	@ResponseBody
	@RequestMapping("queryUserRegist.do")
	public String queryUserRegist(String phone) {

		return us.queryUserRegist(phone);

	}

	@RequestMapping("queryHousePre.do")
	public String queryHousePre( HttpServletRequest request){
		List<House> house = new ArrayList<House>();
		house=us.queryHousePre();
		HttpSession session = request.getSession();
		session.setAttribute("house", house);
		if(house!=null){
			return "redirect:/house/index_list.jsp";
		}else{
			return "redirect:/house/index.jsp";
		}
		
	}
	
	@RequestMapping("queryHouseInfo.do")
	public String queryHouseInfo( HttpServletRequest request){
		String id=request.getParameter("id");
		List<Img> img = new ArrayList<Img>();
		House house=us.queryHouseInfo(id);
		img=us.queryHouseInfoImg(id);
		house.setImg_name(img.get(0).getImg_name());
		HttpSession session = request.getSession();
		session.setAttribute("house", house);
		session.setAttribute("img", img);
		if(house!=null){
			return "redirect:/house/house_info.jsp";
		}else{
			return "redirect:/house/index.jsp";
		}
		
	}
}
