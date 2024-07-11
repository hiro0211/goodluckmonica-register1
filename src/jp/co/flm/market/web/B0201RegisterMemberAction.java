package jp.co.flm.market.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import jp.co.flm.market.common.MarketBusinessException;
import jp.co.flm.market.common.MarketSystemException;
import jp.co.flm.market.entity.Member;
import jp.co.flm.market.logic.RegisterMemberLogic;

public class B0201RegisterMemberAction {
    String page = null;
    public String execute(HttpServletRequest req) {
        // セッションを取得する。できなかった場合は新規作成する。
        HttpSession session = req.getSession(true);

        try {
            Member member = (Member) session.getAttribute("member");
//            String memberId = member.getMemberId();
//            String memberName = req.getParameter("memberName");
//            String gender = req.getParameter("gender");
//            String address = req.getParameter("address");
//            String phone = req.getParameter("phone");
//            String password = req.getParameter("password");

            RegisterMemberLogic logic= new RegisterMemberLogic();
//            member.setMemberName(memberName);
//            member.setAddress(address);
//            member.setPhone(phone);
//            member.setPassword(password);
//            member.setGender(gender);
//            member.setMemberId(memberId);

            logic.registerMember(member);
            req.setAttribute("member", member);
            page = "/member-register-result-view.jsp";

        } catch (MarketSystemException e) {
            // TODO: handle exception
            req.setAttribute("errorMessage", e.getMessage());
            page = "/error.jsp";
        } catch (Exception e) {
            // エラーページへ遷移する。
            req.setAttribute("errorMessage", "会員登録中にエラーが発生しました。");
            page = "/error.jsp";
        }

    return page;
 }
}