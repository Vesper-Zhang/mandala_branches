package com.stone.common.exception;

import com.stone.common.support.HttpCode;

/**
 * IllegalParameterException 
 * @Description TODO{功能详细描述}
 * @author zhangxg
 * @version 1.0,2017年12月4日
 * @see
 * @since
 */
@SuppressWarnings("serial")
public class IllegalParameterException extends BaseException {
	public IllegalParameterException() {
	}

	public IllegalParameterException(Throwable ex) {
		super(ex);
	}

	public IllegalParameterException(String message) {
		super(message);
	}

	public IllegalParameterException(String message, Throwable ex) {
		super(message, ex);
	}

	protected HttpCode getHttpCode() {
		return HttpCode.BAD_REQUEST;
	}
}
