<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Demo1.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title" style="color: #505458"><%: Title %>.</h2>
        <h3 style="color: #505458">Your application description page.</h3>
        <p>Use this area to provide additional information.</p>
    </main>
</asp:Content>
