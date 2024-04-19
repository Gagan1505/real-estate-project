package com.xworkz.real_estate_app;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class LoggingWork {
    private static Logger logger = LogManager.getLogger(LoggingWork.class);


    public static void main(String[] args) {
        BasicConfigurator.configure();
        logger.info("Success logging");
        logger.error("Error message");
    }
}
