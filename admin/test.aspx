<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="admin_test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
            <telerik:RadDateInput ID="RadDateInput1" Runat="server" Culture="en-US" DateFormat="M/d/yyyy" DisplayDateFormat="M/d/yyyy" 
                EmptyMessage="M/d/yyyy" LabelWidth="64px" MaxDate="2000-12-31" Skin="MetroTouch" Width="160px">
            </telerik:RadDateInput>
            <telerik:RadMediaPlayer ID="RadMediaPlayer2" runat="server" Height="360px" Width="640px"
                BannerCloseButtonToolTip="Close"
                Title="Getting Started with the Telerik Platform"
                Source="https://www.youtube.com/watch?v=OKSkTO0JEHg">
                <Banners>
                    <telerik:MediaPlayerBanner
                        NavigateURL="http://www.telerik.com/products/aspnet-ajax.aspx"
                        ImageUrl="Image/Banner.png"
                        StartTime="3" EndTime="33"
                        ShowCloseButton="true"
                        ToolTip="UI for ASP.NET AJAX" />
                </Banners>
            </telerik:RadMediaPlayer>
            <telerik:RadMediaPlayer ID="RadMediaPlayer1" runat="server" HDSource="http://channelz2.r16s92.vcdn.vn/zv/3e82aaa6c189499e5e581a077e7be2d6/54356d90/2014/09/20/3/2/3232990df4c374ae5c10d201a4fe5080.mp4" Height="400px" Poster="http://image.mp3.zdn.vn/banner/5/b/5b4675ec29aca0a82d80ca8c0bd8b320_1412132008.jpg" Skin="Glow" Source="http://channelz2.r16s92.vcdn.vn/zv/3e82aaa6c189499e5e581a077e7be2d6/54356d90/2014/09/20/3/2/3232990df4c374ae5c10d201a4fe5080.mp4" Width="640px"></telerik:RadMediaPlayer>
      
              <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Metro"></telerik:RadAjaxLoadingPanel>
             </div>
    </form>
</body>
</html>
