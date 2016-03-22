package com.kingnode.gou.alipay.config;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *版本：3.4
 *修改日期：2016-03-08
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 合作身份者ID，签约账号，以2088开头由16位纯数字组成的字符串，查看地址：https://b.alipay.com/order/pidAndKey.htm
	public static String partner = "2088021993993537";
	
	// 收款支付宝账号，以2088开头由16位纯数字组成的字符串，一般情况下收款账号就是签约账号
	public static String seller_id = partner;

	//商户的私钥,需要PKCS8格式，RSA公私钥生成：https://doc.open.alipay.com/doc2/detail.htm?spm=a219a.7629140.0.0.nBDxfy&treeId=58&articleId=103242&docType=1
	//public static String private_key = "";

	//商户的私钥
	/*static String a="MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAM83elx6dkGhk3Gh1xN9zxeOpaiZFTBavWEJJ5wBHXlTuUvsVMv/0brILvPRE8jaAwH1oVY9pRLCKY0tvkbqVhWYBaLR" +
			"+PJtPAHioEwRFQ7XTZiNltIGONakZbysKI2B05+Vbd8jzAl8zc/Loc570QpdslLBKozdDB3M0tjjuUodAgMBAAECgYEAoekvauMlU9L0am2SqGA9WKLVPg+fRtEf+Jo2oOceKJcKyhA3kc6qCdAxH8HWO7Jdd0J
			+dexk92tPHEkJzE9+QqkjfQwD3TGKomgbIv+sdZtBg6jaaBB/Bsmz4poOZ591xCtxCbWScSn14NbzKLYk+wugaFgPzOE2vhN/o8/KJAECQQDsHbrvZ4UdDvTWoKHV6I8EYisvfe5PvJ+TYPaInriu
			+dWunmGYRgQ3n5z3PD8dsuN/BfYOCF5bidOlDrFtkVDhAkEA4Kq5dGu09HiekgewLRlGol8icosv4uw9veX1D9EDBu+G8i7FD4/nxdhbo5/VJnVAlTAAbosj+4MDWu39tf8UvQJABJjfluGxGcu8wKEIBZ4tiqxOovIUvcCyarAsnKRafC2pF2lGBSz30A1vhPDLWcyt2T9IdyV6kNWyJTiQA84cgQJBAIT45x0d5pNPlOLvg/mdXS4bSqMq+GPB2WU85se+uKDxQhizT9U/Ijn6LXrxzdGeUmQ6bfb/iYOCbojyFVkTqa0CQQDnS002Ddrxu+Qh5korklPZhfLal35cBwEDS4aIBeDDjH/0uhUeFbqWisF+tabEPyIHuvTbTHyMW8zQ+ytavMtp";*/

	static String e = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKkROCOFYh" +
			"+oBATm5v9yPoi3k8fz0G5V2Zq9cQTFbdDAr6cJvgvyOiRdMgTOCRNYFWaYNQmLqekGG2dX8MVLfjtTTGiaKYNxAbwpFDjGGEGXpJwoE7FSQab/p5Gf3FYBw+pXJgVetT61csgnbCDRpMD2+33MkQ7tF+B3gUsTcRrXAgMBAAECgYAIfroAZupYRtv01xlSSo5D1l2RlXmqoZuuf8hXAgiTjasFzKKE/SXYv+oMfcHM/AcPQaSglyjxcYIc/jk14KY2BfiEYYuYczZriIFCV/qywiQCveK9rD1S0Bp28VlKkwmqIgfkOVIQn8ZLk5Fq2GqHxkYXbgzw7CcjtjCFDQtbAQJBANuNEp5Vv7WhG2JTd+m5PzjgYA7aYemIVbwGI9i18bJeYhkQMZ1BP067m8Ssx68XH119HJzfeR9mFsJZnot5oVcCQQDFIpVWZZs+dVOp2XyWAzfKYKh6IQL91K2WP1EHRI+p8ibbbjLQ5qtgRPHvdWJ6D12Xe5qgJ9SwOdg4NS6gCOKBAkEAi4TPsxzM0jBKRabDShy1h4BWqrmuhQhlazH/r6SXroD6F/FJhiRDhdYE++vMjYDFJtTtzObagtCOX/0xmnK1ywJAAlG01g5d9C8nK9FeMNma12upr74hreDJpgHary40TniF0oEKYgDEtV46RmnoHa1+mWCf4hB15RjZHVgq00EngQJAd8sncNYvt+yi0VaKl+7EE6qdPPmqpKSRFpIty7AN6+1UfKUzfqoVZxGw3Md6LP93g+7retxUVZwRd5ZKS1oqzg==";
	static String c="MIICXAIBAAKBgQCpETgjhWIfqAQE5ub/cj6It5PH89BuVdmavXEExW3QwK+nCb4L8jokXTIEzgkTWBVmmDUJi6npBhtnV/DFS347U0xomimDcQG8KRQ4xhhBl6ScKBOxUkGm/6eRn9xWAcPqVyYFXrU+tXLIJ2wg0aTA9vt9zJEO7Rfgd4FLE3Ea1wIDAQABAoGACH66AGbqWEbb9NcZUkqOQ9ZdkZV5qqGbrn/IVwIIk42rBcyihP0l2L/qDH3BzPwHD0GkoJco8XGCHP45NeCmNgX4hGGLmHM2a4iBQlf6ssIkAr3ivaw9UtAadvFZSpMJqiIH5DlSEJ/GS5ORathqh8ZGF24M8OwnI7YwhQ0LWwECQQDbjRKeVb+1oRtiU3fpuT844GAO2mHpiFW8BiPYtfGyXmIZEDGdQT9Ou5vErMevFx9dfRyc33kfZhbCWZ6LeaFXAkEAxSKVVmWbPnVTqdl8lgM3ymCoeiEC/dStlj9RB0SPqfIm224y0OarYETx73Vieg9dl3uaoCfUsDnYODUuoAjigQJBAIuEz7MczNIwSkWmw0octYeAVqq5roUIZWsx/6+kl66A+hfxSYYkQ4XWBPvrzI2AxSbU7czm2oLQjl/9MZpytcsCQAJRtNYOXfQvJyvRXjDZmtdrqa++Ia3gyaYB2q8uNE54hdKBCmIAxLVeOkZp6B2tfplgn+IQdeUY2R1YKtNBJ4ECQHfLJ3DWL7fsotFWipfuxBOqnTz5qqSkkRaSLcuwDevtVHylM36qFWcRsNzHeiz/d4Pu63rcVFWcEXeWSktaKs4=";


	//商户的私钥,需要PKCS8格式，RSA公私钥生成：https://doc.open.alipay.com/doc2/detail.htm?spm=a219a.7629140.0.0.nBDxfy&treeId=58&articleId=103242&docType=1
	public static String private_key = e;

	String b = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnkkCxmlZf+OmxctZN2sP2jy8lpatce5ihibS4FgHhC0k5t8mdPDEaVMUeopW7anH0jYN12bmrBcpeMFio91/Wa/ODBgjQqDAA1P6UF1lyI50ZgIq5ufFK3riiLf5f1/m2/3XC88jtES7lxUJi0ye+SqLW1E+wV8DAqBDjWWGvqQIDAQAB";

	String d = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCpETgjhWIfqAQE5ub/cj6It5PH89BuVdmavXEExW3QwK+nCb4L8jokXTIEzgkTWBVmmDUJi6npBhtnV/DFS347U0xomimDcQG8KRQ4xhhBl6ScKBOxUkGm/6eRn9xWAcPqVyYFXrU+tXLIJ2wg0aTA9vt9zJEO7Rfgd4FLE3Ea1wIDAQAB";
	
	// 支付宝的公钥,查看地址：https://b.alipay.com/order/pidAndKey.htm
	public static String alipay_public_key  = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://27.38.41.8/create_direct_pay_by_user-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://27.38.41.8/create_direct_pay_by_user-JAVA-UTF-8/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA";
	
	// 调试用，创建TXT日志文件夹路径，见AlipayCore.java类中的logResult(String sWord)打印方法。
	public static String log_path = "C:\\";
		
	// 字符编码格式 目前支持 gbk 或 utf-8
	public static String input_charset = "utf-8";
		
	// 支付类型 ，无需修改
	public static String payment_type = "1";
		
	// 调用的接口名，无需修改
	public static String service = "create_direct_pay_by_user";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
	
//↓↓↓↓↓↓↓↓↓↓ 请在这里配置防钓鱼信息，如果没开通防钓鱼功能，为空即可 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	
	// 防钓鱼时间戳  若要使用请调用类文件submit中的query_timestamp函数
	public static String anti_phishing_key ="";
	
	// 客户端的IP地址 非局域网的外网IP地址，如：221.0.0.1
	public static String exter_invoke_ip = "27.38.41.8";
		
//↑↑↑↑↑↑↑↑↑↑请在这里配置防钓鱼信息，如果没开通防钓鱼功能，为空即可 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
	
}

