package com.javaex.controller;



import com.javaex.dao.PhoneDao;
import com.javaex.util.WebUtil;
import com.javaex.vo.PersonVo;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PhoneController
 */
@WebServlet("/pbc")
public class PhoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		if("list".equals(action)) {

			PhoneDao dao = new PhoneDao();
			List<PersonVo> personList = dao.getPersonList();


			//데이타 리퀘스트에 추가
			request.setAttribute("pList", personList);

			//Forward
			WebUtil.forward(request,response,"/WEB-INF/list.jsp");

		/*} else if("wform".equals(action)) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/writeform.jsp");
			rd.forward(request, response);*/
		} else if("insert".equals(action)) {
			String name = request.getParameter("name");
			String hp = request.getParameter("hp");
			String company = request.getParameter("company");
			PersonVo personVo = new PersonVo(name,hp,company);

			PhoneDao dao = new PhoneDao();
			dao.personInsert(personVo);

			WebUtil.redirect(request,response,"/pb2/pbc?action=list");
		} else if("update".equals(action)) {

		} else if("delete".equals(action)) {

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
