<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SlideshowDemo.aspx.cs" Inherits="Topstar.SlideshowDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/excite-bike/jquery-ui.css"
rel="stylesheet" type="text/css" />
<script type="text/javascript">
var min = 0;
var max = 0;
$(function () {
    //Get records for all prices.
    GetRecords(0, 0);
});
function SetSlider() {
    //Initialize the slider
    $("#price_slider").slider({
        min: min,
        max: max,
        step: 5,
        values: [min, max],
        stop: function (event, ui) {
            var start = parseInt(ui.values[0]);
            var end = parseInt(ui.values[1]);
            $("#price_slider_value").html("$" + ui.values[0] + " - $" + ui.values[1]);
                   
            //When slider is stopped then get records for range.
            GetRecords(start, end);
        },
        slide: function (event, ui) {
            if ((ui.values[0] + 5) >= ui.values[1]) {
                return false;
            }
        }
    });
    //Display the minimum and maximum values.
    $("#price_slider_value").html("$" + min + " - $" + max);
}
function GetRecords(start, end) {
    $(".modal").show();
    $.ajax({
        type: "POST",
        url: "Default.aspx/GetProducts",
        data: '{start: ' + start + ', end: ' + end + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: OnSuccess,
        failure: function (response) {
            alert(response.responseText);
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
}
function OnSuccess(response) {
    var xmlDoc = $.parseXML(response.d);
    var xml = $(xmlDoc);
    if (min == 0 && max == 0) {
        //Only for the first time set the minimum and maximum values.
        min = parseInt(xml.find("Range").eq(0).find("Min").text());
        max = parseInt(xml.find("Range").eq(0).find("Max").text());
        SetSlider();
    }
    var products = xml.find("Products");
<%--    //var repeatColumns = parseInt("<%Rweekly %>");--%>
    $("#dvProducts").html("<div id = 'empty'>There are no products available for the selected price range.</div>");
    if (products.length > 0) {
        //Copy the DataList HTML into the DIV.
        $("#dvProducts").html($("[id*=dlProducts]").parent().html());
    }
    $("#dvProducts > table").removeAttr("id");
    var rowCount = Math.ceil(products.length / repeatColumns);
    var j = 0;
    products.each(function () {
        var product = $(this);
        var row = $("#dvProducts > table .item:last").closest("tr");
        if ($(".is_used[value='1']", row).length == repeatColumns) {
            row = $("#dvProducts > table tr").eq(0).clone();
            $(".is_used", row).val("0");
            $("#dvProducts > table").append(row);
            j = 0;
        } else {
            row = $("#dvProducts > table .item:last").closest("tr");
        }
        var cell = $(".item", row).eq(j);
        $(".name", cell).html(product.find("Name").text());
        var productId = product.find("ProductId").text();
        $(".product_id", cell).val(productId);
        $(".button", cell).text(product.find("Price").text());
        $(".is_used", cell).attr("value", "1");
        var img = $(".image", cell);
        img.attr("src", "images/" + productId + ".png");
        j++;
    });
    $("#dvProducts > table .is_used[value='0']").closest(".item").remove();
    $(".modal").hide();
}
</script>

<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div id="price_slider_value" style="width: 400px">
</div>
<div id="price_slider">
</div>
<hr />
<div id="dvProducts">
</div>
<div style="display: none">
<asp:DataList ID="dlProducts" runat="server" RepeatLayout="Table" RepeatColumns="3"
CellPadding="2" CellSpacing="20">
<ItemTemplate>
<table class="item" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td align="center" class="header">
            <span class="name">
                <%# Eval("Name") %></span>
        </td>
    </tr>
    <tr>
        <td align="center" class="body">
            <img class="image" src="" alt="" />
        </td>
    </tr>
    <tr>
        <td class="footer" align="center">
            <span class="button"></span>
            <input type="hidden" class="is_used" value="0" />
            <input type="hidden" class="product_id" value='<%# Eval("ProductId")%>' />
        </td>
    </tr>
</table>
</ItemTemplate>
</asp:DataList>
</div>
<div class="modal">
<div class="center">
<img alt="" src="loader.gif" />
</div>
</div>
        </div>
    </form>
</body>
</html>
