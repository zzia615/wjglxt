<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.Master" AutoEventWireup="true" CodeBehind="FileInfo.aspx.cs" Inherits="wjglxt.FileInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server"><form runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="name" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="name" HeaderText="name" ReadOnly="True" SortExpression="name" />
            <asp:BoundField DataField="url" HeaderText="url" SortExpression="url" />
            <asp:BoundField DataField="rq" HeaderText="rq" SortExpression="rq" />
            <asp:BoundField DataField="xzcs" HeaderText="xzcs" SortExpression="xzcs" />
            <asp:CommandField ShowDeleteButton="True" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "Download.aspx?url="+Eval("url")+"&name="+Eval("name") %>' Text="下载" Target="_blank"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
</asp:GridView></form>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conStr %>" DeleteCommand="DELETE FROM [fileinfo] WHERE [name] = @name" InsertCommand="INSERT INTO [fileinfo] ([name], [url], [rq], [xzcs]) VALUES (@name, @url, @rq, @xzcs)" SelectCommand="SELECT * FROM [fileinfo]" UpdateCommand="UPDATE [fileinfo] SET [url] = @url, [rq] = @rq, [xzcs] = @xzcs WHERE [name] = @name">
        <DeleteParameters>
            <asp:Parameter Name="name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="url" Type="String" />
            <asp:Parameter Name="rq" Type="DateTime" />
            <asp:Parameter Name="xzcs" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="url" Type="String" />
            <asp:Parameter Name="rq" Type="DateTime" />
            <asp:Parameter Name="xzcs" Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
        </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
