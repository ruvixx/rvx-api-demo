/*
 * Copyright (c) 2014 Authentic Vision GmbH All Rights Reserved.
 *
 * This software is the confidential and proprietary information of Authentic Vision GmbH. ("Confidential Information").
 * You shall not disclose such Confidential Information and shall use it only in accordance with the terms of the license agreement you entered into with Authentic Vision GmbH.
 */

package at.avdev.ruvixx.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

public class ApiServiceImpl implements ApiService
{
    private static final Logger LOG = LoggerFactory.getLogger(ApiServiceImpl.class);


    @Override
    public String calculateSignature(String secret, String timestamp, String url, String md5, String contentType)
    {
        try
        {
            // calculate signature
            Mac sha1HMAC = Mac.getInstance("HmacSHA1");
            SecretKeySpec secretKey = new SecretKeySpec(secret.getBytes("UTF-8"), "HmacSHA1");
            sha1HMAC.init(secretKey);

            String headers = contentType + "," + md5 + "," + url + "," + timestamp;
            return toBase64(sha1HMAC.doFinal(headers.getBytes("UTF-8")));
        }
        catch (Exception e)
        {
            e.printStackTrace();
            LOG.error(e.getClass().getName() + " " + e.getMessage() + ":\n" + Tools.getStackTrace(e));
            return null;
        }
    }


    private String toBase64(byte[] array)
    {
        return Base64.getEncoder().encodeToString(array);
    }
}