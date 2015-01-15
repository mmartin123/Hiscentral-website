using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Net.Mail;
using System.Text;

public partial class addnetwork : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        var abc = HttpContext.Current.Request.Url.AbsoluteUri;
        if (!Page.User.Identity.IsAuthenticated) Response.Redirect("login.aspx");
        //this.SubmitButton.Attributes.Add("disabled", "true");
        //LoadControl//HeaderControl1_LoginView1_LoginName1
        var name = Page.User.Identity.Name;
        
    }


    protected void InsertCancelButton_Click(object sender, EventArgs e) {
        Response.Redirect("mynetworks.aspx");
    }


    //INSERT INTO HISNetworks(username, NetworkName, ServiceAbs, ServiceWSDL, ContactEmail, ContactName, ContactPhone, Organization, website) 
    //VALUES (,,,,,,,,)">
    protected void SubmitButton_Click(object sender, EventArgs e) {
         var validationResult = CheckIfNetworkAndWSDLNameInUse(txtNetworkName.Text, txtServiceWSDL.Text);
        if (String.IsNullOrEmpty(validationResult)) {
        ParameterCollection parms = SqlDataSource1.InsertParameters;
        parms.Clear();
        parms.Add("username", Page.User.Identity.Name);
        parms.Add("NetworkName", txtNetworkName.Text);
        parms.Add("NetworkTitle", txtNetworkTitle.Text);
        parms.Add("ServiceWSDL", txtServiceWSDL.Text);
        //parms.Add("ContactName", txtContactName.Text);
        //parms.Add("ContactEmail", txtContactEmail.Text);
        //parms.Add("ContactPhone", txtContactPhone.Text);
        //parms.Add("Organization", txtOrganization.Text);
        //parms.Add("website", txtwebsite.Text);
        //parms.Add("Citation", CitationTextBox.Text);
        parms.Add("IsPublic", "False");
        parms.Add("IsApproved", "False");
        parms.Add("CreatedDate", DateTime.Now.ToString());
        parms.Add("ServiceGroup", "3");
        parms.Add("GmailAddress", Page.User.Identity.Name);
        SqlDataSource1.Insert();
        getNetworkID();
        Response.Redirect("mynetworks.aspx");
        } else {
        lblInUse.Visible = true;
        lblInUse.Text = validationResult;
        }
    }
    private string CheckIfNetworkAndWSDLNameInUse(string networkName, string serviceWsdl) {
        var validationResult = String.Empty;
        var existingNetworks = DataAccess.GetExistingNetworkNames();
        if (existingNetworks.Contains(networkName.ToUpper())) {
            validationResult += String.Format("The network name [{0}] is already in use! ", networkName);
        }
        var existingWSDLs = DataAccess.GetExistingWSDLNames();
        if (serviceWsdl.Contains("?")) {
            if (existingWSDLs.Contains(serviceWsdl.ToUpper())) {
                validationResult += String.Format("The service WSDL URL [{0}] is already in use! ", serviceWsdl);
            }
        } else {
            var NewServiceWSDL = serviceWsdl + "?WSDL";
            if (existingWSDLs.Contains(NewServiceWSDL.ToUpper())) {
                validationResult += String.Format("The service WSDL URL [{0}] is already in use! ", serviceWsdl);
            }

        }

        return validationResult;
    }

    private void getNetworkID() {
        String sql = "Select max(networkID) as newnetwork from HISNetworks where username = '" + Page.User.Identity.Name + "'";
        DataSet ds = new DataSet();
        SqlConnection con = new SqlConnection(SqlDataSource1.ConnectionString);
        int netid = 0;
        using (con) {
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            da.Fill(ds, "network");
        }
        con.Close();
        //should be only one
        foreach (DataRow dataRow in ds.Tables["network"].Rows) {
            netid = (int)dataRow[0];
        }
        if (netid != 0) {
            //mailAdmins(netid);            
            Session["NetworkID"] = netid;

            Runharvester();

            Response.Redirect("network.aspx");
        } else {
            Response.Redirect("mynetworks.aspx");
        }



    }
    private void Runharvester() {

        try {
            HarvesterRun.HarvesterRun objHarvesterRun = new HarvesterRun.HarvesterRun();
            var path = objHarvesterRun.HarvestRun();
            var pathCount = VirtualPathUtility.ToAbsolute("~/").Length;
            path = path.Remove(0, pathCount);
            var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~/" + path + ""));
            if (fileContents.Contains("ERROR: Harvest halted as no sites were obtained from this WSDL. Please check")) {
                SendErrorEmail();
            } else {
                SqlConnection sqlConn = new SqlConnection(SqlDataSource1.ConnectionString);
                SqlCommand sqlComm = new SqlCommand();
                sqlComm = sqlConn.CreateCommand();
                sqlComm.CommandText = @"UPDATE HisNetworks SET IsPublic=1 WHERE NetworkId =" + Convert.ToInt32(Session["NetworkID"]);
                sqlConn.Open();
                sqlComm.ExecuteNonQuery();
                sqlConn.Close();
                SendSuccesEmail();
            }
            //SVNCurrentHiscentealCode/admin/harvester/logs/3525_20140822.htm
        } catch (Exception ex) {

        }

    }
    /// <summary>
    /// Method to send Email
    /// </summary>
    private void SendErrorEmail() {
        MailMessage m = new MailMessage();
        SmtpClient sc = new SmtpClient();
        m.From = new MailAddress("hydroseek@gmail.com", "Cuahsi HIS Central Administration");
        m.To.Add(new MailAddress(Page.User.Identity.Name));
        //m.CC.Add(new MailAddress("help@cuahsi.org", "Jon Pollak"));
        m.CC.Add(new MailAddress("mmartin@cuahsi.org", "Marie Martin"));
        //m.To.Add(new MailAddress("rhooper@cuahsi.org", "Rick Hooper"));
        //m.To.Add(new MailAddress("jpollak@cuahsi.org", "Jon Pollak"));
        //m.To.Add(new MailAddress("mseul@cuahsi.org", "Martin Seul"));
        //m.To.Add(new MailAddress("klavigne@cuahsi.org", "Kristin Lavigne"));
        //m.CC.Add(new MailAddress("acouch@cuahsi.org", "Alva Couch"));
        m.Subject = "Error in webservice WSDL";
        StringBuilder Sb = new StringBuilder();
        Sb.Append("<h3>Hello,</h3><br />");
        Sb.Append("<p>Harvest halted as no sites were obtained from this WSDL. Please check</p>");
        Sb.Append("Thank you");
        m.Body = Convert.ToString(Sb);
        m.IsBodyHtml = true;
        sc.Host = "smtp.gmail.com";
        sc.Port = 587;
        sc.Credentials = new System.Net.NetworkCredential("hydroseek@gmail.com", "his4cuahsi");
        sc.EnableSsl = true;
        sc.Send(m);
    }


    /// <summary>
    /// Method to send Email
    /// </summary>
    private void SendSuccesEmail() {
        MailMessage m = new MailMessage();
        SmtpClient sc = new SmtpClient();
        m.From = new MailAddress("hydroseek@gmail.com", "Cuahsi HIS Central Administration");
       // m.To.Add(new MailAddress("jpollak@cuahsi.org", "Jon Pollak"));
        m.CC.Add(new MailAddress("mmartin@cuahsi.org", "Marie Martin"));
        //m.CC.Add(new MailAddress("mmartin@cuahsi.org", "Marie Martin"));
        //m.To.Add(new MailAddress("rhooper@cuahsi.org", "Rick Hooper"));       
        //m.To.Add(new MailAddress("mseul@cuahsi.org", "Martin Seul"));
        //m.To.Add(new MailAddress("klavigne@cuahsi.org", "Kristin Lavigne"));
        //m.CC.Add(new MailAddress("acouch@cuahsi.org", "Alva Couch"));
        //Session["NetworkID
        //http://hiscentral2.cuahsi.org/pub_network.aspx?n=4
        
        m.Subject = "New Service is added";
        StringBuilder Sb = new StringBuilder();
        Sb.Append("<h3>Hello,</h3><br />");
        Sb.Append("<p>A new data service is registered with HIS Central. </p>");
        Sb.Append("<p>Below is the sevice page URL : </p>");
        Sb.Append("<p><a href='" + (HttpContext.Current.Request.Url.AbsoluteUri).Replace("addnetwork.aspx", "pub_network.aspx") + "?n=" + Session["NetworkID"].ToString() + "'>" + (HttpContext.Current.Request.Url.AbsoluteUri).Replace("addnetwork.aspx", "pub_network.aspx") + "?n=" + Session["NetworkID"].ToString() + "</a></p>");
        Sb.Append("<p>Thank you</p>");
        m.Body = Convert.ToString(Sb);
        m.IsBodyHtml = true;
        sc.Host = "smtp.gmail.com";
        sc.Port = 587;
        sc.Credentials = new System.Net.NetworkCredential("hydroseek@gmail.com", "his4cuahsi");
        sc.EnableSsl = true;
        sc.Send(m);
    }

}