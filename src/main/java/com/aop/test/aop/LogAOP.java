package com.aop.test.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Aspect
@Component
@Slf4j
public class LogAOP {
	@Pointcut("within(@org.springframework.web.bind.annotation.RestController *)")
	public void restController() {}
	
	@Around("restController()")
	public Object around(ProceedingJoinPoint pjp) throws Throwable {
		String className = pjp.getTarget().getClass().getName();
		String method = pjp.getSignature().getName();
		Object[] args = pjp.getArgs();
		log.info("before {}.{}({})", className, method, args);
		Object obj = pjp.proceed();
		log.info("after {}.{} => {}", className, method, obj);
		return obj;
		
	}
}
