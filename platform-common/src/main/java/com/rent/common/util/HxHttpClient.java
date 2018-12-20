package com.rent.common.util;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author lgl
 */
public class HxHttpClient {
    private static Logger logger = LoggerFactory.getLogger(HxHttpClient.class);

    /**
     * @param url 请求的全路径 例如：http://localhost:8088/json.html
     * @return 返回json字符串
     */
    public static String get(String url) {
        String returnStr = "";
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();
        try {
            HttpGet httpGet = new HttpGet(url);
            /**
             * setConnectTimeout(20000)：设置连接超时时间，单位毫秒。
             * setConnectionRequestTimeout(20000) 设置从connect Manager获取Connection 超时时间，单位毫秒。这个属性是新加的属性，因为目前版本是可以共享连接池的
             * setSocketTimeout(20000) 请求获取数据的超时时间，单位毫秒。 如果访问一个接口，多少时间内无法返回数据，就直接放弃此次调用。
             */
            RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(20000).setConnectionRequestTimeout(20000).setConnectTimeout(20000).build();//设置请求和传输超时时间
            httpGet.setConfig(requestConfig);
            HttpResponse response = httpClient.execute(httpGet);
            /*
             * 判断HTTP的返回状态码，如果正确继续解析返回的数据
			 */
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {//HttpStatus.SC_OK=200
                returnStr = EntityUtils.toString(response.getEntity());
            } else {
                returnStr = "{\"code\":\"500\",\"msg\":\"请求地址异常("+response.getStatusLine().getStatusCode()+")\",\"content\":\"\",\"extendData\":\"\"}";
                logger.info(">>>>>>>httpClient Get 请求地址异常---》url:" + url);
            }
        } catch (ClientProtocolException e) {
            logger.error(">>>>>>>httpClient Get ClientProtocolException 异常---》" + e.getMessage());
            returnStr = "{\"code\":\"601\",\"msg\":\"请求地址异常\",\"content\":\"\",\"extendData\":\"\"}";
            logger.info(">>>>>>>httpClient Get ClientProtocolException 异常---》url:" + url);
        } catch (IOException e) {
            logger.error(">>>>>>>httpClient Get IOException 异常---》" + e.getMessage());
            returnStr = "{\"code\":\"602\",\"msg\":\"IO异常\",\"content\":\"\",\"extendData\":\"\"}";
            logger.info(">>>>>>>httpClient Get IOException 异常---》url:" + url);
        }
        return returnStr;
    }

    /**
     * @param url            请求的全路径 例如：http://localhost:8088/json.html
     * @param postParameters 使用post的方式请求的参数，此参数为一个map
     * @return 返回json字符串
     */
    public static String post(String url, Map<String, String> postParameters) {
        String returnStr = "";
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();
        try {
            HttpPost httpPost = new HttpPost(url);
            /**
             * setConnectTimeout(20000)：设置连接超时时间，单位毫秒。
             * setConnectionRequestTimeout(20000) 设置从connect Manager获取Connection 超时时间，单位毫秒。这个属性是新加的属性，因为目前版本是可以共享连接池的
             * setSocketTimeout(20000) 请求获取数据的超时时间，单位毫秒。 如果访问一个接口，多少时间内无法返回数据，就直接放弃此次调用。
             */
            RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(20000).setConnectionRequestTimeout(20000).setConnectTimeout(20000).build();//设置请求和传输超时时间
            httpPost.setConfig(requestConfig);
            /*
             * 解析传递过来的map参数，将参数解析为键值对(f=xxx)的格式放入到List
			 */
            List<NameValuePair> nvps = new ArrayList<NameValuePair>();
            Set<String> keySet = postParameters.keySet();
            for (String key : keySet) {
                nvps.add(new BasicNameValuePair(key, postParameters.get(key)));
            }
            // 此处设置请求参数的编码为 utf-8
            httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));
            HttpResponse response = httpClient.execute(httpPost);
            /*
             * 判断HTTP的返回状态码，如果正确继续解析返回的数据
			 */
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {//HttpStatus.SC_OK=200
                returnStr = EntityUtils.toString(response.getEntity());
            } else {
                returnStr = "{\"code\":\"500\",\"msg\":\"请求地址异常("+response.getStatusLine().getStatusCode()+")\",\"content\":\"\",\"extendData\":\"\"}";
                logger.info(">>>>>>>httpClient Post 请求地址异常---》url:" + url+",data:"+JsonUtils.toJacksonStr(postParameters));
            }
        } catch (ClientProtocolException e) {
            logger.error(">>>>>>>httpClient Post ClientProtocolException 异常---》" + e.getMessage());
            returnStr = "{\"code\":\"601\",\"msg\":\"请求地址异常\",\"content\":\"\",\"extendData\":\"\"}";
            logger.info(">>>>>>>httpClient Post ClientProtocolException 异常---》url:" + url+",data:"+JsonUtils.toJacksonStr(postParameters));
        } catch (IOException e) {
            logger.error(">>>>>>>httpClient Post IOException 异常---》" + e.getMessage());
            returnStr = "{\"code\":\"602\",\"msg\":\"IO异常\",\"content\":\"\",\"extendData\":\"\"}";
            logger.info(">>>>>>>httpClient Post IOException 异常---》url:" + url+",data:"+JsonUtils.toJacksonStr(postParameters));
        }
        return returnStr;
    }
}
