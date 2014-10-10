<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="ManageUser.aspx.cs" Inherits="admin_ManageUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="hbox stretch">
        <aside class="aside-md bg-white b-r" id="subNav">
            <div class="wrapper b-b header"><b>FST Movies</b></div>
            <ul class="nav">
                <li class="b-b b-light"><a href="#"><i class="fa fa-chevron-right pull-right m-t-xs text-xs icon-muted"></i>Manage Films</a></li>
                <li class="b-b b-light"><a href="#"><i class="fa fa-chevron-right pull-right m-t-xs text-xs icon-muted"></i>Manage Channels</a></li>
                <li class="b-b b-light"><a href="#"><i class="fa fa-chevron-right pull-right m-t-xs text-xs icon-muted"></i>Manage Channel Special</a></li>
                <li class="b-b b-light"><a href="#"><i class="fa fa-chevron-right pull-right m-t-xs text-xs icon-muted"></i>Manage Link Film</a></li>
                <li class="b-b b-light"><a href="#"><i class="fa fa-chevron-right pull-right m-t-xs text-xs icon-muted"></i>Manage Server Film</a></li>
                <li class="b-b b-light"><a href="#"><i class="fa fa-chevron-right pull-right m-t-xs text-xs icon-muted"></i>Manage Category Film</a></li>
                <li class="b-b b-light"><a href="#"><i class="fa fa-chevron-right pull-right m-t-xs text-xs icon-muted"></i>Manage Error Film</a></li>
                <li class="b-b b-light"><a href="#"><i class="fa fa-chevron-right pull-right m-t-xs text-xs icon-muted"></i>Manage Country</a></li>
                <li class="b-b b-light"><a href="#"><i class="fa fa-chevron-right pull-right m-t-xs text-xs icon-muted"></i>Manage Users</a></li>
            </ul>
        </aside>
        <aside>
            <header class="header bg-white b-b clearfix">
                <div class="row m-t-sm">
                    <div class="col-sm-8 m-b-xs">
                        <a href="#subNav" data-toggle="class:hide" class="btn btn-sm btn-default active"><i class="fa fa-caret-right text fa-lg"></i><i class="fa fa-caret-left text-active fa-lg"></i></a>
                        <div class="btn-group">
                            <button type="button" class="btn btn-sm btn-default" title="Refresh"><i class="fa fa-refresh"></i></button>
                            <button type="button" class="btn btn-sm btn-default" title="Remove"><i class="fa fa-trash-o"></i></button>
                            <button type="button" class="btn btn-sm btn-default" title="Filter" data-toggle="dropdown"><i class="fa fa-filter"></i><span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </div>
                        <a href="#modal" data-toggle="modal" class="btn btn-sm btn-default"><i class="fa fa-plus"></i>Create</a>
                    </div>
                    <div class="col-sm-4 m-b-xs">
                        <div class="input-group">
                            <input type="text" class="input-sm form-control" placeholder="Search">
                            <span class="input-group-btn">
                                <button class="btn btn-sm btn-default" type="button">Go!</button>
                            </span>
                        </div>
                    </div>
                </div>
            </header>
            <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">

                <telerik:RadGrid ID="RadGrid1" runat="server" Skin="Metro" AutoGenerateColumns="False" AllowPaging="True" PageSize="15" OnNeedDataSource="RadGrid1_NeedDataSource">
                    <MasterTableView>
                        <Columns>
                            <telerik:GridButtonColumn ButtonType="ImageButton" FilterControlAltText="Filter column column" ImageUrl="~/admin/images/sicon.png" UniqueName="column">
                                <ItemStyle Width="30px" />
                            </telerik:GridButtonColumn>
                            <telerik:GridBoundColumn DataField="username" FilterControlAltText="Filter username column" HeaderText="Username" UniqueName="username">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="email" FilterControlAltText="Filter column1 column" HeaderText="Email" UniqueName="column1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="dob" DataFormatString="{0:d/M/yyyy}" DataType="System.DateTime" FilterControlAltText="Filter column2 column" HeaderText="DOB" UniqueName="column2">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="phone" FilterControlAltText="Filter column3 column" HeaderText="Phone" UniqueName="column3">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" HeaderText="Status" UniqueName="TemplateColumn">
                                <ItemTemplate>
                                    
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#000000" Text='<%# !Eval("isdeleted").ToString().Equals("True")?"Active":"Suspend" %>'></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>

                </telerik:RadGrid>
            </telerik:RadAjaxPanel>

        </aside>
    </section>

    <div class="modal fade" id="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Add new user</h4>
                    <asp:ValidationSummary
                        HeaderText="You must enter a value in the following fields:"
                        DisplayMode="BulletList"
                        EnableClientScript="true"
                        runat="server" ForeColor="#CC0000" />
                </div>
                <telerik:RadAjaxPanel ID="RadAjaxPanel1" LoadingPanelID="RadAjaxLoadingPanel1" runat="server">
                    <div class="row">
                        <div class="col-lg-12">
                            <section class="panel panel-default" data-validate="parsley">
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label>
                                            Username
                                            <asp:RequiredFieldValidator ControlToValidate="txtUsername" ErrorMessage="Input Username!" Text="*" runat="server" ForeColor="Red" /></label>
                                        <asp:TextBox ID="txtUsername" type="text" class="form-control" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="form-group">
                                        <label>
                                            Email 
                                            <asp:RequiredFieldValidator ControlToValidate="txtEmail" ErrorMessage="Input Email!" Text="*" runat="server" ForeColor="Red" />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ErrorMessage="Email is not correct format!" Text="*" runat="server" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" ControlToValidate="txtEmail" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </label>
                                        <asp:TextBox ID="txtEmail" type="text" data-type="email" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group pull-in clearfix">
                                        <div class="col-sm-6">
                                            <label>
                                                Enter password
                                                <asp:RequiredFieldValidator ControlToValidate="txtPassword" ErrorMessage="Input Password!" Text="*" runat="server" ForeColor="Red" />
                                            </label>
                                            <asp:TextBox ID="txtPassword" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-6">
                                            <label>
                                                Confirm password
                                                <asp:RequiredFieldValidator ControlToValidate="txtConfirmpass" ErrorMessage="Input Confirm Password!" Text="*" runat="server" ForeColor="Red" />
                                                <asp:CompareValidator ControlToCompare="txtPassword" ID="CompareValidator1" runat="server" ErrorMessage="Password is not the same!" ControlToValidate="txtConfirmpass" ForeColor="Red">*</asp:CompareValidator>
                                            </label>
                                            <asp:TextBox ID="txtConfirmpass" TextMode="Password" class="form-control" Skin="MetroTouch" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>DOB</label>
                                        <telerik:RadDatePicker ID="txtDOB" Skin="MetroTouch" runat="server" Width="100%" MaxDate="2000-12-31" SelectedDate="1998-08-08">
                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="MetroTouch" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                            </Calendar>
                                            <DateInput DateFormat="M/d/yyyy" DisplayDateFormat="M/d/yyyy" DisplayText="8/8/1998" LabelWidth="40%" SelectedDate="1998-08-08" value="8/8/1998">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput>
                                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                        </telerik:RadDatePicker>
                                    </div>
                                    <div class="form-group">
                                        <label>Phone</label>
                                        <asp:TextBox ID="txtPhone" TextMode="SingleLine" class="form-control" runat="server" placeholder="(XXX) XXXX XXX"></asp:TextBox>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="check" checked data-required="true">
                                            I agree to the <a href="#" class="text-info">Terms of Service</a>
                                        </label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </div>

                                </div>

                            </section>
                            <footer class="panel-footer text-right bg-light lter">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <asp:Button ID="btnSubmit" runat="server" class="btn btn-success btn-s-xs" Text="Submit" OnClick="btnSubmit_Click" />
                            </footer>
                        </div>
                    </div>

                </telerik:RadAjaxPanel>
                <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Metro"></telerik:RadAjaxLoadingPanel>
                <%--end row--%>
            </div>

        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</asp:Content>

