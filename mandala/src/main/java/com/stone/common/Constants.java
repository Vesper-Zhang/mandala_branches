package com.stone.common;


/**
 * Constants 
 * @Description 常量表
 * @author zhangxg
 * @version 1.0,2017年12月4日
 * @see
 * @since
 */
public interface Constants {
	/**
	 * 异常信息统一头信息<br>
	 * 非常遗憾的通知您,程序发生了异常
	 */
	public static final String Exception_Head = "OH,MY GOD! SOME ERRORS OCCURED! AS FOLLOWS :";
	/** 客户端语言 */
	public static final String USERLANGUAGE = "userLanguage";
	/** 客户端主题 */
	public static final String WEBTHEME = "webTheme";
	/** 当前用户 */
	public static final String CURRENT_USER = "CURRENT_USER";
	/** 系统身份 */
	public static final String CURRENT_IDENTITY = "CURRENT_IDENTITY";
	/** 当前用户对应系统身份实体数据表信息ID */
	public static final Object CURRENT_ENTITY_ID = "CURRENT_ENTITY_ID";
	/** 在线用户数量 */
	public static final String ALLUSER_NUMBER = "ALLUSER_NUMBER";
	/** 登录用户数量 */
	public static final String USER_NUMBER = "USER_NUMBER";
	/** 上次请求地址 */
	public static final String PREREQUEST = "PREREQUEST";
	/** 上次请求时间 */
	public static final String PREREQUEST_TIME = "PREREQUEST_TIME";
	/** 非法请求次数 */
	public static final String MALICIOUS_REQUEST_TIMES = "MALICIOUS_REQUEST_TIMES";
	/** 缓存命名空间 */
	public static final String CACHE_NAMESPACE = "larkCommu:";
	
	public static final String SESSION_DISTRIBUTED_SESSIONID = "session:distributed:"; //分布式session sessionid -- sessionvalue

    public static final Integer SESSION_TIMEOUT = 1800; //session 失效时间2小时
    
    public static final String USER_SESSION_KEY = "user_session_key";//用户session信息

    public static final String JSESSIONID = "JSESSIONID"; //jsessionid
}
