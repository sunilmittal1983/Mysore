<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeBehind="Annexure.aspx.cs" Inherits="Mysore.Annexure" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Sub Registar office</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<!--
Template 2071 Monitor
http://www.tooplate.com/view/2071-monitor
-->
<link href="tooplate_style.css" rel="stylesheet" type="text/css" />

<script type="text/JavaScript" src="js/jquery-1.6.3.js"></script> 

<link rel="stylesheet" href="css/slimbox2.css" type="text/css" media="screen" /> 
<script type="text/JavaScript" src="js/slimbox2.js"></script> 

<link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />

  
    <style type="text/css">
        .auto-style1 {
            width: 936px;
        }
        .auto-style2 {
            width: 863px;
        }
        .auto-style3 {
            width: 122px;
        }
        .auto-style4 {
            width: 914px;
            margin-right: 0px;
        }
    </style>

  
</head>
<body> 
<form id="frm1" runat="server">
<div id="tooplate_header_wrapper">
	<div id="tooplate_header" class="wrapper">
    	<br />
    	<div id="top_menu">
            <ul class="header_menu">
                
                <!--<li><a href="about.html">About</a></li>
                <li><a href="contact.html">Contact</a></li>-->
            </ul>
		</div>
        <div class="clear"></div>
       <%-- <a href="Home.aspx" class="sitetitle">Sub Registar office</a>--%>
        <div id="tooplate_menu">
            <ul class="header_menu">
                
            </ul>
		</div>
        <div id="tooplate_slider">
            <div class="slider-wrapper theme-default">
                <div id="slider" class="nivoSlider">
                    <img src="images/slider/01.jpg" alt="" title="" />
                    <img src="images/slider/02.jpg" alt="" title="" />
                     <img src="images/slider/01.jpg" alt="" title="" />
                    <img src="images/slider/03.jpg" alt="" title="" />                
                </div>
            </div>
            <script type="text/javascript" src="js/jquery-1.6.3.min.js"></script>
            <script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
          
           <script type="text/javascript">
            $(window).load(function() {
                $('#slider').nivoSlider({
                effect: 'random',
                controlNav: true, // 1,2,3... navigation
                directionNav: false,
                animSpeed: 800, // Slide transition speed
                pauseTime: 4000, // How long each slide will show
                });
            }); </script>
        </div> <!-- END of slider -->
    </div> <!-- END of header -->
</div> <!-- END of tooplate_header_wrapper -->
   
<div id="tooplate_main" class="auto-style2">
    	<div class="auto-style7">
            <table class="auto-style1">
                <tr>
                    <td colspan="2" align="center">
                     <fieldset class="auto-style4" align="center" >
					<legend><strong>Reports</strong></legend></br>
					
					<table>
						<tr><td style="color:black; padding-left:220px;" class="auto-style3">Head of Account</td> <td style="width:10px;"></td> <td><select id="Select1" name="tbname" style=" width:100%; border:1px solid black;align:center; font-size:20px" runat="server" >
						<option value="0030-02-103-0-01-000" selected>Duty</option>
						<option value="0030-02-102-0-03-000" >Cess on Stamps</option>
						<option value="0030-03-104-0-01-000" >Registration Fees</option>
						<option value="0070-01-800-0-02-000" >Marriage Fees</option>
						<option value="0030-03-800-0-02-000" >Scanning Fees</option>
						<option value="0029-00-106-0-03-000" >Mutation/R.R. Fees</option>
						<option value="0030-03-800-0-01-000" >Misc. Fees</option>
						<option value="0070-60-118-0-01-000" >R.T.I Fees</option>
						</select>
						</td></tr>
						<tr><td class="auto-style3" ></td> <td style="width:10px;"><strong><div class="cl">&nbsp;</div> </strong></td> <td></td></tr>
						<tr><td style=" color:black; padding-left:220px;" class="auto-style3">Beginning Date</td> <td style="width:10px;"></td> <td><input type="date"  value="2018-12-29" name="bdate" style="border:1px solid black; align:center; font-size:20px" /></td></tr>
						<tr><td style="color:black; padding-left:220px;" class="auto-style3">End Date</td> <td style="width:10px;"></td> <td><input type="date"  value="2018-12-29" name="edate" style="border:1px solid black; align:center; font-size:20px" /></td></tr>
						<tr><td style="padding-left:200px;" class="auto-style3"></td> <td style="width:10px;"><strong> </strong></td> <td></td></tr>
					</table>
					<div>						
						<a href="Home.aspx"><button type="button" style="width:150px" >Back</button></a>
					    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Generate" />
                         <asp:Button ID="Logout" class="login100-form-btn" runat="server" Text="Logout" OnClick="Logout_Click" Width="71px" />
						
                </fieldset>
                    </td>
                </tr>
                </table>
</div>

                       

<asp:Repeater ID="Repeater0" runat="server" Visible="true" >
<HeaderTemplate>
    <table border="0" width="600px" cellpadding="2" cellspacing="1" style="border: 1px solid maroon;">
<tr bgcolor="maroon">
<th>Sl No.</th>
<th>Challan Created Date</th>
<th>Name & Address of Bank</th>
<th>Amount</th>
<th>K2 Challan RF No.</th>
<th>DD No.</th>
<th>Date of Remittance to Bank</th>
<th>KTC 25 Sr. No</th>
<th>KTC 25 Challan Number</th>
<th>Scroll Date</th>
<th>Realization Days</th>
<th>Date of Registration</th>
<th>Type of Document</th>
<th>Doc. No.</th>
</tr>
</HeaderTemplate>
<ItemTemplate>
<tr>
    <td></td>
<td width="100">
<%# DataBinder.Eval(Container, "DataItem.Challan_creation_Date")%>
</td>
<td>
<%# DataBinder.Eval(Container, "DataItem.BankName")%>
</td>
<td width="150">
<%# DataBinder.Eval(Container, "DataItem.Challan_Amount")%>
</td>
<td width="100" align="center">
<%# DataBinder.Eval(Container, "DataItem.Challan_Ref")%>
</td>
    <td width="100" align="center">
<%# DataBinder.Eval(Container, "DataItem.DemandDraftNumber")%>
</td>
    <td width="100" align="center">
<%# DataBinder.Eval(Container, "DataItem.Date_of_Registration")%>
</td><td width="100" align="center">
<%--<%# DataBinder.Eval(Container, "DataItem.Challan_District")%>--%>
</td>
    <td width="100" align="center">
<%--<%# DataBinder.Eval(Container, "DataItem.DeptName")%>--%>
</td>
    <td width="100" align="center">
<%--<%# DataBinder.Eval(Container, "DataItem.BankName")%>--%>
</td>
    <td width="100" align="center">
<%--<%# DataBinder.Eval(Container, "DataItem.BankAddress")%>--%>
</td><td width="100" align="center">
<%# DataBinder.Eval(Container, "DataItem.Date_of_Registration")%>
</td><td width="100" align="center">
<%# DataBinder.Eval(Container, "DataItem.Type_of_Doc")%>
</td>
    <td width="100" align="center">
<%# DataBinder.Eval(Container, "DataItem.Challan_Document_No")%>
</td>
</tr>
</ItemTemplate>
</asp:Repeater>
                            



        
                        </td>
                    </tr>
                        </div>
        </form>

    
<div id="tooplate_copyright_wrapper">
    <div id="tooplate_copyright" class="wrapper">
      Copyright © 2018 Samruddhi Goverenment Organization
   </div>
</div>
<script src="js/scroll-startstop.events.jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		var $elem = $('#content');
		
		$('#nav_up').fadeIn('slow');
		
		$(window).bind('scrollstart', function(){
			$('#nav_up,#nav_down').stop().animate({'opacity':'0.2'});
		});
		$(window).bind('scrollstop', function(){
			$('#nav_up,#nav_down').stop().animate({'opacity':'1'});
		});
		
		$('#nav_up').click(
			function (e) {
				$('html, body').animate({scrollTop: '0px'}, 800);
			}
		);
	});
</script>


</body>
</html>