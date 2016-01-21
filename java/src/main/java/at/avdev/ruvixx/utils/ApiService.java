/*
 * Copyright (c) 2014 Authentic Vision GmbH All Rights Reserved.
 *
 * This software is the confidential and proprietary information of Authentic Vision GmbH. ("Confidential Information").
 * You shall not disclose such Confidential Information and shall use it only in accordance with the terms of the license agreement you entered into with Authentic Vision GmbH.
 */

package at.avdev.ruvixx.utils;

import org.springframework.stereotype.Service;

@Service
public interface ApiService
{
    String calculateSignature(String secret, String timestamp, String url, String md5, String contentType);
}
