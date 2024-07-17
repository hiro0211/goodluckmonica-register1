package jp.co.flm.market.web;

import javax.servlet.http.HttpServletRequest;

public interface ActionIF {
    String execute(HttpServletRequest req);
}