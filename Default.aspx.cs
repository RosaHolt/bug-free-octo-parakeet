using System;
using System.Web;
using System.Web.UI;


namespace A22
{

    public partial class Default : System.Web.UI.Page
    {
        protected void submit_Click(object sender, EventArgs e)
        {

            lblmessage.Text += "  Helsinki train station: Train left on schedule at 08:00 </br>";
            lblmessage.Text += "  Pasila train station: Train left on schedule at 08:15 </br>";
            lblmessage.Text += "  Tikkurila train station: Train left on schedule at 08:30 </br>";
            lblmessage.Text += "  Kerava train station: Awating train at 08:38 - On Schedule</br>";
            lblmessage.Text += "  Lahti train station: Awaiting train </br>";
            lblmessage.Text += "  Kouvola train station: Awaiting train </br>";
        }


    }


}
