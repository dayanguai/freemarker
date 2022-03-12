package com.dayan.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * FreeMarker 常用指令
 */
@WebServlet("/f04")
public class FreeMarker04 extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        // 请求转发跳转到指定的模板页面   template/f04.ftl
        req.getRequestDispatcher("template/f04.ftl").forward(req,resp);
    }
}
