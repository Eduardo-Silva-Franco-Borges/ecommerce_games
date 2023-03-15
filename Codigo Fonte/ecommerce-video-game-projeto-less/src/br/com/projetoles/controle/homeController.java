package br.com.projetoles.controle;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetoles.dao.ProdutoDAO;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Produto;
import br.com.projetoles.domain.Result;


@WebServlet(urlPatterns = { "/home"})
public class homeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public homeController() {
        super();
        
    }
    
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	ProdutoDAO produtosDAO = new ProdutoDAO();
    	Produto produtos = new Produto();
    	
    	
    	List<EntidadeDominio> result =  produtosDAO.consultar(produtos);
    	
    	
    	
    	if(req.getParameter("operacao") != null) {
    		if(req.getParameter("operacao").equals("Login")){
    			String user = req.getParameter("username");
    			
    			if(user != null) {
    				Cookie cookie = new Cookie ("nomeUsuario",user);
    				cookie.setMaxAge(60*60*24*31);
    				resp.addCookie(cookie);
    				
    			}
    			
    			Cookie[] cookies = req.getCookies();
    			for(Cookie atual: cookies){
    				if(atual.getName().equals("nomeUsuario")){
    					user = atual.getValue();
    				}
    			}
    			req.setAttribute("result", result);
    			req.getRequestDispatcher("/WEB-INF/index.jsp").forward(req,resp);
    		}
    		if(req.getParameter("operacao").equals("logout")){
    			String user = "";
    			
    			Cookie cookie = new Cookie ("nomeUsuario",user);
    			cookie.setMaxAge(60*60*24*31);
    			resp.addCookie(cookie);
    			
    			req.setAttribute("result", result);
    			req.getRequestDispatcher("/WEB-INF/index.jsp").forward(req,resp);
    		}
    	}else {
    		req.setAttribute("result", result);
			req.getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
		}
    	
    	
    	
    	
    	
    	
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
