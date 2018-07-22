package com.travel.manager.exception;

import com.travel.common.utils.JsonUtil;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TravelExceptionHandler implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        String msg = ex.getMessage();
        if (response.isCommitted()) {
            return null;
        }
        if (isAjax(request)) {
            MappingJackson2JsonView JSON_VIEW = new MappingJackson2JsonView();
            return new ModelAndView(JSON_VIEW, JsonUtil.getErrorMsg(msg));
        } else {
            request.setAttribute("errorMsg", msg);
            return new ModelAndView("/pages/error.jsp");
        }
    }

    /**
     * 判断请求是不是ajax请求
     */
    public static boolean isAjax(HttpServletRequest request) {
        return "XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With")) || request.getParameter("ajax") != null;
    }
    }

