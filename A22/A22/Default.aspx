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
    body
    {
    
    margin: 0;
    padding: 0;
    background-image: url("https://cdn.pixabay.com/photo/2017/06/13/13/51/white-2398946_960_720.jpg");
    background-size: cover;
    font-family: sans-serif;
    
    }

   
    h1{
    text-align:center;
    text-transform:uppercase;
    font-size:18px;
    color: #3CB371;
    }
    #trainselct{margin-left: 30px;}
    h5{text-align:center;}        

   

    .container
    {
    width: 600px;
    height: 500px;
    background: #fff;
    margin:  0 auto;
    border: 4px solid black;
    border-style:inset;
    box-shadow: 0 15px 40px rgba(0,0,0.5);
   
    }

form
{   width: 100px;
    
    float: center;
    margin-right: 300px;
    padding: 5px;
 }

  #Trainstart{margin: 5px;}
  
  #Trainend{margin: 5px;}
        

  #submit{margin-left: 50px;margin-top: 10px;}
 ul#navmenu, ul.sub1 {
 list-style-type: none;
     margin-top: 5px;
 }



ul#navmenu li {
 width: 125px;
 text-align: center;
 position: relative;
 float: right;
 margin-right: 86px;
    
    
}

ul#navmenu a {
    
    text-decoration: none;
    display: block;
    width: 200px;
    height: 22px;
    line-height: 22px;
    background-color: #10B846;
    border: 1px solid green;
    color: white;
    margin-top: 6px;
    
    
}
 

ul#navmenu ul.sub1 {
    display: none;
    position: absolute;
    top: 26px;
    left: -40px;    
    
}

ul#navmenu li:hover .sub1 {
    display:block;
      
}

ul#navmenu .sub1 li:hover .sub2 {
    display: block;
}


ul#menu
{
   text-decoration: none;
    display: block;
    width: 155px;
    height: 30px;
    line-height: 25px;
    background-color: white;
    border: 1px solid;
    margin-left: 20px;
    
}
       

ul#moi
{
   float: center;
    margin-left: 0px;
    margin-top: 65px;
    margin-right: 220px;
    padding: 24px;
    background-color:antiquewhite
    
    
}
   
    footer
{
    width: 100%;
    background-color: grey;
    padding: 60px 0px;
    margin-top: -500px;
    border-bottom: 4px solid black;
}

button
{

    margin-top: 7px;
}
asp #lblmessage{
   margin: 30px;
   padding: 40px;
   width: 500px;
   float:center;}
	</style>
	</head>
	<body>
		
		<div class="container">
        <!--<nav>
        
        <ul id="navmenu"><li><a href="#">Train</a>
                    <ul class="sub1">
                        <li><a href="#"> IC 8 </a></li>
                        <li><a href="#"> IC 9</a></li>
                        <li><a href="#"> IC 11</a></li>
                        <li><a href ="#"> IC 14</a></li>
                        <li><a href="#"> Commuter Train 1</a></li>
                        <li><a href="#"> Commuter Train 2</a></li>
                        <li><a href="#"> Commuter Train 3</a></li>
                        <li><a href="#"> Commuter Train 4</a></li>
                        <li><a href="#"> IC 157</a></li>
                        <li><a href="#"> IC 233</a></li>
                        
                     </ul>
                 </li>
          </ul>
             
        </nav>-->

        <h1> Train Service</h1>
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