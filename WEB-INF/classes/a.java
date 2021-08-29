import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class a extends HttpServlet
{
public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
{
	PrintWriter out=res.getWriter();
	out.println("hello");
}
}