package com.rent.common.util;

import org.apache.http.*;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.concurrent.FutureCallback;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.nio.client.CloseableHttpAsyncClient;
import org.apache.http.impl.nio.client.HttpAsyncClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

/**
 * @author lgl
 */
public class HxHttpAsyncClient {
    private static Logger logger = LoggerFactory.getLogger(HxHttpAsyncClient.class);

    /**
     * @param url 请求的全路径 例如：http://localhost:8088/json.html
     * @return 返回json字符串
     */
    public static void get(String url) {
        try {
            CloseableHttpAsyncClient httpClient = HttpAsyncClientBuilder.create().setMaxConnTotal(1000).setMaxConnPerRoute(1000).build();
            HttpGet httpGet = new HttpGet(url);
            /**
             * setConnectTimeout(20000)：设置连接超时时间，单位毫秒。
             * setConnectionRequestTimeout(20000) 设置从connect Manager获取Connection 超时时间，单位毫秒。这个属性是新加的属性，因为目前版本是可以共享连接池的
             * setSocketTimeout(20000) 请求获取数据的超时时间，单位毫秒。 如果访问一个接口，多少时间内无法返回数据，就直接放弃此次调用。
             */
            RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(20000).setConnectionRequestTimeout(20000).setConnectTimeout(20000).build();//设置请求和传输超时时间
            httpGet.setConfig(requestConfig);
            httpClient.start();
            Future<HttpResponse> future = httpClient.execute(httpGet, new FutureCallback<HttpResponse>() {
                @Override
                public void failed(Exception ex) {
                    close(httpClient);
                }

                @Override
                public void completed(HttpResponse resp) {
                    String body = "";
                    //这里使用EntityUtils.toString()方式时会大概率报错，原因：未接受完毕，链接已关
                    try {
                        HttpEntity entity = resp.getEntity();
                        if (entity != null) {
                            final InputStream instream = entity.getContent();
                            try {
                                final StringBuilder sb = new StringBuilder();
                                final char[] tmp = new char[1024];
                                final Reader reader = new InputStreamReader(instream, "UTF-8");
                                int l;
                                while ((l = reader.read(tmp)) != -1) {
                                    sb.append(tmp, 0, l);
                                }
                                body = sb.toString();
                                logger.info("异步回调返回成功信息==" + body);
                            } finally {
                                instream.close();
                                EntityUtils.consume(entity);
                            }
                        }
                    } catch (ParseException | IOException e) {
                        e.printStackTrace();
                    }
                    close(httpClient);
                }

                @Override
                public void cancelled() {
                    close(httpClient);
                }
            });
            //
            future.get();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
    }

    /**
     * @param url 请求的全路径 例如：http://localhost:8088/json.html
     * @return 返回json字符串
     */
    public static void getForCallback(String url) {
        try {
            CloseableHttpAsyncClient httpClient = HttpAsyncClientBuilder.create().setMaxConnTotal(1000).setMaxConnPerRoute(1000).build();
            final CountDownLatch latch1 = new CountDownLatch(1);
            HttpGet httpGet = new HttpGet(url);
            /**
             * setConnectTimeout(20000)：设置连接超时时间，单位毫秒。
             * setConnectionRequestTimeout(20000) 设置从connect Manager获取Connection 超时时间，单位毫秒。这个属性是新加的属性，因为目前版本是可以共享连接池的
             * setSocketTimeout(20000) 请求获取数据的超时时间，单位毫秒。 如果访问一个接口，多少时间内无法返回数据，就直接放弃此次调用。
             */
            RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(20000).setConnectionRequestTimeout(20000).setConnectTimeout(20000).build();//设置请求和传输超时时间
            httpGet.setConfig(requestConfig);
            httpClient.start();
            Future<HttpResponse> future = httpClient.execute(httpGet, new FutureCallback<HttpResponse>() {
                @Override
                public void failed(Exception ex) {
                    latch1.countDown();
                    close(httpClient);
                }

                @Override
                public void completed(HttpResponse resp) {
                    String body = "";
                    //这里使用EntityUtils.toString()方式时会大概率报错，原因：未接受完毕，链接已关
                    try {
                        HttpEntity entity = resp.getEntity();
                        if (entity != null) {
                            final InputStream instream = entity.getContent();
                            try {
                                final StringBuilder sb = new StringBuilder();
                                final char[] tmp = new char[1024];
                                final Reader reader = new InputStreamReader(instream, "UTF-8");
                                int l;
                                while ((l = reader.read(tmp)) != -1) {
                                    sb.append(tmp, 0, l);
                                }
                                body = sb.toString();
                                logger.info("异步回调返回成功信息==" + body);
                            } finally {
                                instream.close();
                                EntityUtils.consume(entity);
                            }
                        }
                    } catch (ParseException | IOException e) {
                        e.printStackTrace();
                    }
                    latch1.countDown();
                    close(httpClient);
                }

                @Override
                public void cancelled() {
                    latch1.countDown();
                    close(httpClient);
                }
            });
            latch1.await();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    /**
     * @param url            请求的全路径 例如：http://localhost:8088/json.html
     * @param postParameters 使用post的方式请求的参数，此参数为一个map
     * @return 返回json字符串
     */
    public static void post(String url, Map<String, String> postParameters) {
        try {
            CloseableHttpAsyncClient httpClient = HttpAsyncClientBuilder.create().setMaxConnTotal(1000).setMaxConnPerRoute(1000).build();
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
            httpClient.start();
            Future<HttpResponse> future = httpClient.execute(httpPost, new FutureCallback<HttpResponse>() {
                @Override
                public void failed(Exception ex) {
                    close(httpClient);
                }

                @Override
                public void completed(HttpResponse resp) {
                    String body = "";
                    //这里使用EntityUtils.toString()方式时会大概率报错，原因：未接受完毕，链接已关
                    try {
                        HttpEntity entity = resp.getEntity();
                        if (entity != null) {
                            final InputStream instream = entity.getContent();
                            try {
                                final StringBuilder sb = new StringBuilder();
                                final char[] tmp = new char[1024];
                                final Reader reader = new InputStreamReader(instream, "UTF-8");
                                int l;
                                while ((l = reader.read(tmp)) != -1) {
                                    sb.append(tmp, 0, l);
                                }
                                body = sb.toString();
                                logger.info("异步回调返回成功信息==" + body);
                            } finally {
                                instream.close();
                                EntityUtils.consume(entity);
                            }
                        }
                    } catch (ParseException | IOException e) {
                        e.printStackTrace();
                    }
                    close(httpClient);
                }

                @Override
                public void cancelled() {
                    close(httpClient);
                }
            });
            //
            future.get();
        } catch (Exception e) {
            logger.info("请求参数转码错误");
        }
    }

    /**
     * @param url            请求的全路径 例如：http://localhost:8088/json.html
     * @param postParameters 使用post的方式请求的参数，此参数为一个map
     * @return 返回json字符串
     */
    public static void postForCallback(String url, Map<String, String> postParameters) {
        try {
            CloseableHttpAsyncClient httpClient = HttpAsyncClientBuilder.create().setMaxConnTotal(1000).setMaxConnPerRoute(1000).build();
            final CountDownLatch latch1 = new CountDownLatch(1);
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
            httpClient.start();
            Future<HttpResponse> future = httpClient.execute(httpPost, new FutureCallback<HttpResponse>() {
                @Override
                public void failed(Exception ex) {
                    latch1.countDown();
                    close(httpClient);
                }

                @Override
                public void completed(HttpResponse resp) {
                    String body = "";
                    //这里使用EntityUtils.toString()方式时会大概率报错，原因：未接受完毕，链接已关
                    try {
                        HttpEntity entity = resp.getEntity();
                        if (entity != null) {
                            final InputStream instream = entity.getContent();
                            try {
                                final StringBuilder sb = new StringBuilder();
                                final char[] tmp = new char[1024];
                                final Reader reader = new InputStreamReader(instream, "UTF-8");
                                int l;
                                while ((l = reader.read(tmp)) != -1) {
                                    sb.append(tmp, 0, l);
                                }
                                body = sb.toString();
                                logger.info("异步回调返回成功信息==" + body);
                            } finally {
                                instream.close();
                                EntityUtils.consume(entity);
                            }
                        }
                    } catch (ParseException | IOException e) {
                        e.printStackTrace();
                    }
                    latch1.countDown();
                    close(httpClient);
                }

                @Override
                public void cancelled() {
                    latch1.countDown();
                    close(httpClient);
                }
            });
            latch1.await();
            // future.get();
        } catch (Exception e) {
            logger.info("请求参数转码错误");
        }
    }

    /**
     * 关闭client对象
     *
     * @param client
     */
    private static void close(CloseableHttpAsyncClient client) {
        try {
            client.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}