<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Capture.aspx.cs" Inherits="Demo1.Capture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-6">
            <div class="form">
                <h2 style="color: #505458" class="form-label">
                    Firstname
                </h2>
                <asp:TextBox ID="txtFirstname" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFirstname" runat="server" ControlToValidate="txtFirstname" ErrorMessage="First name is required" CssClass="error-message" ValidationGroup="vgCapture" />

                <h2 style="color: #505458" class="form-label">
                    Lastname
                </h2>
                <asp:TextBox ID="txtLatsName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLatsName" ErrorMessage="Last name is required" CssClass="error-message" ValidationGroup="vgCapture" />

                <h2 style="color: #505458" class="form-label">
                    Date of Birth
                </h2>
                <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ControlToValidate="txtDOB" ErrorMessage="Date of birth is required" CssClass="error-message" ValidationGroup="vgCapture" />
                <asp:RegularExpressionValidator ID="revDOB" runat="server" ControlToValidate="txtDOB" ErrorMessage="Invalid date format (yyyy-MM-dd)" ValidationExpression="^\d{4}-\d{2}-\d{2}$" CssClass="error-message" ValidationGroup="vgCapture" />

                <h2 style="color: #505458" class="form-label">
                    Email Address
                </h2>
                <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmailAddress" runat="server" ControlToValidate="txtEmailAddress" ErrorMessage="Email address is required" CssClass="error-message" ValidationGroup="vgCapture" />
                <asp:RegularExpressionValidator ID="revEmailAddress" runat="server" ControlToValidate="txtEmailAddress" ErrorMessage="Invalid email address" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" CssClass="error-message" ValidationGroup="vgCapture" />

                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add Person" OnClick="btnAdd_Click" ValidationGroup="vgCapture" />
                <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
