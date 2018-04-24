<%@ Page Language="C#" Inherits="A22.Default" %>
<!DOCTYPE html> 
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Collections.Generic"%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
  
	<title> Trainwrecker </title>
    
    <style>
   h1{
      text-align:center;
      text-transform:uppercase;
      font-size:27px;
      color: #3CB371;
      }
    #trainselct
     {margin-left: 30px;}
     h5
    {text-align:center;}  
     .container
      {width: 540px;
      height: 450px;
      background: #fff;
      margin:  0 auto;
      border: 4px solid black;
      border-style:inset;
      box-shadow: 0 15px 40px rgba(0,0,0.5);
      margin-top: 10%;
     
      }
      form
      {
      float: center; 
      padding: 7%;
       width: 40%;
      margin-left: 30%;
      margin-right: 30%;
      margin-top: 8%;
      border: 2px solid black;
      text-align: center;
      background-color: #3CB371;
         }  
       #submit{
        margin-right: 20%;
        margin-top: 10%;
         }
       asp #lblmessage
        {
        margin: 30px;
        padding: 40px;
        width: 500px;
        float:center;
        }
        img {
        float:center;
         margin-left:35%;
        margin-right:35%;
        height:23%;
         width:23%;
         } 
            
  
table {
    border-collapse: collapse;
}

table, td, t {
    border: 1px solid black;
}


	</style>
	</head>
	<body>
		
		<div class="container">
       

        <h1> Train Service</h1>
            <div><img src="juna.jpg.png" alt="train.jpg>"</div>
 +
        <form id="trainselect" runat="server" method="post" action="_64.aspx"> 
        Choose Train:
        <select name="Choice" class="selectpicker"> 
    
                        
             <%
            StringWriter writer = new StringWriter();
            WebRequest myRequest = WebRequest.Create(@"https://rata.digitraffic.fi/api/v1/live-trains");
            WebResponse response = myRequest.GetResponse();
            Stream dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream);
            string responseFromServer = reader.ReadToEnd();
            string [] cutdata = responseFromServer.Split('{');
            List<string> trainNumcut = new List<string>();
            for (int i=0; i<cutdata.Length; i++)
                        {
                            if(cutdata[i].Contains("trainNumber"))
                            {
                                trainNumcut.Add(cutdata[i]);
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
                int index2 = trainNumcut[i].IndexOf("stationShortCode")+19;
                int take2 = trainNumcut[i].IndexOf(",",index2)-index2;
                string stationCode = trainNumcut[i].Substring(index2,take2);
                //timeTable.Add(stationCode);
                int index3 = trainNumcut[i].IndexOf("scheduledTime")+16;
                int take3 = trainNumcut[i].IndexOf(",",index3)-index3;
                string time = trainNumcut[i].Substring(index3,take3);
                timeTable.Add(stationCode+", " +time);
        
            }
                           for(int i=0; i< trainNum.Count; i++)
                            {
                                Response.Write("<option value=\""+trainNum[i]+ "\">"+trainNum[i]+"</option>");
                        /*
                                if (label.Value) == "trainNum[i]"
                                {
                                    Response.Wrtie("+timeTable[i]+");
                                }
                        */
                                
                            }
               %>
                 <!--
                <option value="IC9">IC 9</option> 
                <option value="IC14">IC 14</option>
                <option value="IC176">IC 176</option>
                        -->
        
              
        </select> 

		
				
				<div class="formgroup">
					<div class="col-md-offset-2 col-mdn-10">
             
                        <asp:Button ID="submit" runat="server" Text="Enter" Onclick="submit_Click" />
					</div>
                 </div>
                

			</form>
             <asp:Label ID="lblmessage" runat="server" >
            
                </asp:Label>
            
                 <br />
                <br />
                <br />
    
		</div>
	</body>
</html>
