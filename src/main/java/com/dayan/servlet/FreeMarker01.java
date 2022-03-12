package com.dayan.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author ：dayan
 * @date ：Created in 2022-03-07 9:20
 * @description：
 */
@WebServlet("/f01")
public class FreeMarker01 extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 添加数据
        request.setAttribute("msg","Hello FreeMarker!");
        // 请求转发跳转到ftl文件中
        request.getRequestDispatcher("template/f01.ftl").forward(request,response);
    }
}
