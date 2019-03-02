<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="RentPage.aspx.cs" Inherits="Topstar.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1> Search Property By:</h1>

    <asp:TextBox ID="txtSuburb" runat="server" Height="36px" Width="568px"></asp:TextBox>
&nbsp;&nbsp;
    <asp:Button ID="btnSearch" runat="server" Height="40px" Text="Search" Width="175px" />
    <br />
    <br />
    <asp:DataList ID="DataList4" runat="server" DataKeyField="propertyid" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <asp:Image ID="Image2" runat="server" Height="210px" ImageUrl='<%# Eval("imagePath") %>' Width="282px" />
            <br />
            <asp:Label ID="streetNoLabel" runat="server" Text='<%# Eval("streetNo") %>' />
            &nbsp;<asp:Label ID="streetNameLabel" runat="server" Text='<%# Eval("streetName") %>' />
            <br />
            <asp:Label ID="suburbLabel" runat="server" Text='<%# Eval("suburb") %>' />
            ,
            <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
            <br />
            <asp:Image ID="Image3" runat="server" Height="24px" Width="34px" />
            &nbsp;<asp:Label ID="noOfBedroomsLabel" runat="server" Text='<%# Eval("noOfBedrooms") %>' />
            <br />
            <asp:Image ID="Image4" runat="server" Height="23px" Width="32px" />
            &nbsp;<asp:Label ID="noOfBathroomsLabel" runat="server" Text='<%# Eval("noOfBathrooms") %>' />
            <br />
            Availability:
            <asp:Label ID="availabilityLabel" runat="server" Text='<%# Eval("availability") %>' />
            <br />
            Rent:
            <asp:Label ID="RweeklyLabel" runat="server" Text='<%# Eval("Rweekly") %>' />
            <br />
            <br />
<br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="select * from tbproperty p, tbrproperty r, tbimages i where p.propertyid = r.propertyid and p.imageid = i.imageid;"></asp:SqlDataSource>

</asp:Content>
