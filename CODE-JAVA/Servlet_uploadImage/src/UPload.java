//import java.io.IOException;
//import java.io.PrintWriter;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class UPload extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UPload() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		FileItemFactory factory=new DiskFileItemFactory();		//’Î∂‘¥≈≈ÃŒƒº˛¥¥Ω®π§≥ß
		ServletFileUpload upload=new ServletFileUpload(factory);//Õ®π˝factory¥¥Ω®“ª∏ˆServletFileUpload
		upload.setHeaderEncoding("UTF-8");//…Ë≥…ƒ„µƒ±‡¬Î∏Ò Ω
		try {
			List items=upload.parseRequest(request);  //Ω‚Œˆ«Î«Û£¨ªÒµ√±Ìµ•…œµƒ“ª–©—°œÓ°£
			Iterator iter=items.iterator();
			while(iter.hasNext()){
				FileItem item=(FileItem)iter.next();  //»°≥ˆ∑‚◊∞≥…Œƒº˛—°œÓ
				
				if(!item.isFormField()){		//≈–∂œ“ª∏ˆ≤Œ ˝”Ú «∆’Õ®µƒ±Ìµ• ‰»Î”Ú,ªπ «Œƒº˛…œ¥´”Ú
					String fullFileName=item.getName(); //µ√µΩ“™…œ¥´µƒŒƒº˛µƒæ¯∂‘¬∑æ∂
					System.out.println(fullFileName);
					int idx=fullFileName.lastIndexOf(".");//’“µΩ.µƒÀ˜“˝∫≈
					String subfix=fullFileName.substring(idx);//Ωÿ»°Œƒº˛»´¬∑æ∂
					String fileName=new Date().getTime()+subfix;
					
					String path="/Users/bss/Desktop/upload/";//ππΩ®…œ¥´¬∑æ∂
					File f=new File(path+"/");
					if (!f.exists()) {
						f.mkdirs();
					}
					try {
						item.write(new File(path+"/"+fileName));			//–¥»ÎŒƒº˛¬∑æ∂
					} catch (Exception e) {
						e.printStackTrace();
					}	
				}	
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
