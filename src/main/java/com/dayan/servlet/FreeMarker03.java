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
 * FreeMarker 常用指令
 */
@WebServlet("/f03")
public class FreeMarker03 extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        // 请求转发跳转到指定的模板页面   template/f03.ftl
        req.getRequestDispatcher("template/f03.ftl").forward(req,resp);
    }
}
