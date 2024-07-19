package jp.co.flm.market.web;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import jp.co.flm.market.common.MarketBusinessException;
import jp.co.flm.market.common.MarketSystemException;
import jp.co.flm.market.entity.Member;
import jp.co.flm.market.logic.MemberInfoLogic;
import jp.co.flm.market.logic.UpdateMemberLogic;

public class B0203UpdateMemberAction implements ActionIF {

    //入力値をチェックするメソッド
    public String validate(HttpServletRequest req) {
        String page = null;
        ArrayList<String> errorMessageList = new ArrayList<String>();

        String memberName = req.getParameter("memberName");
        String gender = req.getParameter("gender");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String currentPassword = req.getParameter("currentPassword");
        String newPassword = req.getParameter("newPassword");

        // 入力チェック（空チェックと文字数チェック）
        if (memberName == null || memberName.length() == 0) {
            errorMessageList.add("名前は入力必須項目です。");
        } else if (memberName.length() > 40) {
            errorMessageList.add("名前は40字以内で入力してください。");
        }

        if (gender == null || gender.length() == 0) {
            errorMessageList.add("性別は入力必須項目です。");
        }

        if (address == null || address.length() == 0) {
            errorMessageList.add("住所は入力必須項目です。");
        } else if (address.length() > 80) {
            errorMessageList.add("住所は80字以内で入力してください。");
        }

        if (phone == null || phone.length() == 0) {
            errorMessageList.add("電話番号は入力必須項目です。");
        } else if (phone.length() >= 14) {
            errorMessageList.add("電話番号は13字以内で入力してください。");
        }

        if (phone != null && !phone.matches("^[0-9\\-]+$")) {
            errorMessageList.add("電話番号は数字のみを入力してください。");
        }

        if (currentPassword == null || currentPassword.length() == 0) {
            errorMessageList.add("現在のパスワードは入力必須項目です。");
        }

        if (newPassword == null || newPassword.length() == 0) {
            errorMessageList.add("新しいパスワードは入力必須項目です。");
        } else if (newPassword.length() < 4 || newPassword.length() > 8) {
            errorMessageList.add("新しいパスワードは4文字以上8文字以内で入力してください。");
        }

        if (errorMessageList.size() != 0) {
            req.setAttribute("errorMessageList", errorMessageList);
            page = "member-update-view.jsp";
        }

        return page;
    }

    public String execute(HttpServletRequest req) {
        String page = null;

        // 会員更新の際、最初からエラー文が表示されるバグを防ぐため
        String CheckNull = req.getParameter("checknull");

        if (CheckNull != null ) {
            page = validate(req);
        } else {
            page ="member-update-view.jsp";
        }

        if (page == null) {
            try {
                HttpSession session = req.getSession(false);
                Member member = (Member) session.getAttribute("CommonLoginMember");

                // 更新する会員情報を取得する。
                String currentpassword = req.getParameter("currentPassword");
                String newpassword = req.getParameter("newPassword");
                String memberName = req.getParameter("memberName");
                String gender = req.getParameter("gender");
                String address = req.getParameter("address");
                String phone = req.getParameter("phone");
                String memberId =   member.getMemberId();

                member.setPassword(newpassword);
                member.setMemberName(memberName);
                member.setGender(gender);
                member.setAddress(address);
                member.setPhone(phone);

                UpdateMemberLogic logic = new UpdateMemberLogic();
                MemberInfoLogic infoLogic = new MemberInfoLogic();

                Member memberPass  = infoLogic.getMember(memberId, currentpassword);

                session.setAttribute("CommonLoginMember", member);

                if (memberPass != null) {
                    logic.updateMember(member);
                    page = "member-update-result-view.jsp";
                } else {
                    ArrayList<String> errorMessageList = new ArrayList<String>();
                    errorMessageList.add("今のパスワードが間違っています。");
                    page = "error.jsp";
                }

            } catch (MarketBusinessException e) {
                ArrayList<String> errorMessageList = new ArrayList<String>();
                errorMessageList.add(e.getMessage());
                req.setAttribute("errorMessageList", errorMessageList);
                page = "member-update-view.jsp";
            } catch (MarketSystemException e) {
                ArrayList<String> errorMessageList = new ArrayList<String>();
                errorMessageList.add(e.getMessage());
                req.setAttribute("errorMessageList", errorMessageList);
                page = "error.jsp";
            }
        }

        return page;
    }
}