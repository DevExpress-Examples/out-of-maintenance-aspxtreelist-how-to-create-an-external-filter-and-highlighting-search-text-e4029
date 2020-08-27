<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v14.2, Version=14.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to create an external filter with the ASPxTextBox and highlighting search text</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
                 ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Employees]">
            </asp:SqlDataSource>
            
            <dx:ASPxButton ID="FilterButton" runat="server" OnClick="FilterButton_Click" Text="Filter">
            </dx:ASPxButton>
            <dx:ASPxTextBox ID="SearchText" Text="" runat="server" Width="170px"></dx:ASPxTextBox>
            <dx:ASPxTreeList ID="EmployeeTreeList" ParentFieldName="ReportsTo" OnHtmlDataCellPrepared="ASPxTreeList1_HtmlDataCellPrepared" 
                runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="EmployeeID">
                <Columns>
                    <dx:TreeListTextColumn FieldName="LastName" VisibleIndex="0">
                    </dx:TreeListTextColumn>
                    <dx:TreeListTextColumn FieldName="FirstName" VisibleIndex="1">
                    </dx:TreeListTextColumn>
                    <dx:TreeListTextColumn FieldName="Title" VisibleIndex="2">
                    </dx:TreeListTextColumn>
                    <dx:TreeListTextColumn FieldName="TitleOfCourtesy" VisibleIndex="3">
                    </dx:TreeListTextColumn>
                    <dx:TreeListDateTimeColumn FieldName="BirthDate" VisibleIndex="4">
                    </dx:TreeListDateTimeColumn>
                    <dx:TreeListDateTimeColumn FieldName="HireDate" VisibleIndex="5">
                    </dx:TreeListDateTimeColumn>
                    <dx:TreeListTextColumn FieldName="Address" VisibleIndex="6">
                    </dx:TreeListTextColumn>
                    <dx:TreeListTextColumn FieldName="City" VisibleIndex="7">
                    </dx:TreeListTextColumn>
                    <dx:TreeListTextColumn FieldName="Region" VisibleIndex="8">
                    </dx:TreeListTextColumn>
                    <dx:TreeListTextColumn FieldName="PostalCode" VisibleIndex="9">
                    </dx:TreeListTextColumn>
                    <dx:TreeListTextColumn FieldName="Country" VisibleIndex="10">
                    </dx:TreeListTextColumn>
                    <dx:TreeListTextColumn FieldName="HomePhone" VisibleIndex="11">
                    </dx:TreeListTextColumn>
                    <dx:TreeListTextColumn FieldName="Extension" VisibleIndex="12">
                    </dx:TreeListTextColumn>
                    <dx:TreeListTextColumn FieldName="Notes" VisibleIndex="13">
                    </dx:TreeListTextColumn>
                    <dx:TreeListTextColumn FieldName="ReportsTo" VisibleIndex="14">
                    </dx:TreeListTextColumn>
                </Columns>
            </dx:ASPxTreeList>
        </div>
    </form>
</body>
</html>
