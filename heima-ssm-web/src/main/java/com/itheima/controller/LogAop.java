package com.itheima.controller;

import com.itheima.domian.SysLog;
import com.itheima.service.ISysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.Date;

@Component
@Aspect
public class LogAop {
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private ISysLogService sysLogService;

    private Date startTime; // 访问时间
    private Class executionClass;// 访问的类
    private Method executionMethod; // 访问的方法


    /**
     * 前置通知
     * 获取 开始时间 执行的类  访问的方法
     * @param jp
     * @throws NoSuchMethodException
     */
    @Before("execution(* com.itheima.controller.*.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        startTime = new Date();//获取访问时间
        executionClass = jp.getTarget().getClass();//获取访问的类
        String methodName = jp.getSignature().getName();//获取访问的方法的名称
        Object[] args = jp.getArgs();//获取访问的方法的参数
        if (args == null || args.length == 0) {
            executionMethod = executionClass.getMethod(methodName);//获取无参方法
        } else {
            Class[] classArgs = new Class[args.length];
            for (int i = 0; i < args.length; i++) {
                classArgs[i] = args[i].getClass();//将参数转为字节码对象存入class数组中
            }
            executionMethod = executionClass.getMethod(methodName, classArgs);//获取有参数的方法
        }
    }

    /**
     * 后置通知
     *  主要获取日志中其它信息，时长、ip、url...
     * @param jp
     * @throws Exception
     */

    @After("execution(* com.itheima.controller.*.*(..))")
    public void doAfter(JoinPoint jp) throws Exception {

        if (executionClass != LogAop.class) {

            // 获取类上的@RequestMapping对象
            RequestMapping classannotation = (RequestMapping) executionClass.getAnnotation(RequestMapping.class);
            if (classannotation != null) {
                // 获取方法上的@RequestMapping对象
                RequestMapping methodAnnotation = executionMethod.getAnnotation(RequestMapping.class);
                if (methodAnnotation != null) {

                    String url = "";
                    SysLog sysLog = new SysLog();

                    //获取访问的路径
                    url = classannotation.value()[0] + methodAnnotation.value()[0];
                    sysLog.setUrl(url);

                    //获取访问的时长
                    Long executionTime = new Date().getTime() - startTime.getTime();

                    sysLog.setExecutionTime(executionTime);

                    //获取访问的ip
                    String ip = request.getRemoteAddr();
                    sysLog.setIp(ip);

                    //获取当前的用户名
                    SecurityContext context = SecurityContextHolder.getContext();
                    User user = (User) (context.getAuthentication().getPrincipal());
                    String username = user.getUsername();
                    sysLog.setUsername(username);

                    sysLog.setMethod("[类名]" + executionClass.getName() + " [方法名]" + executionMethod.getName());

                    sysLog.setVisitTime(startTime);

                    // 调用Service，调用dao将sysLog insert数据库
                    sysLogService.save(sysLog);
                }
            }



        }

    }
}
