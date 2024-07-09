package jp.co.flm.market.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import jp.co.flm.market.logic.RegisterMemberLogic;

public class B0201RegisterMemberAction {
    public String execute(HttpServletRequest request){{
        String page = "";

        try {
            HttpSession session = request.getSession();
            String memberId = (String) session.getAttribute("memberId");
            String memberName = request.getParameter("memberName");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");

            RegisterMemberLogic logic= new RegisterMemberLogic();


        }  finally {

        }
    }
    return null;
 }
}