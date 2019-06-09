package com.itheima.dao;

import com.itheima.domian.Product;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IProductDao {
    /*
    * 查询所有产品
    * */
    @Select("select * from product")
    List<Product> findAll() throws Exception;


    /*
    * 添加产品
    * */
    @Insert("insert into product(productNum,productName,cityName,departureTime,productPrice,productDesc,productStatus)" +
            "values(#{productNum},#{productName},#{cityName},#{departureTime},#{productPrice}," +
            "#{productDesc},#{productStatus})")
    void save(Product product)throws Exception;


    /*
    * 根据id查询产品
    * */
    @Select("select * from product where id=#{id}")
    Product findById(String id) throws Exception;
}
