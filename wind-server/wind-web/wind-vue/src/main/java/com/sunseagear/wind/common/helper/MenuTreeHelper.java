package com.sunseagear.wind.common.helper;


import com.sunseagear.common.mvc.entity.TreeEntity;
import com.sunseagear.common.utils.ObjectUtils;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.modules.sys.entity.Menu;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 树排序
 */
public class MenuTreeHelper implements Serializable {


    public static MenuTreeHelper create() {
        MenuTreeHelper treeSortUtil = new MenuTreeHelper();
        return treeSortUtil;
    }


    public List<MenuTreeNode> sort(List<Menu> treeNodes) {
        List<MenuTreeNode> treeNodeList = new ArrayList<>();
        HashMap<String, MenuTreeNode> treeEntityHashMap = new HashMap<>();
        treeNodes.forEach(item -> {
            treeEntityHashMap.put(String.valueOf(item.getId()), new MenuTreeNode(item));
        });
        treeNodes.forEach(item -> {
            MenuTreeNode menuTreeNode = treeEntityHashMap.get(item.getId());
            if (item.getParentId() != null
                    && !StringUtils.isEmpty(String.valueOf(item.getParentId()))
                    && treeEntityHashMap.containsKey(item.getParentId())) {
                MenuTreeNode treeEntity = treeEntityHashMap.get(item.getParentId());
                treeEntity.getChildren().add(menuTreeNode);

            }else{
                treeNodeList.add(menuTreeNode);
            }
        });
        return treeNodeList;
    }


    /**
     * 这里可以优化一下，可以配置子节点的key,以及可以修改
     */
    public static class MenuTreeNode extends HashMap<String, Object> {

        public MenuTreeNode(Menu menu) {
            putObject(menu);
        }

        //设置节点
        public MenuTreeNode putObject(Menu menu) {
            put("id", menu.getId());
            put("name", menu.getId());
            put("path", menu.getPath());
            put("url", menu.getUrl());
            put("redirect", menu.getRedirect());
            put("component", menu.getComponent());
            put("type", menu.getType());
            if (menu.getCacheable() == null) {
                menu.setCacheable(true);
            }
            put("hidden", !menu.isEnable());

            //设置meta
            Map<String, Object> meta = new HashMap<>();
            meta.put("title", menu.getName());
            meta.put("icon", menu.getIcon());
            meta.put("noCache", !menu.getCacheable());
            meta.put("requireAuth", menu.getRequireAuth());
            meta.put("permission", menu.getPermission());
            put("meta", meta);
            return this;
        }

        public List<MenuTreeNode> getChildren() {
            if (!containsKey("children")){
                put("children",new ArrayList<MenuTreeNode>());
            }
            return (List<MenuTreeNode>) get("children");
        }
    }
}


