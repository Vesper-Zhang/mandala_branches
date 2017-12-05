package com.stone.common.exception;

/**
 * FtpException 
 * @Description FTP异常
 * @author zhangxg
 * @version 1.0,2017年12月4日
 * @see
 * @since
 */
@SuppressWarnings("serial")
public class FtpException extends RuntimeException {
	public FtpException() {
	}

	public FtpException(String message) {
		super(message);
	}

	public FtpException(String message, Throwable throwable) {
		super(message, throwable);
	}
}
