<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Mysore.Home" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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

</head>
<body>
<form id="form1" runat="server">
<div id="tooplate_header_wrapper">
	<div id="tooplate_header" class="wrapper">
    	<div id="top_menu">
            <ul class="header_menu">
                <!--<li><a href="about.html">About</a></li>--!>
               
                <li>
                    
                </li>
            </ul>
		</div>
        <div class="clear"></div>
        <a href="Home.aspx" class="sitetitle">Sub Registar office</a>
        <div id="tooplate_menu">
            <ul class="header_menu">
               
                <li>
                </li>
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
            });
            </script>	
        </div> <!-- END of slider -->
    </div> <!-- END of header -->
</div> <!-- END of tooplate_header_wrapper -->

    <div id="tooplate_main">
        <div class="content_wrapper">
            <div class="service_list col_4">
                <a href="/ChallanForm.aspx">
                    <a href="/ChallanForm.aspx"> <center><img src="images/calendar-2.png" alt="Icon" /></center></a>
                    <a href="/ChallanForm.aspx">Challan form</a>
                    <p>Manual upload of challan form thru sub ragister offices.</p>
                    <div class="clear"></div>
                </a></div>
            <div class="service_list col_4">
                    <a href="/ChallanEdit.aspx"> <center><img src="images/photo.png" alt="Icon" /></center></a>
                    <a href="/ChallanEdit.aspx">Challan Edit</a>
                    <p>Edit challan form thru sub ragister offices.</p>
                    <div class="clear"></div>              
            </div>
            <div class="service_list col_4">
                <a href="/Annexure.aspx">
                    <center><img src="images/favorite.png" alt="Icon" /></center></a>
                    <a href="/Annexure.aspx">Annexure</a>
                    <p>Viw the data of the department loading manually.</p>
                    <div class="clear"></div>
                </a>
            </div>
            <div class="service_list col_4 no_margin_right">
                <a href="/UnmatchedData.aspx">
                    <center><img src="images/podcast.png" alt="Icon" /></center>
                </a>
                <a href="/UnmatchedData.aspx">Unmatched Data</a>
                <p>Ummatched data between the department and the treasury office.</p>
                </a>
            </div>

            <div class="clear"></div>
           
            <div class="service_list col_4">
                <a href="/ImportData.aspx">
                    <center><img src="images/search.png" alt="Icon" /></center>
                </a>
                <a href="/ImportData.aspx">
                    Upload treasury file</a>
                    <p> Import the CSV file receieved from Treasury department.</p>
                    <div class="clear"></div>               
            </div>

            <div class="service_list col_4">                                   
                     <asp:LinkButton ID="LinkButton1"   runat="Server" OnClick="LinkButton1_Click" >Logout</asp:LinkButton>             
                    <p> Logout from the Application.</p>
                    <div class="clear"></div>               
            </div>

        </div>
        
        <div class="content_wrapper content_mb_60">
        	<h2>Recent Projects</h2>
        	<div class="col_3">
            	<div class="img_border img_border_s img_nof">
                	<img src="images/tooplate_image_01.jpg" alt="Image" />
                </div>
                <a href="#"><strong> Hinkal Bridge</strong></a>
            </div>
            <div class="col_3">
            	<div class="img_border img_border_s img_nof">
                	<img src="images/tooplate_image_02.jpg" alt="Image" />
                </div>
                <a href="#"><strong>DRC Bridge</strong></a>
            </div>
            <div class="col_3 no_margin_right">
            	<div class="img_border img_border_s img_nof">
                	<img src="images/tooplate_image_03.jpg" alt="Image" />
                </div>
                <a href="#"><strong> PVR Mall..</strong></a>
            </div>
        </div>
        <div class="clear"></div>
        <div style="display:none;" class="nav_up" id="nav_up"></div>
    </div>


<div id="tooplate_footer_wrapper">
	<div id="tooplate_footer" class="wrapper">
    	<div class="col_4">
        	<h4>Address</h4>
            <ul class="nobullet bottom_list">
                <p>
                   <asp:Table runat="server">
                       <asp:TableRow>
                           <asp:TableCell><%= DeptName %></asp:TableCell>
                       </asp:TableRow>
                       <asp:TableRow>
                           <asp:TableCell> <%= District %></asp:TableCell>
                       </asp:TableRow>
                       <asp:TableRow></asp:TableRow>
                   </asp:Table>
                   
                </p></ul>
        </div>
        
        <!--<div class="col_4">
        	<h4>Best Resources</h4>
            <ul class="nobullet bottom_list">
               	<li><a href="#">Responsive Design</a></li>            
            	<li><a href="#">New Mobile Apps</a></li>
                <li><a href="#">Learn HTML5 CSS3</a></li>
                <li><a href="#">Premiun Themes</a></li>
                <li><a href="#">Web Development</a></li>
            </ul>
        </div>
        
         <div class="col_4">
        	<h4>Links</h4>
            <ul class="nobullet bottom_list">
            	<li><a href="#">Aliquamel</a></li>
                <li><a href="#">Molestie Arcu</a></li>
                <li><a href="#">Placerat Nec</a></li>
                <li><a href="#">Hendrerit</a></li>
                <li><a href="#">Nibh Varius</a></li>
            </ul>
        </div>-->
        <!--<div class="col_4 no_margin_right">
        	<h4>Twitter</h4>
            <p>"Lorem ipsum dolor sit amet consectetur adipiscing elit <a href="#">#Donec</a> ante nibh sagittis ut lobortis a, posuere vel sem"</p>
            <a href="#">Follow me on Twitter</a>
        </div>-->
        <div class="clear"></div>
    </div> <!-- END of tooplate_footer -->
</div> <!-- END of tooplate_footer_wrapper -->
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
    javascript: window.history.forward(1);
</script>

</form>

</body>
</html>