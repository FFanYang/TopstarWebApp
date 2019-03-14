<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="ShowProperties.aspx.cs" Inherits="Topstar.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  
  
    <div class="container">
   
     <label class="modal-title" style="font-size: xx-large; font-weight: bold; font-family: Cambria;"> Search Property By: :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
      
    <br />
    <asp:TextBox ID="txSearchBy" class="form-control" type="text" runat="server" placeholder =" Suburb/City" Height="31px" Width="460px"></asp:TextBox>

        <asp:Button ID="btnMoreFilter" runat="server" Font-Bold="True" Font-Size="Large" Font-Underline="True" ForeColor="#000066" Text="More Filters" BackColor="White" OnClick="btnMoreFilter_Click"></asp:Button>
        <br />
        <asp:Panel ID="pnMoreFilter" runat="server">
            Price: range slider
          <br />
            <asp:Label ID="label1" class="form-control" runat="server" Text="Number of Bedrooms"></asp:Label>
            <input type="number" id="txtNoOfBedrooms" class="form-control" />
            <br />
            <asp:Label ID="label2" class="form-control" runat="server" Text="Number of Bathrooms"></asp:Label>
            <input type="number" id="txtNoOfBathrooms" class="form-control" />
            <br />


        </asp:Panel>
        <br />

        <asp:Button ID="btnSearch" class="form-control btn-primary" runat="server" Height="34px" Text="Search" Width="223px" OnClick="btnSearch_Click" />

        <br />
        <br />
        <asp:DataList ID="DataList4" runat="server" DataKeyField="propertyid" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal">
            <ItemTemplate>
                <div style="text-align: center; color: #FF0000; font-weight: bold; font-size: large;">
                    <asp:Image ID="Image2" runat="server" Height="179px"  Width="248px" ImageUrl='<%# Eval("imagePath", "{0}") %>' />
              
                    <br />
                    <asp:Label ID="streetNoLabel" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#000066" Text='<%# Eval("streetNo") %>' />
                    <asp:Label ID="streetNameLabel" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#000066" Text='<%# Eval("streetName") %>' />
                    <br />
                    <asp:Label ID="suburbLabel" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#000066" Text='<%# Eval("suburb") %>' />
                    ,<asp:Label ID="cityLabel" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#000066" Text='<%# Eval("city") %>' />
                    <br />
                    Rent: $<asp:Label ID="RweeklyLabel" runat="server" Font-Bold="True" ForeColor="#CC0000" Text='<%# Eval("Rweekly") %>' />
                    /Week<br />
                    <img src="Resources/bedroom.jpg" style="width: 35px; height: 34px"/>
                    <asp:Label ID="noOfBedroomsLabel" runat="server" Font-Bold="True" ForeColor="#006600" Text='<%# Eval("noOfBedrooms") %>' />
                
                    <img src="Resources/bathrom.jpg" style="width: 35px; height: 34px" />
                    <asp:Label ID="noOfBathroomsLabel" runat="server" Font-Bold="True" ForeColor="#006600" Text='<%# Eval("noOfBathrooms") %>' />
                    <br />
                    Availability:
                    <asp:Label ID="availabilityLabel" runat="server" Font-Bold="True" ForeColor="#CC0000" Text='<%# Eval("availability") %>' />
                    <br />
                    <br />
                </div>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT p.propertyid, p.streetNo, p.streetName, p.suburb, p.city, p.noOfBedrooms, p.noOfBathrooms, p.parking, p.availability, p.type, p.description, r.propertyid AS Expr1, r.Rpropertyid, r.Rweekly, r.furnishedStatus, m.imageid, m.name, m.imagePath, m.propertyid AS Expr2 FROM tbproperty AS p INNER JOIN tbrproperty AS r ON p.propertyid = r.propertyid INNER JOIN tbimages AS m ON r.propertyid = m.propertyid AND p.propertyid = m.propertyid"></asp:SqlDataSource>

        </div>
</asp:Content>
