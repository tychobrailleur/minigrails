package minigrails.jetty;

import minigrails.conf.Config;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.webapp.WebAppContext;


public class StartServer {
    public void start(final Config conf) {

        try {
            Server server = new Server(conf.getServerPort());

            WebAppContext webapp = new WebAppContext();
            webapp.setContextPath("/");
            server.setHandler(webapp);

            server.start();
            server.join();
        } catch (Exception e) {
            System.err.println("Error starting server: " + e.getMessage());
        }
    }
}
