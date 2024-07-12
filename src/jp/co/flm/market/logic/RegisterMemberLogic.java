package jp.co.flm.market.logic;
 
import jp.co.flm.market.entity.Member;
 
import java.sql.Connection;
import java.sql.SQLException;
 
import jp.co.flm.market.common.MarketBusinessException;
import jp.co.flm.market.common.MarketSystemException;
import jp.co.flm.market.dao.ConnectionManager;
import jp.co.flm.market.dao.MemberDAO;
 
public class RegisterMemberLogic {
    public void registerMember(Member member) throws MarketSystemException{
        Connection con = null;
        try {
            con =ConnectionManager.getConnection();
 
            //オートコミットの解除
            con.setAutoCommit(false);
 
            MemberDAO memberDAO = new MemberDAO(con);
            memberDAO.registerMember(member);
 
            //トランザクションのコミット
            con.commit();
 
    } catch (SQLException e) {
        try {
            //トランザクションのロールバック
           if(con != null)
           {
               con.rollback();
           }
           } catch (SQLException e2) {
               // スタックトレースを出力
                   e2.printStackTrace();
               }
           } finally {
               try {
               if(con != null) {
 
                       // データベース接続の切断
                   con.close();
                   }
               } catch(SQLException e3) {
                   // スタックトレースを出力
                   e3.printStackTrace();
               }
           }
       }
 
    public Member getMember(String memberId) throws MarketBusinessException, MarketSystemException {
        Connection con = null;
        Member member = null;
 
        try {
            con = ConnectionManager.getConnection();
 
            MemberDAO memberDAO = new MemberDAO(con);
            member =  memberDAO.getMember(memberId);
 
 
        } catch (SQLException e) {
            // TODO: handle exception
            e.printStackTrace();
            throw new MarketSystemException("システムエラーが発生しました。システム管理者に連絡してください。");
        }finally {
            try {
                if(con != null){
                    con.close();
                }
            } catch(SQLException e) {
                e.printStackTrace();
                throw new MarketSystemException("システムエラーが発生しました。システム管理者に連絡してください。");
            }
        }
 
        return member;
    }
 
}