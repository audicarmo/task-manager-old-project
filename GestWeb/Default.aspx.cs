using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;


namespace GestWeb
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            
        }

        protected void btnAdicionar_Click(object sender, EventArgs e)
        {      
            try         
            {
                DateTime.Parse(txtBoxPrazo.Text);
                SqlDataSource1.Insert();                
                lblmensagem.Text = "A tarefa foi cadastrada com sucesso!";
                txtBoxTarefa.Text = string.Empty;
                txtBoxPrazo.Text = string.Empty;
            }

            catch (Exception)
            {
                lblmensagem.Text = "Necessária inserção de data no formato dd/mm/aaaa";
            }
        }
                

        protected void btnAtualizar_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Update();
            lblmensagem.Text = "A tarefa foi atualizada com sucesso!";
            txtBoxTarefa.Text = string.Empty;
            txtBoxPrazo.Text = string.Empty;
        }

        protected void btnExcluir_Click(object sender, EventArgs e)
        {            
            SqlDataSource1.Delete();
            lblmensagem.Text = "A tarefa foi excluída com sucesso!";
            txtBoxTarefa.Text = string.Empty;
            txtBoxPrazo.Text = string.Empty;
            
        }
        
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            OleDbDataAdapter dtAdaptador = new OleDbDataAdapter("SELECT * FROM tbl_gestweb WHERE Código ="+GridView1.SelectedValue, SqlDataSource1.ConnectionString);
            DataTable dtTabela = new DataTable();
            dtAdaptador.Fill(dtTabela);
            txtBoxTarefa.Text = dtTabela.Rows[0]["Tarefa"].ToString();
            txtBoxPrazo.Text = dtTabela.Rows[0]["Prazo"].ToString();           
        }
        
    }
}