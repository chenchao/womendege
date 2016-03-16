package com.kingnode.xsimple.util.dete;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.google.common.collect.Lists;
/**
 * 类说明：日期的相关处理
 * @author cici
 */
public class DateUtil{
    private static DateUtil dateUtil;
    private DateUtil(){
    }
    /**
     * 获取DateUtil实例
     */
    public static DateUtil getInstance(){
        if(dateUtil==null){
            synchronized(DateUtil.class){
                if(dateUtil==null){
                    dateUtil=new DateUtil();
                }
            }
        }
        return dateUtil;
    }
    /**
     * 根据传入的日期格式化输出
     * yyyy-MM-dd 的字符串时间
     *
     * @param date      时间
     * @param formatStr yyyy-MM-dd等时间串
     *
     * @return
     */
    public String formatDate(Date date,String formatStr){
        SimpleDateFormat formatter=new SimpleDateFormat(formatStr);
        String outDate=formatter.format(date);
        return outDate;
    }
    /**
     * 将传入的字符串转化为对应的日期格式
     *
     * @param s          时间字符串
     * @param formateStr 格式化的时间格式
     *
     * @return
     */
    public Date parseDate(String s,String formateStr){
        SimpleDateFormat formatter=new SimpleDateFormat(formateStr);
        Date date;
        try{
            date=formatter.parse(s);
            return date;
        }catch(ParseException e){
            e.printStackTrace();
        }
        return null;
    }
    /**
     * 比较两个时间的大小
     *
     * @param dateTime1 时间1
     * @param dateTime2 时间2
     *
     * @return 0 表示相等,返回 1 表示日期1>日期2,返回 -1 表示日期1<日期2
     */
    public int compareDate(Date dateTime1,Date dateTime2){
        return dateTime1.compareTo(dateTime2);
    }
    /**
     * 比较两个时间的大小
     *
     * @param dateTime1 时间1
     * @param dateTime2 时间2
     * @param formatStr 格式化时间
     *
     * @return 0 表示相等,返回 1 表示日期1>日期2,返回 -1 表示日期1<日期2
     */
    public int compareDate(Date dateTime1,Date dateTime2,String formatStr){
        String t1=formatDate(dateTime1,formatStr);
        String t2=formatDate(dateTime2,formatStr);
        return compareDate(parseDate(t1,formatStr),parseDate(t2,formatStr));
    }
    /**
     * 比较多个时间的大小,获取比时间大的或者时间小的集合
     *
     * @param date      被比较时间
     * @param dateList  比较的时间集合
     * @param formatStr 格式化时间
     * @param flag      true表示获取大的,false表示获取小的
     *
     * @return 时间结果集
     */
    public List<Date> maxOrMinDate(Date date,List<Date> dateList,String formatStr,boolean flag){
        List<Date> resultDate =Lists.newArrayList();
        String t1=formatDate(date,formatStr);
        if(flag){//获取大的
            for(Date d:dateList){
                String t2=formatDate(d,formatStr);
                if(compareDate(parseDate(t1,formatStr),parseDate(t2,formatStr))==-1){
                    resultDate.add(d);
                }
            }
        }else{//获取小的
            for(Date d:dateList){
                String t2=formatDate(d,formatStr);
                if(compareDate(parseDate(t1,formatStr),parseDate(t2,formatStr))==1){
                    resultDate.add(d);
                }
            }
        }
        return resultDate;
    }
}

