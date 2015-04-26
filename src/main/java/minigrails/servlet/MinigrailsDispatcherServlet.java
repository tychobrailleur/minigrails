package minigrails.servlet;

import org.apache.commons.io.IOUtils;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineFactory;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.script.ScriptContext;

import java.io.*;

import javax.servlet.http.*;
import javax.servlet.*;

public class MinigrailsDispatcherServlet extends HttpServlet {
    final ScriptEngine jruby = new ScriptEngineManager().getEngineByName("jruby");

    public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doProcess(req, res, "GET");
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response, String method) throws IOException {
        Object urlMapping = initUrlMappings();
        String requestUrl = request.getRequestURI();

        PrintWriter out = response.getWriter();

        out.println("Hello Minigrails! " + requestUrl + "\n " + method + " " + urlMapping);
        out.close();
    }

    private Object initUrlMappings() throws IOException {
        Object urlMapping = null;
        try {
            InputStream stream = getServletContext().getResourceAsStream("/WEB-INF/config/urlmappings.rb");
            StringWriter writer = new StringWriter();
            IOUtils.copy(stream, writer, "UTF-8");
            String content = writer.toString();

            urlMapping = jruby.eval(content);
        } catch (javax.script.ScriptException e) {
            System.err.println("Error evaluating ruby script. " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Error evaluating ruby script. " + e.getMessage());
        }

        return urlMapping;
    }
}
