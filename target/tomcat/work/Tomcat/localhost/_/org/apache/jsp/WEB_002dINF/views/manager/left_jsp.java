/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2019-12-11 04:27:50 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.manager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class left_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->\r\n");
      out.write("<meta name=\"description\" content=\"\">\r\n");
      out.write("<meta name=\"author\" content=\"\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"../js/jquery.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"../js/jquery-2.2.3.min.js\"></script>\r\n");
      out.write("<link href=\"../css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("<script src=\"../js/bootstrap.min.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<div class=\"lefter\">\r\n");
      out.write("\t\t<div class=\"panel-group\" id=\"accordion\" role=\"tablist\"\r\n");
      out.write("\t\t\taria-multiselectable=\"true\">\r\n");
      out.write("\t\t\t<div class=\"panel panel-default\">\r\n");
      out.write("\t\t\t\t<div class=\"panel-heading\">\r\n");
      out.write("\t\t\t\t\t<h4 class=\"panel-title\">\r\n");
      out.write("\t\t\t\t\t\t<a href=\"#\"><span class=\"glyphicon glyphicon-th-large\"></span>\r\n");
      out.write("\t\t\t\t\t\t\t菜单列表</a>\r\n");
      out.write("\t\t\t\t\t</h4>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"panel panel-default\">\r\n");
      out.write("\t\t\t\t<div class=\"panel-heading\">\r\n");
      out.write("\t\t\t\t\t<h4 class=\"panel-title\">\r\n");
      out.write("\t\t\t\t\t\t<a href=\"user\" target=\"right\"><span\r\n");
      out.write("\t\t\t\t\t\t\tclass=\"glyphicon glyphicon-user\"></span> 用户管理</a>\r\n");
      out.write("\t\t\t\t\t</h4>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"panel panel-default\">\r\n");
      out.write("\t\t\t\t<div class=\"panel-heading\">\r\n");
      out.write("\t\t\t\t\t<h4 class=\"panel-title\">\r\n");
      out.write("\t\t\t\t\t\t<a href=\"gametype\" target=\"right\"><span\r\n");
      out.write("\t\t\t\t\t\t\tclass=\"glyphicon glyphicon-th\"></span> 游戏类型</a>\r\n");
      out.write("\t\t\t\t\t</h4>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"panel panel-default\">\r\n");
      out.write("\t\t\t\t<div class=\"panel-heading\">\r\n");
      out.write("\t\t\t\t\t<h4 class=\"panel-title\">\r\n");
      out.write("\t\t\t\t\t\t<a href=\"game\" target=\"right\"><span\r\n");
      out.write("\t\t\t\t\t\t\tclass=\"glyphicon  glyphicon-list\"></span> 游戏列表</a>\r\n");
      out.write("\t\t\t\t\t</h4>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"panel panel-default\">\r\n");
      out.write("\t\t\t\t<div class=\"panel-heading\">\r\n");
      out.write("\t\t\t\t\t<h4 class=\"panel-title\">\r\n");
      out.write("\t\t\t\t\t\t<a href=\"exchange\" target=\"right\"><span\r\n");
      out.write("\t\t\t\t\t\t\tclass=\"glyphicon glyphicon-transfer\"></span>换算比例</a>\r\n");
      out.write("\t\t\t\t\t</h4>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"panel panel-default\">\r\n");
      out.write("\t\t\t\t<div class=\"panel-heading\">\r\n");
      out.write("\t\t\t\t\t<h4 class=\"panel-title\">\r\n");
      out.write("\t\t\t\t\t\t<a href=\"card\" target=\"right\"><span\r\n");
      out.write("\t\t\t\t\t\t\tclass=\"glyphicon glyphicon-barcode\"></span>密保卡管理</a>\r\n");
      out.write("\t\t\t\t\t</h4>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div style=\"display: none\" class=\"panel panel-default\">\r\n");
      out.write("\t\t\t\t<div class=\"panel-heading\" role=\"tab\" id=\"headingThree\">\r\n");
      out.write("\t\t\t\t\t<h4 class=\"panel-title\">\r\n");
      out.write("\t\t\t\t\t\t<a class=\"collapsed\" role=\"button\" data-toggle=\"collapse\"\r\n");
      out.write("\t\t\t\t\t\t\tdata-parent=\"#accordion\" href=\"#collapse5\" aria-expanded=\"false\"\r\n");
      out.write("\t\t\t\t\t\t\taria-controls=\"collapseThree\"> <span class=\"\"></span> 预留\r\n");
      out.write("\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t</h4>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div id=\"collapse5\" class=\"panel-collapse collapse\" role=\"tabpanel\"\r\n");
      out.write("\t\t\t\t\taria-labelledby=\"headingThree\">\r\n");
      out.write("\t\t\t\t\t<div class=\"panel-body\">\r\n");
      out.write("\t\t\t\t\t\t<ul class=\"nav nav-sidebar\">\r\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"\" target=\"right\">权限管理</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"\" target=\"right\">登录日志</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"\" target=\"right\">操作日志</a></li>\r\n");
      out.write("\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<script>\r\n");
      out.write("   $(function(){\r\n");
      out.write("      $('a[data-toggle=\"tab\"]').on('shown.bs.tab', function (e) {\r\n");
      out.write("      // 获取已激活的标签页的名称\r\n");
      out.write("      var activeTab = $(e.target).text(); \r\n");
      out.write("      // 获取前一个激活的标签页的名称\r\n");
      out.write("      var previousTab = $(e.relatedTarget).text(); \r\n");
      out.write("      $(\".active-tab span\").html(activeTab);\r\n");
      out.write("      $(\".previous-tab span\").html(previousTab);\r\n");
      out.write("   });});</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
