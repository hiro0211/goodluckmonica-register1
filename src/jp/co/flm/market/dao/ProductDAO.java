/**
 * jp.co.flm.market.dao.ProductDAO
 *
 * All Rights Reserved, Copyright Fujitsu Learning Media Limited
 */
package jp.co.flm.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jp.co.flm.market.entity.Category;
import jp.co.flm.market.entity.Product;
import jp.co.flm.market.entity.Stock;

/**
 * Productテーブルを利用するDAOクラスです。
 *
 * @author FLM
 * @version 1.0 YYYY/MM/DD
 */
public class ProductDAO {

    /** コネクション */
    private Connection con;

    /**
     * コンストラクタ
     *
     * @param con
     *            コネクション
     */
    public ProductDAO(Connection con) {
        this.con = con;
    }

    /**
     * カテゴリIDによる商品情報の検索を行う。
     *
     * @param categoryId
     *            カテゴリID
     * @return 商品情報
     * @throws SQLException
     *             SQL例外
     */
    public ArrayList<Product> getProductsByCategoryId(String categoryId) throws SQLException {
        return null;
    }

    /**
     * 商品情報の1件検索を行う。
     *
     * @param productId
     *            商品ID
     * @return 商品情報
     * @throws SQLException
     *             SQL例外
     */
    public Product getProduct(String productId) throws SQLException {
        return null;
    }
}
