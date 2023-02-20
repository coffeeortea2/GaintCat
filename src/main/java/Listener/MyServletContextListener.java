package Listener;

import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.ServiceLoader;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

public class MyServletContextListener implements ServletContextListener {

	/**
	 * Deregistered the JDBC drivers distributed with the application.
	 */
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		final ClassLoader cl = arg0.getServletContext().getClassLoader();
		final Enumeration<Driver> drivers = DriverManager.getDrivers();
		while (drivers.hasMoreElements()) {
			final Driver driver = drivers.nextElement();
			
			// deregister only the classes loaded by this application's classloader
			if (driver.getClass().getClassLoader() == cl) {
				try {
					DriverManager.deregisterDriver(driver);
				} catch (SQLException e) {
					arg0.getServletContext().log("JDBC Driver deregistration failure.", e);
				}
			}
		}

		AbandonedConnectionCleanupThread.checkedShutdown();
	}

	/**
	 * Registers the JDBC drivers distributed with the application.
	 */
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		Iterator<Driver> driversIterator = ServiceLoader.load(Driver.class).iterator();
		while (driversIterator.hasNext()) {
			try {
				// Instantiates the driver
				driversIterator.next();
			} catch (Throwable t) {
				arg0.getServletContext().log("JDBC Driver registration failure.", t);
			}
		}
	}
}
