package com.hu.parking.service.msgPush;


import org.aspectj.weaver.patterns.ThisOrTargetAnnotationPointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.socket.SocketChannel;
import io.netty.handler.codec.DelimiterBasedFrameDecoder;
import io.netty.handler.codec.Delimiters;
import io.netty.handler.codec.string.StringDecoder;
import io.netty.handler.codec.string.StringEncoder;

/**
 * 服务端 ChannelInitializer
 * 
 * @author waylau.com
 * @date 2015-2-26
 */
@Service
public class MessagePushServiceInit extends
		ChannelInitializer<SocketChannel> {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
    public void initChannel(SocketChannel ch) throws Exception {
		 ChannelPipeline pipeline = ch.pipeline();

        pipeline.addLast("framer", new DelimiterBasedFrameDecoder(8192, Delimiters.lineDelimiter()));
        pipeline.addLast("decoder", new StringDecoder());
        pipeline.addLast("encoder", new StringEncoder());
        pipeline.addLast("handler", new MessagePushServiceHandler());
 
		logger.info("SimpleChatClient:"+ch.remoteAddress() +"连接上");
    }
}
