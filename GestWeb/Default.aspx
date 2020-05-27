<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GestWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">    
    <div class="jumbotron">
        <div class="row">            
                
                <p>
                    <asp:Label ID="lblTarefa" runat="server" Text="Tarefa: "></asp:Label>
                    <asp:TextBox ID="txtBoxTarefa" runat="server" Width="275px"></asp:TextBox>
                    <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                      ControlToValidate="txtBoxTarefa"
                      ErrorMessage="Digite o nome da tarefa a ser cadastrada"
                      ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </p>

                <p>
                    <asp:Label ID="lblPrazo" runat="server" Text="Data de Entrega: "></asp:Label>
                    <asp:TextBox ID="txtBoxPrazo" runat="server" Width="183px"></asp:TextBox>
                    <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                      ControlToValidate="txtBoxPrazo"
                      ErrorMessage="Informe o prazo de entrega. Ex: 16/11/2019"
                      ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </p>

                <p>
                    <asp:Button ID="btnAdicionar" runat="server" OnClick="btnAdicionar_Click" Text="Adicionar" Width="109px" />
                    <asp:Button ID="btnAtualizar" runat="server" OnClick="btnAtualizar_Click" Text="Atualizar" Width="103px" />
                    <asp:Button ID="btnExcluir" runat="server" OnClick="btnExcluir_Click" Text="Apagar" Width="98px" />
                </p>

                <p>
                    <asp:Label ID="lblmensagem" ForeColor ="Red" runat="server"></asp:Label>
                </p>

            </div>            
                
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|gestweb_db.mdb" DeleteCommand="DELETE FROM [tbl_gestweb] WHERE [Código] = ?" InsertCommand="INSERT INTO [tbl_gestweb] ([Tarefa], [Prazo]) VALUES (?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT * FROM [tbl_gestweb]" UpdateCommand="UPDATE [tbl_gestweb] SET [Tarefa] = ?, [Prazo] = ? WHERE [Código] = ?">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="Código" PropertyName="SelectedValue" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="txtBoxTarefa" Name="Tarefa" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtBoxPrazo" Name="Prazo" PropertyName="Text" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="txtBoxTarefa" Name="Tarefa" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtBoxPrazo" Name="Prazo" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="GridView1" Name="Código" PropertyName="SelectedValue" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Código" DataSourceID="SqlDataSource1" GridLines="None" Height="93px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="487px" ForeColor="#333333">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Código" HeaderText="Código" InsertVisible="False" ReadOnly="True" SortExpression="Código" />
                            <asp:BoundField DataField="Tarefa" HeaderText="Tarefa" SortExpression="Tarefa" />
                            <asp:BoundField DataField="PRazo" HeaderText="Prazo" SortExpression="Prazo" />
                            <asp:CommandField ShowSelectButton="True" HeaderText="Função" SelectText="Selecionar" />
                        </Columns>
                        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
    </div>  

</asp:Content>
