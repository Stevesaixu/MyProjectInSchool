package com.hzyc.project2.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.hzyc.project2.po.Adm;
import com.hzyc.project2.po.House;
import com.hzyc.project2.po.Img;
import com.hzyc.project2.po.User;
import com.hzyc.project2.util.Page;

public interface UserMapper {
	public User selectByPhone(String phone);
	public void insertPhone(String phone);
	public Adm selectAdm(String name);
	public List<House> selectHouseByPage(Page page)throws Exception;
	public long getHouseCount();
	public List<User> selectUserByPage(Page page)throws Exception;
	public long getUserCount();
	public String queryHouse(String storey);
	public String queryUser(@Param("name")String name,@Param("idCard")String idCard);
	public String queryUserRegist(@Param("phone")String phone);
	public void addHouse(@Param("house")House house,@Param("id")String id);
	public void addHousePictrue(@Param("imgName")String imgName,@Param("id")String id);
	public void addUser(@Param("user")User user);
	public void addUserRegist(@Param("user")User user,@Param("info")String info);
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
