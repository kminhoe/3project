package coffeeDao.common.logger;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Around;


@Aspect
public class LoggerAspect {
	
	protected Log log = LogFactory.getLog(LoggerAspect.class);
	static String name = "";
	static String type = "";
	
	@Around("execution(* CoffeeDAO..controller.*Controller.*(..)) or execution(* CoffeeDAO..service.*Impl.*(..)) or execution(* CoffeeDAO..dao.*DAO.*(..))")
	public Object logPrint(ProceedingJoinPoint jointPoint) throws Throwable	{
		type = jointPoint.getSignature().getDeclaringTypeName();
		
		if(type.indexOf("Controller") > -1) {
			name = "Controller \t :   ";
		} else if(type.indexOf("Service") > -1) {
			name = "Service \t :   ";
		} else if(type.indexOf("DAO") > -1) {
			name = "DAO \t :   ";
		}
		log.debug(name + type + "." + jointPoint.getSignature().getName() + "()");
		return jointPoint.proceed();
	}

}
