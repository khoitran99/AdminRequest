/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

/**
 *
 * @author khoi.tranvan
 */
public class Utility {

    public static String formatToday() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("EEEE dd/MM/yyyy");
        LocalDateTime now = LocalDateTime.now();
        return dtf.format(now);
    }

    public static java.sql.Date getCurrentSQLDate() {
        // Get today as a Calendar
        Calendar today = Calendar.getInstance();
        // Make an SQL Date out of that
        return new java.sql.Date(today.getTimeInMillis());
    }

    public static java.sql.Date getLast2DaysSQLDate() {
        // Get today as a Calendar
        Calendar today = Calendar.getInstance();
        // Subtract 2 days
        today.add(Calendar.DATE, -2);
        // Make an SQL Date out of that
        return new java.sql.Date(today.getTimeInMillis());
    }

    public static java.sql.Date get7DaysSQLDate() {
        // Get today as a Calendar
        Calendar today = Calendar.getInstance();
        // Subtract 2 days
        today.add(Calendar.DATE, 7);
        // Make an SQL Date out of that
        return new java.sql.Date(today.getTimeInMillis());
    }
    public static java.sql.Date getTomorrow() {
        // Get today as a Calendar
        Calendar today = Calendar.getInstance();
        // Subtract 2 days
        today.add(Calendar.DATE, +1);
        // Make an SQL Date out of that
        return new java.sql.Date(today.getTimeInMillis());
    }
}
