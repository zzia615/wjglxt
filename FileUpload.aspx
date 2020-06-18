<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.Master" AutoEventWireup="true" CodeBehind="FileUpload.aspx.cs" Inherits="wjglxt.FileUpload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <form runat="server">
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <div style="height:5px"></div>
        <asp:Button ID="Button1" runat="server" Text="上传" OnClick="Button1_Click" CssClass="btn btn-primary"/>
    </form>
</asp:Content>
