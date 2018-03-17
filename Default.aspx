<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Exemplo._Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <style type="text/css">
        .modalPopup {
            background: #FFFFFF;
        }
    </style>
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>

                <h2>Modify this template to jump-start your ASP.NET application.</h2>
            </hgroup>

        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:HiddenField runat="server" ID="hdn" />

    <h3>Cadastro de Clientes</h3>




    <asp:FormView runat="server" ID="FormCadastro" DefaultMode="Insert" ItemType="Model.Cliente.ClienteModel" InsertMethod="FormCadastro_InsertItem"
        CellPadding="4" ForeColor="#333333" DataKeyNames="Id">
        <InsertItemTemplate>
            Nome:<br />
            <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# BindItem.Nome %>' />
            <br />
            Email:<br />
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# BindItem.Email %>' />
            <br />
            Data de Nascimento:<br />
            <asp:TextBox ID="DataNascimentoTextBox" runat="server" Text='<%# BindItem.DataNascimento %>' />
            <br />

            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Salvar" />

            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />

            <asp:ValidationSummary runat="server" ID="validation" DisplayMode="BulletList" ShowSummary="true" ForeColor="Red" />

        </InsertItemTemplate>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />

    </asp:FormView>

    <br />


    <asp:GridView ID="gridDados" runat="server" ItemType="Model.Cliente.ClienteModel" SelectMethod="CarregarGrid" DataKeyNames="Id" OnRowCommand="gridDados_RowCommand">
        <Columns>
            <asp:TemplateField ShowHeader="false">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Excluir" OnClientClick="return confirm('Deseja excluir ?')" CommandArgument='<%#: Item.Id %>' Text="Excluir"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="false">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Editar" CommandArgument='<%#: Item.Id %>' Text="Editar"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>




    <div style="display: none;">
        <asp:HyperLink ID="linkModal" runat="server">HyperLink</asp:HyperLink>
    </div>
    <asp:ModalPopupExtender ID="ModalUpdate" runat="server" TargetControlID="linkModal" PopupControlID="PainelModal">
    </asp:ModalPopupExtender>

    <asp:Panel ID="PainelModal" runat="server" Style="display: none" Width="450px" CssClass="modalPopup">
        <asp:Panel ID="PainelCabecalho" runat="server" Style="border-bottom: solid 1px Gray; height: 25px;">
            <div>
                <h1 style="line-height: 25px; text-align: center; font-size: 14px; font-family: Verdana; background-color: #7AC0DA;">
                    <asp:Label ID="txtTitulo" Text="Atualizar Dados" runat="server"></asp:Label>
                </h1>
            </div>
        </asp:Panel>
        <div>
            <br />
            <br />
            <table width="100%" style="margin-left: 15px;">
                <tr>
                    <td>Nome:</td>
                    <td>
                        <asp:TextBox ID="txtNomeModal" runat="server" /></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <asp:TextBox ID="txtEmailModal" runat="server" /></td>
                </tr>
                <tr>
                    <td>Data de Nascimento:</td>
                    <td>
                        <asp:TextBox ID="txtDataNascModal" runat="server" /></td>
                </tr>
            </table>

            <div style="text-align:center;">
                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" OnClick="btnSalvar_Click"/>
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" />
            </div>

        </div>
    </asp:Panel>


</asp:Content>
