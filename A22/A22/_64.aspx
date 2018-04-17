<%@ Page Language="C#" %>
<!DOCTYPE html>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Collections.Generic"%>

<html>
<head runat="server">
	<title>_64</title>
	<script runat="server">
	
	</script>
</head>
<body>
	<form id="form1" runat="server">
	<% 
       string inde = Request.Form["Choice"];



      
            StringWriter writer = new StringWriter();
            WebRequest myRequest = WebRequest.Create(@"https://rata.digitraffic.fi/api/v1/live-trains");
            WebResponse response = myRequest.GetResponse();
            Stream dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream);
            string responseFromServer = reader.ReadToEnd();
            string [] cutdata = responseFromServer.Split('{');
            List<string> trainNumcut = new List<string>();
             List<string> shortCode = new List<string>();
            for (int i=0; i<cutdata.Length; i++)
                        {
                            if(cutdata[i].Contains("trainNumber"))
                            {
                                trainNumcut.Add(cutdata[i]);
                            }
                            else if(cutdata[i].Contains("stationShortCode"))
                            {
                                shortCode.Add(cutdata[i]);
                            }
                        }
            List<string> trainNum = new List<string>();
            List<string> timeTable = new List<string>();
            for (int i=1; i< trainNumcut.Count; i++)
            {
                int index1 = trainNumcut[i].IndexOf("trainNumber")+13;
                int take = trainNumcut[i].IndexOf(",",index1)-index1;
                string trainNumber = trainNumcut[i].Substring(index1,take);
                trainNum.Add(trainNumber);
                int index2 = shortCode[i].IndexOf("stationShortCode")+19;
                int take2 = shortCode[i].IndexOf(",",index2)-index2-1;
                string stationCode = shortCode[i].Substring(index2,take2);
                //timeTable.Add(stationCode);
                int index3 = shortCode[i].IndexOf("scheduledTime")+16;
                int take3 = shortCode[i].IndexOf(",",index3)-index3-1;
                string time = shortCode[i].Substring(index3,take3);
                timeTable.Add(stationCode+", " +time);
        
            }
            int count=0;
                           
            for(int i=0; i<trainNum.Count;i++)
            {
                if(inde==trainNum[i])
                {
                    count = i;
                    break;
                }
            }
            for(int i=count; i< timeTable.Count; i++)
            {
                 Response.Write(timeTable[i]+"<br>");
            }
               %>
    
	</form>
</body>
</html>
