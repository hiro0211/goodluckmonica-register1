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

    public void getMember(String memberId)
                    throws MarketBusinessException, MarketSystemException {

                    Connection con = null;
                    Member member = null;

                        try {
                            //データベースにの接続を取得する
                            con = ConnectionManager.getConnection();

                            // フォームで打ち込まれたメールアドレスが既にデータベース上に存在するか確認する。
                            MemberDAO memberDAO = new MemberDAO(con);
                            member = memberDAO.getMember(memberId);


                            if (member != null) {
                                // データベースに既に存在していた場合例外をActionクラスに投げる。
                                throw new MarketBusinessException("このメールアドレスは既に登録されています。");
                            }

                        } catch (SQLException e) {
                            e.printStackTrace();
                            throw new MarketSystemException("システムエラーです。システム管理者に連絡してください。");
                        } finally {
                            try {
                            if (con != null) {
                                con.close();
                                }
                            }catch (SQLException e) {
                                e.printStackTrace();
                                    throw new MarketSystemException("システムエラーです。システム管理者に連絡してください。");
                                }
                            }
                        }

}