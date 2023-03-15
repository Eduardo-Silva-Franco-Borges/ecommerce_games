package br.com.projetoles.controle;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;

import br.com.projetoles.command.CreateCommand;
import br.com.projetoles.command.DeleteCommand;
import br.com.projetoles.command.ICommand;
import br.com.projetoles.command.ReadCommand;
import br.com.projetoles.command.UpdateCommand;
import br.com.projetoles.viewHelper.IViewHelper;



public class HttpServletController extends HttpServlet {

	
	private static final long serialVersionUID = -484494403602038668L;
	private Map<String, ICommand> commands;
	private Map<String, IViewHelper> viewHelpers;

	public HttpServletController(String className, IViewHelper vh) {
		commands = new HashMap<String, ICommand>();
		viewHelpers = new HashMap<String, IViewHelper>();
		
		commands.put("Criacao", new CreateCommand());
		commands.put("Leitura", new ReadCommand());
		commands.put("Atualizacao", new UpdateCommand());
		commands.put("Exclusao", new DeleteCommand());
		
		
		if (className.equals("usuario")) {
			viewHelpers.put(this.getVHURL(className, "Criacao"), vh);
			viewHelpers.put(this.getVHURL(className, "Leitura"), vh);
			viewHelpers.put(this.getVHURL(className, "Atualizacao"), vh);
			viewHelpers.put(this.getVHURL(className, "Exclusao"), vh);
		}else if (className.equals("endereco")){
			viewHelpers.put(this.getVHURL(className, "Criacao"), vh);
			viewHelpers.put(this.getVHURL(className, "Leitura"), vh);
			viewHelpers.put(this.getVHURL(className, "Atualizacao"), vh);
			viewHelpers.put(this.getVHURL(className, "Exclusao"), vh);
		}else if (className.equals("cartao")){
			viewHelpers.put(this.getVHURL(className, "Criacao"), vh);
			viewHelpers.put(this.getVHURL(className, "Leitura"), vh);
			viewHelpers.put(this.getVHURL(className, "Atualizacao"), vh);
			viewHelpers.put(this.getVHURL(className, "Exclusao"), vh);
		}
		
	}

	private String getVHURL(String className, String command) {
		String projectName = "/ecommerce-video-game-projeto-less/";
		
		return new StringBuilder(projectName).append(className).append(command).toString();
	}

	protected Map<String, ICommand> getCommands() {
		return this.commands;
	}

	protected Map<String, IViewHelper> getViewHelpers() {
		return this.viewHelpers;
	}

}
