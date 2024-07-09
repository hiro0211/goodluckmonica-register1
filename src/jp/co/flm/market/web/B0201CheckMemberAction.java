package jp.co.flm.market.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import jp.co.flm.market.common.MarketBusinessException;
import jp.co.flm.market.common.MarketSystemException;
import jp.co.flm.market.entity.Member;
import sun.jvm.hotspot.debugger.Page;

public class B0201CheckMemberAction {

    public void checkSession(HttpServletRequest req) throws MarketSystemException {
        HttpSession session = req.getSession(false);
        if (session == null) {
            session = req.getSession(true);
        }
        if (session == null) {
            throw new MarketSystemException("システムエラーが発生しました。システム管理者に連絡してください。");
        }
    }

    public String validate(HttpServletRequest req) throws MarketBusinessException {
        List<String> errorMessages = new ArrayList<>();

        String memberName = req.getParameter("memberName");
        String gender = req.getParameter("gender");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");

        if (isEmpty(memberName)) errorMessages.add("名前を入力必須項目です。");
        if (isEmpty(gender)) errorMessages.add("性別を入力必須項目です。");
        if (isEmpty(address)) errorMessages.add("住所を入力必須項目です。");
        if (isEmpty(phone)) errorMessages.add("電話番号を入力必須項目です。");
        if (isEmpty(password)) errorMessages.add("パスワードを入力必須項目です。");

        if (memberName != null && (memberName.length() < 1 || memberName.length() > 50))
            errorMessages.add("名前は1〜50文字で入力してください。");
        if (address != null && (address.length() < 1 || address.length() > 100))
            errorMessages.add("住所は1〜100文字で入力してください。");
        if (phone != null && (phone.length() < 1 || phone.length() > 20))
            errorMessages.add("電話番号は1〜20文字で入力してください。");
        if (password != null && (password.length() < 8 || password.length() > 20))
            errorMessages.add("パスワードは8〜20文字で入力してください。");

        if (!errorMessages.isEmpty()) {
            req.setAttribute("errorMessageList", errorMessages);
            return "member-register-input.jsp";
        }
        return null;
    }

    public String execute(HttpServletRequest req) throws MarketBusinessException, MarketSystemException {
        try {
            checkSession(req);

            String validationResult = validate(req);
            if (validationResult != null) {
                return validationResult;
            }

            String memberName = req.getParameter("memberName");
            String gender = req.getParameter("gender");
            String address = req.getParameter("address");
            String phone = req.getParameter("phone");
            String password = req.getParameter("password");

            Member member = new Member();
            member.setMemberName(memberName);
            member.setGender(gender);
            member.setAddress(address);
            member.setPhone(phone);
            member.setPassword(password);

            HttpSession session = req.getSession();
            session.setAttribute("memberInfo", member);

            page = "member-register-confirm-view.jsp";

            return page
        } catch (MarketSystemException e) {
            throw e;
        } catch (Exception e) {
            throw new MarketSystemException();
        }
    }

    private boolean isEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }
}