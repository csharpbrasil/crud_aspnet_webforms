using Model.Cliente;
using Exemplo.Model.Cliente;
using Exemplo.Model.ExemploDbContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Exemplo
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

       
        public IQueryable<ClienteModel> CarregarGrid()
        {
            var db = new ClienteCrud();
            return db.CarregarDados();
        }

        public void FormCadastro_InsertItem()
        {
            var db = new ClienteCrud();
            var item = new ClienteModel();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                db.InsertOrUpdate(item);
                gridDados.DataBind();
            }
        }

        protected void gridDados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var cliente = new ClienteCrud();
            var objeCliente = new ClienteModel();
            var id = Convert.ToInt32(e.CommandArgument);
            hdn.Value = id.ToString();
            
            switch (e.CommandName)
            {
                case "Excluir":
                    cliente.Delete(id);
                    gridDados.DataBind();
                    break;

                case "Editar":

                    CarregarModal(id);
                    ModalUpdate.Show();
                    break;

                default:
                    break;
            }
        }

        public void CarregarModal(int id)
        {
            var user = new ClienteCrud();

           var objUser = user.PesquisarPorId(id);

           txtNomeModal.Text = objUser.Nome;
           txtEmailModal.Text = objUser.Email;
           txtDataNascModal.Text = objUser.DataNascimento.ToString();

        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            var cliente = new ClienteCrud();
            var objCliente = new ClienteModel();

            objCliente.Id = Convert.ToInt32(hdn.Value);
            objCliente.Nome = txtNomeModal.Text;
            objCliente.Email = txtEmailModal.Text;
            objCliente.DataNascimento = Convert.ToDateTime(txtDataNascModal.Text);

            cliente.InsertOrUpdate(objCliente);

            gridDados.DataBind();

        }

       
    }
}