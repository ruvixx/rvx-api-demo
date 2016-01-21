/*
 * Copyright (c) 2014 Authentic Vision GmbH All Rights Reserved.
 *
 * This software is the confidential and proprietary information of Authentic Vision GmbH. ("Confidential Information").
 * You shall not disclose such Confidential Information and shall use it only in accordance with the terms of the license agreement you entered into with Authentic Vision GmbH.
 */

package at.avdev.ruvixx.utils;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class JsonDateSerializer extends JsonSerializer<Date>
{
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    public void serialize(Date date, JsonGenerator gen, SerializerProvider provider) throws IOException
    {
        sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
        gen.writeString(sdf.format(date));
    }


}
