<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.Master" AutoEventWireup="true" CodeBehind="FileInfo.aspx.cs" Inherits="wjglxt.FileInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server"><form runat="server">
   
        <div class="form-group" style="width:420px;">
            <div class="col-sm-3">
                <asp:Label ID="Label1" runat="server" Text="文件名" for="tbFileName" CssClass="control-label"></asp:Label>
            </div>
            <div class="col-sm-7">
                <asp:TextBox ID="tbFileName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-2">
                <asp:Button ID="Button1" runat="server" Text="查询" CssClass="btn btn-primary" OnClick="Button1_Click"/>
            </div>
        </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="name" DataSourceID="SqlDataSource1" CssClass="table table-bordered">
        <Columns>
            <asp:BoundField DataField="name" HeaderText="文件名" ReadOnly="True" SortExpression="name" />
            <asp:BoundField DataField="url" HeaderText="url" SortExpression="url" Visible="false"/>
            <asp:BoundField DataField="rq" HeaderText="上传日期" DataFormatString="{0:d}" SortExpression="rq" />
            <asp:BoundField DataField="xzcs" HeaderText="下载次数" SortExpression="xzcs" />
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
