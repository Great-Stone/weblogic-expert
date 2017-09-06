import java.io.*;
import java.util.*;
import javax.transaction.*;
import javax.naming.*;
import javax.jms.*;
import javax.rmi.*;

public class TopicReceive implements MessageListener
{
    public final static String JNDI_FACTORY = "weblogic.jndi.WLInitialContextFactory";
    public final static String CONN_FACTORY = "com.wlsexpert.ConnectionFactory";
    public final static String TOPIC = "com.wlsexpert.Topic";

    private TopicConnectionFactory dutconFactory;
    private TopicConnection dutcon;
    private TopicSession dutsession;
    private TopicSubscriber dutsubscriber;
    private Topic dutopic;
    private boolean quit = false;

    public void onMessage(Message msg)
    {
        try
        {
            String msgText;
            if (msg instanceof TextMessage)
            {
                msgText = ((TextMessage) msg).getText();
            }
            else
            {
                msgText = msg.toString();
            }

            System.out.println("Received JMS Message: " + msgText);
            if (msgText.equalsIgnoreCase("quit"))
            {
                synchronized(this)
                {
                    quit = true;
                    this.notifyAll();
                }
            }
        }
        catch (JMSException jmse)
        {
            System.err.println("An exception has occurred: " + jmse.getMessage());
        }
    }
    public static void main(String[] args) throws Exception
    {
        if (args.length != 1)
        {
            System.out.println("Usage: java examples.jms.dutopic.TopicReceive WebLogicURL ");
            return;
        }

        InitialContext ic = getInitialContext(args[0]);
        TopicReceive tr = new TopicReceive();
        tr.init(ic, TOPIC);
        System.out.println("JMS Is Now Ready To Receive Messages (To quit, send a\"quit\" message).");

        synchronized(tr)
        {
            while (!tr.quit)
            {
                try
                {
                    tr.wait();
                }
                catch (InterruptedException ie)
                {

                }
            }
        }
        tr.close();
    }

    private static InitialContext getInitialContext(String url) throws NamingException
    {
        Hashtable env = new Hashtable();
        env.put(Context.INITIAL_CONTEXT_FACTORY, JNDI_FACTORY);
        env.put(Context.PROVIDER_URL, url);
        env.put("weblogic.jndi.createIntermediateContexts", "true");
        return new InitialContext(env);
    }

    public void close() throws JMSException
    {
        dutsubscriber.close();
        dutsession.close();
        dutcon.close();
    }
    
    public void init(Context ctx, String topicName) throws NamingException, JMSException
    {
        dutconFactory = (TopicConnectionFactory) PortableRemoteObject.narrow(ctx.lookup(CONN_FACTORY), TopicConnectionFactory.class);
        dutcon = dutconFactory.createTopicConnection();
        
        dutcon.setClientID("wls");
        dutsession = dutcon.createTopicSession(false, Session.AUTO_ACKNOWLEDGE);
        dutopic = (Topic) PortableRemoteObject.narrow(ctx.lookup(topicName), Topic.class);
        
        dutsubscriber = dutsession.createDurableSubscriber(dutopic, "Test");
        dutsubscriber.setMessageListener(this);
        dutcon.start();
    }
}