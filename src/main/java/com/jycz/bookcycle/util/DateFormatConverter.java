package com.jycz.bookcycle.util;

import org.apache.struts2.util.StrutsTypeConverter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

public class DateFormatConverter extends StrutsTypeConverter {

    private static final String DATE_FORMAT = "yyyy/MM/dd HH:mm:ss";

    @Override
    public Object convertFromString(Map context, String[] values, Class toClass) {
        if (values != null && values.length > 0) {
            String dateString = values[0];
            SimpleDateFormat formatter = new SimpleDateFormat(DATE_FORMAT);
            try {
                return formatter.parse(dateString);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public String convertToString(Map context, Object object) {
        if (object instanceof Date) {
            SimpleDateFormat formatter = new SimpleDateFormat(DATE_FORMAT);
            return formatter.format((Date) object);
        }
        return null;
    }
}

