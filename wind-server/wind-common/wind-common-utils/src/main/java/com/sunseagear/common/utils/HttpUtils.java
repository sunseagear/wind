package com.sunseagear.common.utils;

import com.sunseagear.common.utils.entity.RequestParams;
import okhttp3.*;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

public class HttpUtils {

    public static String SyncGet(final String webUrl) {
        final Request request = new Request.Builder()
                .url(webUrl)
                .build();
        return execute(request);
    }

    //创建okHttpClient对象
    private static OkHttpClient mOkHttpClient = new OkHttpClient().newBuilder()
            .connectTimeout(60, TimeUnit.SECONDS)//设置超时时间
            .readTimeout(60, TimeUnit.SECONDS)//设置读取超时时间
            .writeTimeout(10, TimeUnit.SECONDS)//设置写入超时时间
            .build();


    public static String SyncPost(String url, RequestParams params) {
        FormBody.Builder builder = new FormBody.Builder();
        for (String name : params.names()) {
            builder.add(name, "" + params.get(name));
        }
        RequestBody body = builder.build();
        //创建一个Request
        final Request request = new Request.Builder()
                .url(url)
                .post(body)
                .build();
        return execute(request);
    }

    private static String execute(Request request) {
        try {
            Response response = mOkHttpClient.newCall(request).execute();
            return response.body().string();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
