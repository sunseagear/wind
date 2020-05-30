package com.sunseagear.common.utils.entity;


import java.io.Serializable;


public class ServerPageResult<T>
        implements Serializable {
    private static final long serialVersionUID = 1L;
    private boolean success;
    private String message;
    private int total;
    private T rows;


    public ServerPageResult(boolean success, String message, int total, T rows) {

        this.success = success;

        this.message = message;

        this.total = total;

        this.rows = rows;

    }


    public boolean isSuccess() {

        return this.success;

    }


    public void setSuccess(boolean success) {

        this.success = success;

    }


    public String getMessage() {

        return this.message;

    }


    public void setMessage(String message) {

        this.message = message;

    }


    public int getTotal() {

        return this.total;

    }


    public void setTotal(int total) {

        this.total = total;

    }


    public T getRows() {

        return this.rows;

    }


    public void setRows(T rows) {

        this.rows = rows;

    }

}
