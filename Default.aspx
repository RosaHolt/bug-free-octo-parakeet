<%@ Page Language="C#" Inherits="A22.Default" %>
<!DOCTYPE html> 

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
        
  
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

    .title
    {
    text-align: center;
    padding: 50px 0 20px;
    }

    .title
    {
    margin: 0;
    padding: 0;
    color: black;
    text-transform: uppercase;
    font-size: 18px;
    }

    .container
    {
    width: 600px;
    height: 500px;
    background: #fff;
    margin:  0 auto;
    border: 4px solid black;
    box-shadow: 0 15px 40px rgba(0,0,0.5);
    }

.form
{   width: 100px;
    position: fixed;
    float: left;
    margin-right: 300px;
    padding: 5px;
 }
 #Trainstart #Trainend
 {
   position:fixed;
   float:left;
   padding:3px;
  }

     
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
	</style>
	</head>
	<body>
        
		
		<div class="container">
        <nav>
        
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
             
        </nav>

        <h2> Choose Your Train </h2>
        <form id="trainselect" runat="server" method="post" action="Default.aspx"> 
        I want to see: 
        <select name="Choice"> 
        <option value="IC7.png">IC 7</option> 
        <option value="IC9">IC 9</option> 
        <option value="IC14">IC 14</option> 
        <option value="Commuter1"> Commuter Train 1</option> 
        <option value="Commuter2"> Commuter Train 2</option> 
        </select> 

		
				<div class="formgroup">
					<label id="Trainstart" class="col-sm-2 control-label">Start </label>
                    <div class="col-sm-3">
                        <input id="Trainstart" name="Trainstart" value="<% =Convert.ToDateTime(Request.Form["Trainstart"])%> " type="text">
					</div>
        
                </div>

				<div class="formgroup">
                    <label id="Trainend" class="col-sm-2 control-label">End </label>
                    <div class="col-sm-3">
                        <input id="Trainend" name="Trainend" value="<% =Convert.ToDateTime(Request.Form["Trainend"])%>"type="text" >
                    </div>
        
                </div>
				
				<div class="formgroup">
					<div class="col-md-offset-2 col-mdn-10">
             
                        <asp:Button ID="submit" runat="server" Text="Enter" Onclick="submit_Click" />
					</div>
                 </div>   
        

                     
                         
                  
                <asp:Label ID="lblmessage" runat="server" >
            
                </asp:Label>
            
                 <br />
                <br />
                <br />

			</form>
		</div>
	</body>
</html>