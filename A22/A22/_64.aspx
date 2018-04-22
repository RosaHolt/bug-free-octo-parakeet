<%@ Page Language="C#" %>
<!DOCTYPE html>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Collections.Generic"%>

<html>
<head runat="server">
	<title>_64</title>
    <style>
    table {border-collapse: collapse;}

    table, td, tr {border: 1px solid black;}
    table {width: 100%;}
    tr {height: 50px;}
    tr, td {border-bottom: 1px solid #ddd;}
    tr:hover {background-color: #68F476;}
    th {background-color: #4CAF50; color: white;}     
    </style>      
 
	<script runat="server">
	
	</script>
</head>
<body>
	<form id="form1" runat="server">
            <table>
                <tr>
                    <th>Train Station</th>
                    <th> Datetime </th>
                    <th> Different in minutes </th>
                </tr>
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
            }
            for(int i=0; i<shortCode.Count;i++)
            {
                int index4 = shortCode[i].IndexOf("trainStopping")+15;
                int take4 = shortCode[i].IndexOf(",",index4)-index4;
                string stop = shortCode[i].Substring(index4,take4);
                int index5 = shortCode[i].IndexOf("type")+7;
                int take5 = shortCode[i].IndexOf(",",index5)-index5-1;
                string type = shortCode[i].Substring(index5,take5);
            
                if(stop == "true"&& type=="ARRIVAL")
                {
                int index2 = shortCode[i].IndexOf("stationShortCode")+19;
                int take2 = shortCode[i].IndexOf(",",index2)-index2-1;
                string stationCode = shortCode[i].Substring(index2,take2);
                //timeTable.Add(stationCode);
                int index3 = shortCode[i].IndexOf("scheduledTime")+16;
                int take3 = shortCode[i].IndexOf(",",index3)-index3-1;
                string time = shortCode[i].Substring(index3,take3);
                string differ="";
                if (shortCode[i].Contains("differenceInMinutes"))
                {
               
                int index6 = shortCode[i].IndexOf("differenceInMinutes")+21;
                int take6= shortCode[i].IndexOf(",",index6)-index6;
                differ = shortCode[i].Substring(index6,take6);
               
                }
                 timeTable.Add("<tr><td>"+stationCode+"</td><td> " +time+"</td> <td> "+differ+"</td></tr>");


                }


        
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
                 Response.Write(timeTable[i]);
            }
               %>
    </table>    
	</form>
</body>
</html>
