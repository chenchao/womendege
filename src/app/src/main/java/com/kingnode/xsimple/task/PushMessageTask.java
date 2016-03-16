package com.kingnode.xsimple.task;
import java.util.Date;

import com.kingnode.xsimple.service.safety.MessageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
/**
 * 推送信息任务
 * @author 448778074@qq.com (cici)
 */
@Component
public class PushMessageTask{
    private static Logger logger=LoggerFactory.getLogger(PushMessageTask.class);
    private MessageService messageService;
    /**
     * 0 0 1 1 * ? 每月1号上午1点0分触发,删除一个月以前的数据消息推送的数据
     */
    @Scheduled(cron="0 0 1 1 * ?")
    public void deletePushMessage(){
        logger.info("定时器开始,删除一个月以前的数据消息推送的数据,开始时间为{}..",new Date());
        //一个月以前的时间点
        Long time = System.currentTimeMillis()-1000*3600*24*30L;
        logger.info("删除的时间点数:{}",time);
        messageService.DeletePushMessage(time);
        logger.info("定时器结束,删除一个月以前的数据消息推送的数据,结束时间为{}..",new Date());
    }
}
