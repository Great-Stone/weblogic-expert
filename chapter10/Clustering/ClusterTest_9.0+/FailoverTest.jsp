WebLogic Server Name: <%= System.getProperty("weblogic.Name") %>

<%
    session = request.getSession(true);
    Integer ival = (Integer)session.getAttribute("simplesession.counter");
    if (ival == null)
    ival = new Integer(1);
    else
    ival = new Integer(ival.intValue() + 1);
    session.setAttribute("simplesession.counter", ival);
    System.out.println("[SessionTest] count = " + ival );
%>
<br>
<h3>In Session Count int <font color=red> <%= ival %></font> time<%=(ival.intValue() == 1) ? "": "s" %>, before the session times out.</h3>