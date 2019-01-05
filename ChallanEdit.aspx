<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeBehind="ChallanEdit.aspx.cs" Inherits="Samruddhi.ChallanEdit" %>


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
            width: 947px;
            height: 506px;
            margin-left: 0px;
        }
        .auto-style2 {
            width: 472px;
        }
        .auto-style6 {
            width: 609px;
        }
        .auto-style7 {
            overflow: hidden;
            width: 111%
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
            });</script>
        </div> <!-- END of slider -->
    </div> <!-- END of header -->
</div> <!-- END of tooplate_header_wrapper -->
	 <!-- END of tooplate_footer_wrapper -->
     <div id="tooplate_main">
    	<div class="auto-style7">
            	<fieldset class="fieldsetreg" align="center" >
					<legend><strong>Edit</strong></legend></br>
					<table>
						<tr><td style="color:black; width:225px; padding-left:220px;">Challan Ref No: </td> <td style="width:10px;"></td> <td>
						<input type="text" name="chrefno" style="border:1px solid black; align:center; font-size:20px" required maxlength="20"/></td></tr></table></br>
					<div>						
						<a href="Home.aspx"><button type="button" style="width:150px" >Back</button></a>
						<asp:Button ID="submit" content="edit" autofocus style="width:150px" onclick="Button2_Click"  runat="server" Text="Edit"/>                          
						</br>
						</br>
					</div>
				</fieldset>
            </div>
         </div>
     <div class="clear"></div>
        </form>
<div id="tooplate_copyright_wrapper">
    <div id="tooplate_copyright" class="wrapper">
      Copyright © 2018 Samruddhi Goverenment Organization
   </div>
</div>

<script src="js/scroll-startstop.events.jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	//$(function() {
	//	var $elem = $('#content');
		
	//	$('#nav_up').fadeIn('slow');
		
	//	$(window).bind('scrollstart', function(){
	//		$('#nav_up,#nav_down').stop().animate({'opacity':'0.2'});
	//	});
	//	$(window).bind('scrollstop', function(){
	//		$('#nav_up,#nav_down').stop().animate({'opacity':'1'});
	//	});
		
	//	$('#nav_up').click(
	//		function (e) {
	//			$('html, body').animate({scrollTop: '0px'}, 800);
	//		}
	//	);
	//});
</script>


</body>
</html>