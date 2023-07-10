<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewAll.aspx.cs" Inherits="Demo1.ViewAll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <asp:DropDownList ID="ddlSortBy" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSortBy_SelectedIndexChanged">
                <asp:ListItem Text="Sort by Firstname" Value="0"></asp:ListItem>
                <asp:ListItem Text="Sort by Lastname" Value="1"></asp:ListItem>
                <asp:ListItem Text="Sort by Date of Birth" Value="2"></asp:ListItem>
            </asp:DropDownList>
            <br /><br />
            <asp:Repeater ID="rptAllPeople" runat="server">
                <HeaderTemplate>
                    <table class="table table-responsive table-striped">
                        <thead>
                            <th>
                                Firstname
                            </th>
                            <th>
                                Lastname
                            </th>
                            <th>
                                Date of Birth
                            </th>
                            <th>
                                Email Address
                            </th>
                        </thead>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <%#Eval("First Name") %>
                        </td>
                        <td>
                            <%#Eval("Last Name") %>
                        </td>
                        <td>
                            <%#Eval("Date of Birth") %>
                        </td>
                        <td>
                            <%#Eval("Email Address") %>
                        </td>
                        <td>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteEntry" CommandArgument='<%# Eval("EntryId") %>' OnCommand="btnDelete_Command" CssClass="btn btn-danger" />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
