<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeBehind="ChallanForm.aspx.cs" Inherits="Samruddhi.ChallanForm" %>


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

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"  type="text/css"/>
  <link rel="stylesheet" href="/resources/demos/style.css"  type="text/css"/>
  <script src="https://code.jquery.com/jquery-1.12.4.js" type="text/JavaScript"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" type="text/JavaScript"></script>   
  <script type="text/javascript">
    function Validate() {
        var isValid = true; 
        //Reference the Table.
        var tblForm = document.getElementById("frm1"); 
        //Reference all INPUT elements in the Table.
        var inputs = document.getElementsByTagName("input"); 
        //Loop through all INPUT elements.
        for (var i = 0; i < inputs.length; i++) { 
            //Check whether the INPUT element is TextBox.
            if (inputs[i].type == "text") {
                //Check whether its Value is not BLANK and Validation is required.
                if (Trim(inputs[i].value) == "" && inputs[i].className.indexOf("required") != 1) {
                    //If Validation has FAILED, show error message.
                    isValid = false;
                    ShowHideError(inputs[i], "block");
                } else {
                    //If Validation is SUCCESS, hide error message.
                    ShowHideError(inputs[i], "none");
                }
            }
        }
        return isValid;
    };
    function sum() {
        var amt1 = document.getElementById('amt1').value;
        var amt2 = document.getElementById('amt2').value;
        var amt3 = document.getElementById('amt3').value;
        var amt4 = document.getElementById('amt4').value;
        var amt5 = document.getElementById('amt5').value;
        var amt6 = document.getElementById('amt6').value;
        var amt7 = document.getElementById('amt7').value;
        var amt8 = document.getElementById('amt8').value;
        var result = parseInt(amt1) + parseInt(amt2) + parseInt(amt3) + parseInt(amt4) + parseInt(amt5) + parseInt(amt6) + parseInt(amt7) + parseInt(amt8);
        if (!isNaN(result)) {
            document.getElementById('total').value = result;
        }
    }
    function ShowHideError(textbox, display) {
        var row = textbox.parentNode.parentNode;
        var errorMsg = row.getElementsByTagName("span")[0];
        if (errorMsg != null) {
            errorMsg.style.display = display;
        }
    };
 
    function Trim(value) {
        return value.replace(/^\s+|\s+$/g, '');
    };
</script>
    <style type="text/css">
        .auto-style1 {
            width: 727px;
        }
        .auto-style3 {
            width: 325px;
        }
        </style>
    <style type="text/css">
     .error
     {
        color: Red;
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
                <li> </li>
                <!--<li><a href="about.html">About</a></li>
                <li><a href="contact.html">Contact</a></li>-->
            </ul>
		</div>
        <div class="clear"></div>
        <a href="Home.aspx" class="sitetitle">Sub Registar office</a>
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
            });          </script>	
        </div> <!-- END of slider -->
    </div> <!-- END of header -->
</div> <!-- END of tooplate_header_wrapper -->
   
     <div id="tooplate_main">
    	<div class="content_wrapper">
            <table class="auto-style1">
                <tr>
                    <td><p align="Center" style="padding:10px 50px 0px 0px; font-size:18px;"><strong>Department of Stamps & Registration</strong>
                      </p>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;
                    <fieldset class="fieldsetreg1">
					<legend><strong>Challan Information</strong></legend>
					    <asp:Label ID="lsterrorMessage" runat="server" ForeColor="Red" Text="lsterrorMessage" Visible="False"></asp:Label>
					<p align="right" style="padding:10px 50px 0px 0px; font-size:18px;"></p>
					<table>
						<tr><td style="padding:10px 50px 10px 50px;">Challan Reference Number <h5 style="color:red; display: inline-block;">*</h5></td> <td style="padding:0px 50px 10px 50px;"></td>
                             <td>
                                 <input type="text" name="challanrefno" style="align:center; font-size:20px; width: 400px;" required value="<%=Challan_Ref %>" maxlength="20"/>
                                 <%--<asp:TextBox ID="challanrefno" runat="server" style="align:center; font-size:20px; width: 400px;"  CssClass="required" />--%>
                             </td>
                            <%-- <td style="padding:10px 50px 10px 50px;"><span class="error" style="display: none">Challan reference number is required.</span></td>--%>

						</tr>
						<tr><td style="padding:10px 50px 10px 50px;">Challan creation date <h5 style="color:red; display: inline-block;">*</h5></td> <td style="padding:0px 50px 10px 50px;"></td> <td><input type="date" value="<%=Challan_creation_Date %>" name="challancdate" style="align:center; font-size:20px; width: 400px;" required></td></tr><tr><td style="padding:10px 50px 10px 50px;">Date of Remittance <h5 style="color:red; display: inline-block;">*</h5></td> <td style="padding:0px 50px 10px 50px;"></td> <td><input type="date"  value="<%= Challan_Remit_Date %>" name="paydate" style="align:center; font-size:20px; width: 400px;" required /></td></tr>
						<tr><td style="padding:10px 150px 10px 50px;">Remitters Name</td> <td style="padding:0px 50px 10px 50px;"></td> <td><input type="text" name="remitname" style="align:center; font-size:20px; width: 400px;" value="<%=Challan_Remitt_Name %>" maxlength="50" ></td>                              
						</tr>
					</table>
				</fieldset>
                 
				<fieldset class="fieldsetreg1">
					<legend ><strong>Head of Account Information</strong></legend>
					<table style="padding:10px 0px 20px 0px">
						<tr ><td style="padding:0px 50px 0px 20px;">Duty</td><td style="padding-right:50px; ">0030-02-103-0-01-000</td><td style="padding-right:50px;">  <td><input type="number" name="amt1" id="t1" onkeyup="sum();" style="align:center; font-size:20px; width: 200px;" value="<%=Duty_HOA %>" maxlength="10" ></td></tr>
						<tr ><td style="padding:0px 50px 0px 20px;">Cess on Stamps</td><td style="padding-right:50px; ">0030-02-102-0-03-000</td><td style="padding-right:50px;">  <td><input type="number" name="amt2" id="t2" onkeyup="sum();" style="align:center; font-size:20px; width: 200px;" value="<%=Cess_HOA %>" maxlength="10" ></td></tr>
						<tr ><td style="padding:0px 50px 0px 20px;">Registration Fee</td><td style="padding-right:50px; ">0030-03-104-0-01-000</td><td style="padding-right:50px;">  <td><input type="number" name="amt3" id="t3" onkeyup="sum();" style="align:center; font-size:20px; width: 200px;" value="<%= Reg_HOA %>" maxlength="10"></td></tr>
						<tr ><td style="padding:0px 50px 0px 20px;">Marriage Fee</td><td style="padding-right:50px; ">0070-01-800-0-02-000</td><td style="padding-right:50px;">  <td><input type="number" name="amt4" id="t4" onkeyup="sum();" style="align:center; font-size:20px; width: 200px;" value="<%= Marriage_HOA %>" maxlength="10" ></td></tr>
						<tr ><td style="padding:0px 50px 0px 20px;">Scanning Fee</td><td style="padding-right:50px; ">0030-03-800-0-02-000</td><td style="padding-right:50px;">  <td><input type="number" name="amt5" id="t5" onkeyup="sum();" style="align:center; font-size:20px; width: 200px;" value="<%= Scanning_HOA %>" maxlength="10" ></td></tr>
						<tr ><td style="padding:0px 50px 0px 20px;">Mutation Fee / R R Fee</td><td style="padding-right:50px; ">0029-00-106-0-03-000</td><td style="padding-right:50px;">  <td><input type="number" name="amt6" id="t6" onkeyup="sum();" style="align:center; font-size:20px; width: 200px;" value="<%=Mutation_HOA %>" maxlength="10" ></td></tr>
						<tr ><td style="padding:0px 50px 0px 20px;">Miscellaneous Fee</td><td style="padding-right:50px; ">0030-03-800-0-01-000</td><td style="padding-right:50px;">  <td><input type="number" name="amt7" id="t7" onkeyup="sum();" style="align:center; font-size:20px; width: 200px;" value="<%=Misc_HOA %>" maxlength="10" ></td></tr>
						<tr ><td style="padding:0px 50px 0px 20px;">R T I</td><td style="padding-right:50px; ">0070-60-118-0-01-000</td><td style="padding-right:50px;">  <td><input type="number" name="amt8" id="t8" onkeyup="sum();" style="align:center; font-size:20px; width: 200px;" value="<%=RTI_HOA %>" maxlength="10" ></td></tr>
						<tr ><td style="padding:0px 50px 0px 20px;">Total Amount</td><td style="padding-right:50px; "></td><td style="padding-right:50px;">  <td><input type="number" name="total" id="total" style="align:center; font-size:20px; width: 200px;" readonly></td></tr>
					</table>	
				</fieldset>
				
				<fieldset class="fieldsetreg1">
					<legend><strong>Bank Details</strong></legend>
					
					<table>
						<tr><td style="padding:10px 50px 10px 50px;">Bank Name <h5 style="color:red; display: inline-block;">*</h5></td> <td style="padding:0px 50px 10px 50px;"></td> <td><select id= "SelectBank" name="SelectBank" style="align:center;  font-size:20px; width: 400px;" runat="server">
							<option value="0" selected>Select bank</option>
							<option value="Allahabad bank">Allahabad bank</option>
<option value="Andhra bank">Andhra bank</option>
<option value="Axis Bank">Axis Bank</option>
<option value="Bank of Baroda">Bank of Baroda</option>
<option value="Bank of India">Bank of India</option>
<option value="Bank of Maharashtra">Bank of Maharashtra</option>
<option value="Bharatiya Mahila Bank Ltd">Bharatiya Mahila Bank Ltd</option>
<option value="Canara Bank">Canara Bank</option>
<option value="Catholic syrian Bank Ltd">Catholic syrian Bank Ltd</option>
<option value="Central Bank of India">Central Bank of India</option>
<option value="City Union bank of India">City Union bank of India</option>
<option value="Corporation Bank">Corporation Bank</option>
<option value="Deferal Bank">Deferal Bank</option>
<option value="DENA Bank">DENA Bank</option>
<option value="Dhanalakshmi Bank">Dhanalakshmi Bank</option>
<option value="HDFC Bank">HDFC Bank</option>
<option value="HSBC Bank">HSBC Bank</option>
<option value="ICICI Bank">ICICI Bank</option>
<option value="IDBI Bank">IDBI Bank</option>
<option value="Idusind Bank">Idusind Bank</option>
<option value="Indian Bank">Indian Bank</option>
<option value="Indian Overseas Bank">Indian Overseas Bank</option>
<option value="ING vysya Bank">ING vysya Bank</option>
<option value="Jammu & Kashmir Bank Ltd">Jammu & Kashmir Bank Ltd</option>
<option value="Karnataka Bank Ltd">Karnataka Bank Ltd</option>
<option value="Karur Vysya Bank">Karur Vysya Bank</option>
<option value="Kotak Mahindra Bank Ltd">Kotak Mahindra Bank Ltd</option>
<option value="Laxmi Vilas Bank">Laxmi Vilas Bank</option>
<option value="Oriental Bank of Commerce">Oriental Bank of Commerce</option>
<option value="Punjab & Sind Bank">Punjab & Sind Bank</option>
<option value="Punjab National Bank">Punjab National Bank</option>
<option value="Saraswat Cooperative Bank Ltd">Saraswat Cooperative Bank Ltd</option>
<option value="South India Bank">South India Bank</option>
<option value="State Bank of Hyderabad">State Bank of Hyderabad</option>
<option value="State Bank of India">State Bank of India</option>
<option value="State bank of Patiala">State bank of Patiala</option>
<option value="State bank of Travancore">State bank of Travancore</option>
<option value="Syndicate Bank">Syndicate Bank</option>
<option value="The Karanataka State Cooperative Apex Bank Ltd">The Karanataka State Cooperative Apex Bank Ltd</option>
<option value="The Shamro Vithal Cooperative Bank">The Shamro Vithal Cooperative Bank</option>
<option value="Tumkur Grain Merchants Cooperative Bank Ltd">Tumkur Grain Merchants Cooperative Bank Ltd</option>
<option value="UCO Bank">UCO Bank</option>
<option value="Union Bank of India">Union Bank of India</option>
<option value="United Bank of India">United Bank of India</option>
<option value="Vijaya Bank">Vijaya Bank</option>
<option value="Yes Bank">Yes Bank</option>
								</select></td></tr>
								<tr><td style="padding:10px 50px 10px 50px;">Bank Name entry</td> <td style="padding:0px 50px 10px 50px;"></td> <td><input type="text" name="cbanknames" value="<%= BankNameEntry%>" style="align:center; font-size:20px; width: 400px;" maxlength="50"></td>
                                     
								</tr>
						<tr><td style="padding:10px 50px 10px 50px;">Demand Draft Number</td> <td style="padding:0px 50px 10px 50px;"></td> <td><input type="number" id="ddno" name="ddno" style="align:center; font-size:20px; width: 400px;"  onkeyup="newinput()" onload="newinput()" value="<%= DemandDraftNumber%>" maxlength="50"></td></tr>
						<tr id="new"></tr>
						
						<script>
						
						function newinput() {
								
							if (parseInt(document.getElementById("ddno").value)>0)
							document.getElementById("new").innerHTML='<td style="padding:10px 50px 10px 50px;">DD Date</td> <td style="padding:0px 50px 10px 50px;"></td> <td><input type="date" name="dddate" style="align:center; font-size:20px; width: 400px;" value="2018-12-29"></td>';
							else
								document.getElementById("new").innerHTML="";
							}
							</script>
							
						<tr><td style="padding:10px 50px 10px 50px;">Date of Registration <h5 style="color:red; display: inline-block;">*</h5></td> <td style="padding:0px 50px 10px 50px;"></td> <td><input type="date" name="regdate" style="align:center; font-size:20px; width: 400px;" value="<%=Date_of_Registration%>" required></td></tr>
						<tr><td style="padding:10px 50px 10px 50px;">Type of Document</td> <td style="padding:0px 50px 10px 50px;"></td> <td>
							<select id="typeofdoc" name="typeofdoc" style="align:center; font-size:20px; width: 400px;" runat="server">
							<option value="-" selected>None</option>
<option value="Acknowledgment of a Debt">Acknowledgment of a Debt</option>
<option value="Adoption Deed">Adoption Deed</option>
<option value="Agreement">Agreement</option>
<option value="Allotment of Shares">Allotment of Shares</option>
<option value="Amalgamation">Amalgamation</option>
<option value="Attestation">Attestation</option>
<option value="Bond">Bond</option>
<option value="Cancellation of Instruments">Cancellation of Instruments</option>
<option value="Cash Remittance">Cash Remittance</option>
<option value="Certificate">Certificate</option>
<option value="Chit Agreement">Chit Agreement</option>
<option value="Composition Deed">Composition Deed</option>
<option value="Conscent Deed">Conscent Deed</option>
<option value="Counterpart or Duplicate of any Instrument">Counterpart or Duplicate of any Instrument</option>
<option value="Declaration">Declaration</option>
<option value="Declaration of Trust">Declaration of Trust</option>
<option value="Declaration or davit">Declaration or davit</option>
<option value="Deposit of Title Deed">Deposit of Title Deed</option>
<option value="Development or Construction agreement">Development or Construction agreement</option>
<option value="Discharge Deed">Discharge Deed</option>
<option value="Dissolution of Partnership firm">Dissolution of Partnership firm</option>
<option value="Exchange of Property">Exchange of Property</option>
<option value="Gift">Gift</option>
<option value="ill of exchange">ill of exchange</option>
<option value="Instrument of Lease-cum-Sale">Instrument of Lease-cum-Sale</option>
<option value="Instrument of Partnership Deed">Instrument of Partnership Deed</option>
<option value="Instruments Cancellation">Instruments Cancellation</option>
<option value="Lease agreement">Lease agreement</option>
<option value="Lease of Immovable Property">Lease of Immovable Property</option>
<option value="Lease Transfer">Lease Transfer</option>
<option value="Lease-cum-Sale">Lease-cum-Sale</option>
<option value="Mortgage">Mortgage</option>
<option value="Mortgage Deed">Mortgage Deed</option>
<option value="Partition">Partition</option>
<option value="Partition Firm">Partition Firm</option>
<option value="Power of Attorney">Power of Attorney</option>
<option value="Purchase or sales">Purchase or sales</option>
<option value="Reconveyance of Mortgaged Property">Reconveyance of Mortgaged Property</option>
<option value="Release">Release</option>
<option value="Revocation of Settlement">Revocation of Settlement</option>
<option value="Sale Certificate">Sale Certificate</option>
<option value="Sale/Conveyance">Sale/Conveyance</option>
<option value="Settlement">Settlement</option>
<option value="Share">Share</option>
<option value="Surrender of Lease">Surrender of Lease</option>
<option value="Transfer">Transfer</option>
<option value="Transfer of Lease">Transfer of Lease</option>
<option value="Transfer of Licence">Transfer of Licence</option>
<option value="Transferable development rights">Transferable development rights</option>
						</select></td></tr>
						<tr><td style="padding:10px 50px 10px 50px;">Document Number</td> <td style="padding:0px 50px 10px 50px;"></td> <td><input type="text" name="docno" style="align:center; font-size:20px; width: 400px;" value="<%= Challan_Document_No %>" maxlength="50" ></td></tr>
					</table></br>
					
					<div class="cols" >
						<div class="col" style="align:center; padding-left:280px; " >
						 <asp:Button ID="Submit" runat="server" class="col-btn" style="font-size:16px" OnClick="Submit_Click1" Text="Submit" />
						 <asp:Button ID="Button2" runat="server" class="col-btn" style="font-size:16px" onclick="Button2_Click" CausesValidation="False" Text="Reset"/>
                         <asp:Button ID="Logout" runat="server" Text="Logout" OnClick="Logout_Click" class="col-btn" style="font-size:16px" CausesValidation="False"/>               
						<a href="Home.aspx"><button type="button" class="col-btn" style="font-size:16px;">Back</button></a>
						</div>
					</div>
				</fieldset>
                    </td>
                </tr>
            </table>
         <div class="clear"></div>
    </div> <!-- END of tooplate_footer -->
</div> <!-- END of tooplate_footer_wrapper -->
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