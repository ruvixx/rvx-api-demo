/*
 * Copyright (c) 2014 Authentic Vision GmbH All Rights Reserved.
 *
 * This software is the confidential and proprietary information of Authentic Vision GmbH. ("Confidential Information").
 * You shall not disclose such Confidential Information and shall use it only in accordance with the terms of the license agreement you entered into with Authentic Vision GmbH.
 */

package at.avdev.ruvixx.utils;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;

public class Tools
{
    public static String getStackTrace(Exception e)
    {
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        e.printStackTrace(pw);
        return sw.toString();
    }

    public static String toHTTPDateString(Date date)
    {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z", Locale.US);
        dateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
        return dateFormat.format(calendar.getTime());
    }

    public static String MD5(String md5)
    {
        try
        {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] array = md.digest(md5.getBytes("UTF-8"));

            return Base64.getEncoder().encodeToString(array);
        }
        catch (Exception e)
        {
            return null;
        }
    }
}