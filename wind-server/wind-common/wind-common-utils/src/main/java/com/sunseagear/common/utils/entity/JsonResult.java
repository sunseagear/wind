package com.sunseagear.common.utils.entity;


import java.io.Serializable;


public class JsonResult<T>
        implements Serializable {
    private static final long serialVersionUID = 1L;
    private boolean success;
    private String message;
    private int statusCode;
    private T data;


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


    public int getStatusCode() {

        return this.statusCode;

    }


    public void setStatusCode(int statusCode) {

        this.statusCode = statusCode;

    }


    public T getData() {

        return this.data;

    }


    public void setData(T data) {

        this.data = data;

    }


    public JsonResult(T data) {

        this.data = data;

        this.success = true;

    }


    public JsonResult(boolean success, int statusCode, String message) {

        this.success = success;

        this.statusCode = statusCode;

        this.message = message;

    }


    public JsonResult(boolean success, String message) {

        this.success = success;

        this.message = message;

    }


    public JsonResult(boolean success, String message, T data) {

        this.success = success;

        this.message = message;

        this.data = data;

    }


    public JsonResult(boolean success, int statusCode, String message, T data) {

        this.success = success;

        this.statusCode = statusCode;

        this.message = message;

        this.data = data;

    }

}
