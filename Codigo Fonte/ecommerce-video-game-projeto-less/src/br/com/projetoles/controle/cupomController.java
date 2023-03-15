package br.com.projetoles.controle;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetoles.dao.CupomDAO;
import br.com.projetoles.domain.Cliente;
import br.com.projetoles.domain.Cupom;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Pessoa;


@WebServlet(urlPatterns = { "/cupom","/AdicionarCupom"})
public class cupomController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public cupomController() {
        super();
    }
    
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	String uri = req.getRequestURI();
    	String action = uri.substring(uri.lastIndexOf('/') + 1).replace("Cupom", "");
    	
    		if(action.equals("Adicionar")) {
    			
    			Cupom cupom = new Cupom();
    			CupomDAO cupomDAO = new CupomDAO();		
    			cupom.setAtivo(1);
    			cupom.setIdCliente(Integer.parseInt(req.getParameter("idClienteCupom")));
    			cupom.setNomeCupom(req.getParameter("nomeCupom"));
    			cupom.setValor(Double.parseDouble(req.getParameter("valorCupom")));
    			
    			cupomDAO.salvar(cupom);
    			
    			
    			req.getRequestDispatcher("/usuarioLeituraLogin").forward(req, resp);
    		}else {
    			List<EntidadeDominio> cupons = new ArrayList<>();
        		
        		CupomDAO cupomDAO = new CupomDAO();
        		Pessoa pessoa = new Pessoa();
        		Cliente cliente = new Cliente();
        		cliente.setId_cli(1);
        		pessoa.setCliente(cliente);
        		cupons = cupomDAO.consultar(pessoa);
        		
        		
        		req.setAttribute("cupons", cupons);
        		
    			req.getRequestDispatcher("/WEB-INF/cupom.jsp").forward(req, resp);
    		}
    		
    	
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
