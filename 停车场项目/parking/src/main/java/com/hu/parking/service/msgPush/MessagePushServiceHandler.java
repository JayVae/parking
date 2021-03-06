package com.hu.parking.service.msgPush;

import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.util.concurrent.GlobalEventExecutor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hu.parking.util.JsonBinder;

/**
 * 服务端 channel
 * 
 * @author waylau.com
 * @date 2015-2-16
 */
@Service
public class MessagePushServiceHandler extends SimpleChannelInboundHandler<String> { // (1)
	Logger logger = LoggerFactory.getLogger(this.getClass());
	JsonBinder jsonBinder = JsonBinder.nonDefaultMapper();

	public static ChannelGroup channels = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);

    @Override
    public void handlerAdded(ChannelHandlerContext ctx) throws Exception {  // (2)
        Channel incoming = ctx.channel();
        incoming.writeAndFlush("welcome!");
        channels.add(incoming);
    }

    @Override
    public void handlerRemoved(ChannelHandlerContext ctx) throws Exception {  // (3)
        Channel incoming = ctx.channel();
        for (Channel channel : channels) {
            channel.writeAndFlush("[SERVER] - " + incoming.remoteAddress() + " 离开\n");
        }
        channels.remove(ctx.channel());
    }
    @Override
	protected void channelRead0(ChannelHandlerContext ctx, String s) throws Exception { // (4)
		Channel incoming = ctx.channel();
		for (Channel channel : channels) {
            if (channel != incoming){
                channel.writeAndFlush("[" + incoming.remoteAddress() + "]" + s + "\n");
            } else {
            	channel.writeAndFlush("[you]" + s + "\n");
            }
        }
	}
  
	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception { // (5)
        Channel incoming = ctx.channel();
        logger.info("SimpleChatClient:"+incoming.remoteAddress()+"在线");
	}
	
	@Override
	public void channelInactive(ChannelHandlerContext ctx) throws Exception { // (6)
        Channel incoming = ctx.channel();
        logger.info("SimpleChatClient:"+incoming.remoteAddress()+"掉线");
	}
    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) { 
    	Channel incoming = ctx.channel();
		logger.info("SimpleChatClient:"+incoming.remoteAddress()+"异常");
        // 当出现异常就关闭连接
        cause.printStackTrace();
        ctx.close();
    }
    
    public void sendMsg(Message message){
    	for (Channel channel : channels) {
            channel.writeAndFlush(jsonBinder.toJson(message));
        }
    	logger.info(message.toString());
    }
}