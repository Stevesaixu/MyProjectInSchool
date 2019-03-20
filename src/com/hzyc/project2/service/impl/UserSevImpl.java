package com.hzyc.project2.service.impl;


import java.util.ArrayList;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;


import com.hzyc.project2.dao.UserMapper;
import com.hzyc.project2.po.Adm;
import com.hzyc.project2.po.House;
import com.hzyc.project2.po.Img;
import com.hzyc.project2.po.User;
import com.hzyc.project2.service.UserSev;
import com.hzyc.project2.util.Page;

@Service
public class UserSevImpl implements UserSev{
	@Autowired
	private UserMapper um;
	@Override
	public User selectByPhone(String phone) {
		User user=um.selectByPhone(phone);
		if(user!=null){

			return user;
		}else{
			
			return null;
		}
	}
	public Adm selectAdm(String name,String password) {
		Adm adm=um.selectAdm(name);
		
		if(adm!=null&&adm.getPassword().equals(password)){
			return adm;
		}
		return null;
	}
	public List<House> selectHouseByPage(String pageNow,Page page)throws Exception{
		
		return um.selectHouseByPage(page);
	 
	}
	
	public List<User> selectUserByPage(String pageNow,Page page)throws Exception{
		
		return um.selectUserByPage(page);
	 
	}
	
	public long getHouseCount(){
		return (int) um.getHouseCount();
	}
	
	public long getUserCount(){
		return (int) um.getUserCount();
	}
	
	public String queryHouse(String storey){
		return um.queryHouse(storey);
	}
	
	public void addHouse(House house,String id) {
		um.addHouse(house,id);
		
	}
	
	public void addHousePictrue(String imgName,String id) {
		um.addHousePictrue(imgName,id);
		
	}
	
	
	public House selectHouseById(String id) {
		return um.selectHouseById(id);
		
	}
	
	public void updateHouse(House house) {
		um.updateHouse(house);
		
	}
	
	public void deleteHouse(String id) {
		um.deleteHouse( id);
		
	}
	
	public String queryUser(String name, String idCard) {
		return um.queryUser(name, idCard);
	}

	
	public String queryUserRegist( String phone) {
		
		return um.queryUserRegist( phone);
	}
	
	public void addUser(User user) {
		um.addUser(user);
		
	}
	
	public void addUserRegist(User user) {
		um.addUserRegist(user,"”√ªß");
		
	}
	
	public User selectUserById(String id) {
		
		return um.selectUserById(id);
	}
	
	public void updateUser(User user) {
		um.updateUser(user);
		
	}
	
	public void updateUserHouse(User user) {
		um.updateUserHouse(user);
		
	}
	
	public void deleteUser(String id) {
		um.deleteUser(id);
		
	}
	@Override
	public List<House> queryHousePre() {
		List<House> list1=new ArrayList<House>();
		List<House> list2=new ArrayList<House>();
		list1=um.queryHousePre();
		list2.add(list1.get(0));
		for(int i=1;i<list1.size();i++){
			if(list1.get(i).getHouse_id()!=list1.get(i-1).getHouse_id()){
				
				list2.add(list1.get(i));
			}
		}
		return list2;
	}
	@Override
	public House queryHouseInfo(String id) {
		return um.queryHouseInfo(id);
	}
	
	@Override
	public List<Img> queryHouseInfoImg(String id) {
		return um.queryHouseInfoImg(id);
	}
}
