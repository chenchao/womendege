package com.kingnode.xsimple.util.MSM;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import com.kingnode.xsimple.util.ReadPropfileUtil;
import com.kingnode.xsimple.util.Utils;
import com.kingnode.xsimple.util.xml.XmlUtil;
import org.assertj.core.util.Strings;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 *
 * @author Administrator
 */
public class SMSUtil {
    public static final int codeValid=10*60*1000;
    private static SMSUtil smsUtil=null;
    private final Logger log=LoggerFactory.getLogger(SMSUtil.class);
    private String sendMsgAccount=ReadPropfileUtil.getInstall().prop.getProperty("sendMsgAccount"); // 短信发送接口的用户名
    private String sendMsgPwd=ReadPropfileUtil.getInstall().prop.getProperty("sendMsgPwd");// 短信发送接口的密码
    private String sendMsgID=ReadPropfileUtil.getInstall().prop.getProperty("sendMsgID");// 企业id
    private String sendMsgContent=ReadPropfileUtil.getInstall().prop.getProperty("sendMsgContent");// 短信发送内容
    private SMSUtil(){
    }
    public static SMSUtil getInstall(){
        if(null==smsUtil){
            synchronized(SMSUtil.class){
                if(smsUtil==null){
                    smsUtil=new SMSUtil();
                }
            }
        }
        return smsUtil;
    }
    /**
     * 根据手机号和验证码信息发送短信信息
     * @param phone 手机号
     * @param codeNum  验证码
     * @return 短信发送状态,true表示发送成功,false表示发送失败
     */
    public void sendAuthCode(String phone,String codeNum)throws Exception{
        UegateSoap uegatesoap = new  UegateSoap();
        String msg=sendMsgContent.replace("${codeNum}",codeNum);
        String sendResult=uegatesoap.Submit(sendMsgAccount,sendMsgPwd, sendMsgID, msg, phone);
        System.out.println("短信返回："+sendResult);
        if(sendResult!=null&&sendResult.startsWith("0")){
            return;
        }
        log.info("短信返回："+sendResult);
        throw new Exception("短信发送失败");
    }

}
