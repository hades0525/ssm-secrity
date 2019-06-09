package com.itheima.controller;

import com.itheima.domian.Role;
import com.itheima.domian.UserInfo;
import com.itheima.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private IUserService iUserService;

    /*
    *查询所有用户
    * */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<UserInfo> userlist = iUserService.findAll();
        mv.addObject("userList", userlist);
        mv.setViewName("user-list");
        return mv;
    }

    /**
     * pre-post-annotations权限控制
     * 只有username为jack 才能用save.do
     * @param user
     * @return
     * @throws Exception
     */
    @PreAuthorize("authentication.principal.username=='jack'")
    @RequestMapping("/save.do")
    public String save(UserInfo user) throws Exception {
        iUserService.save(user);
        return "redirect:findAll.do";
    }


    @RequestMapping("findById.do")
    public ModelAndView findById(@RequestParam(value = "id",required = true) String id)throws Exception{
        UserInfo user = iUserService.findById(id);
        ModelAndView mv=new ModelAndView();
        mv.addObject("user",user);
        mv.setViewName("user-show");
        return mv;
    }
    /**
     * 查询用户以及对应的角色
     * */
    @RequestMapping("/findUserByIdAndAllRole.do")
    public ModelAndView findUserByIdAndAllRole(@RequestParam(value = "id",required = true) String id)throws Exception{
        //查询用户可添加的角色
        List<Role> otherRoles = iUserService.findOtherRoles(id);

        //查询用户
        UserInfo userInfo = iUserService.findById(id);

        ModelAndView mv=new ModelAndView();
        mv.addObject("roleList",otherRoles);
        mv.addObject("user",userInfo);
        mv.setViewName("user-role-add");
        return mv;
    }
    @RequestMapping("/addRoleToUser.do")
    public String addRoleToUser(@RequestParam(value = "userId",required = true) String id,@RequestParam(value = "ids",required = true)String[] ids)throws Exception{
        iUserService.addRoleToUser(id,ids);
        return "redirect:findAll.do";
    }
}
