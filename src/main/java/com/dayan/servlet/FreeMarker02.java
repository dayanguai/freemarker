package com.dayan.servlet;

import com.dayan.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * FreeMarker 数据类型
 */
@WebServlet("/f02")
public class FreeMarker02 extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        /* 布尔类型 */
        req.setAttribute("flag",true);

        /* 日期类型 */
        req.setAttribute("createDate",new Date());

        /* 数值类型 */
        req.setAttribute("age",18);
        req.setAttribute("num",10000);
        req.setAttribute("avg",5.5467);

        /* 字符串类型 */
        req.setAttribute("msg","Hello");
        req.setAttribute("msg2","freemarker");

        // 空数据
        req.setAttribute("str1",null);
        req.setAttribute("str2","");

        /* 序列类型 （数组、List、Set） */
        // 数组
        String[] stars = new String[]{"周杰伦","林俊杰","五月天","陈奕迅"};
        req.setAttribute("stars",stars);
        // List操作
        List<String> citys = Arrays.asList("上海","北京","杭州","深圳");
        req.setAttribute("cityList",citys);
        // JavaBean集合
        List<User> userList = new ArrayList<>();
        userList.add(new User(1,"zhangsan",22));
        userList.add(new User(2,"lisi",18));
        userList.add(new User(3,"wangwu",20));
        req.setAttribute("userList",userList);

        // Map操作
        Map<String,String> cityMap = new HashMap<>();
        cityMap.put("sh","上海");
        cityMap.put("bj","北京");
        cityMap.put("sz","深圳");
        req.setAttribute("cityMap",cityMap);



        // 请求转发跳转到指定的模板页面   template/f02.ftl
        req.getRequestDispatcher("template/f02.ftl").forward(req,resp);
    }
}
