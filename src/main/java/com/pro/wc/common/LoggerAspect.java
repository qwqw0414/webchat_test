package com.pro.wc.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

// 메소드 인,아웃 로깅

@Component
@Aspect
public class LoggerAspect {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Pointcut("execution(* com.pro.wc..*.*(..))")
	public void pointcut() {}
	
	@Around("pointcut()")
	public Object loggerAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		Signature signature = joinPoint.getSignature();
		String type = signature.getDeclaringTypeName();
		String methodName = signature.getName();
		
//		클래스 경로 공통부 제거
		final String REP = "com.pro.wc.";
		type = type.replace(REP, "");
		
//		joinPoint 전에 실행
		logger.debug("[Start] {}.{}>", type, methodName);
		
//		joinPoint 실행
		Object obj = joinPoint.proceed();
		
//		joinPoint 후에 실행
		logger.debug("[End] {}.{}", type, methodName);
		
		return obj;
	}
	
	
}
