package com.hzyc.project2.service;

import java.util.List;



import com.hzyc.project2.po.Adm;
import com.hzyc.project2.po.House;
import com.hzyc.project2.po.Img;
import com.hzyc.project2.po.User;
import com.hzyc.project2.util.Page;

public interface UserSev {
	public User selectByPhone(String phone);
	public Adm selectAdm(String name,String password);
	public List<House> selectHouseByPage(String pageNow,Page page)throws Exception;
	public List<User> selectUserByPage(String pageNow,Page page)throws Exception;
	public long getHouseCount();
	public long getUserCount();
	public String queryHouse(String storey);
	public String queryUser(String name,String idCard);
	public String queryUserRegist(String phone);
	public void addHouse(House house,String id);
	public void addHousePictrue(String imgName,String id);
	public void addUser(User user);
	public void addUserRegist(User user);
	public House selectHouseById(String id);
	public User selectUserById(String id);
	public void updateHouse(House house);
	public void updateUser(User user);
	public void updateUserHouse(User user);
	public void deleteHouse(String id);
	public void deleteUser(String id);
	public List<House> queryHousePre();
	public House queryHouseInfo(String id);
	public List<Img> queryHouseInfoImg(String id);
}
