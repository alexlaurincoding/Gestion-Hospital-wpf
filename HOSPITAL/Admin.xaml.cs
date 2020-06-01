using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace HOSPITAL
{
    /// <summary>
    /// Interaction logic for Admin.xaml
    /// </summary>
    public partial class Admin : Window
    {
        public Admin()
        {
            InitializeComponent();
            loadComboBox();
        }

        private void btnAjouter_Click(object sender, RoutedEventArgs e)
        {
            MEDECIN newMedecin = new MEDECIN();
            
            newMedecin.NOM_MEDECIN = txtAjouNom.Text;
            newMedecin.PRENOM_MEDECIN = txtAjouPrenom.Text;
            newMedecin.SPECIALITE = cbAjouSpecial.Text;

            Accueil.myBDD.MEDECINs.Add(newMedecin);

            try
            {
                Accueil.myBDD.SaveChanges();
                MessageBox.Show("Ajout effectué avec succes!");
                txtAjouNom.Text = null;
                txtAjouPrenom.Text = null;
                cbAjouSpecial.SelectedIndex = -1;
                loadComboBox();

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }
        }

        private void btnModifier_Click(object sender, RoutedEventArgs e)
        {
            if (Accueil.myBDD.MEDECINs.Count() == 0)
            {
                MessageBox.Show("Aucun medecin a supprimer");
            }
            else
            {
                MEDECIN med = cbModifier.SelectedItem as MEDECIN;

                med.NOM_MEDECIN = txtModifNom.Text;
                med.PRENOM_MEDECIN = txtModifPrenom.Text;
                med.SPECIALITE = cbModifSpecial.Text;

                try
                {
                    Accueil.myBDD.SaveChanges();
                    MessageBox.Show("Modification effectué avec succes!");
                    loadComboBox();
                }
                catch (Exception ex)
                {

                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void btnSupprimer_Click(object sender, RoutedEventArgs e)
        {
            if (Accueil.myBDD.MEDECINs.Count() == 0)
            {
                MessageBox.Show("Aucun medecin a supprimer");
            }
            else
            {
                MEDECIN med = cbSupprimer.SelectedItem as MEDECIN;

                Accueil.myBDD.MEDECINs.Remove(med);
                MessageBoxResult result = MessageBox.Show("Voulez vous vraiment supprimer ce medecin?", "Supprimer medecin", MessageBoxButton.YesNo, MessageBoxImage.Question);

                if (result == MessageBoxResult.Yes)
                {
                    try
                    {
                        Accueil.myBDD.SaveChanges();
                        MessageBox.Show("Suppression effectué avec succes!");

                        if (Accueil.myBDD.MEDECINs.Count() == 0)
                        {
                            MessageBox.Show("Vous etes dans la merde, vous n'avez plus de medecins.");
                        }
                        loadComboBox();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }
            }
        }
        private void cbModifier_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (cbModifier.SelectedIndex >= 0)
            {
                MEDECIN med = cbModifier.SelectedItem as MEDECIN;

                txtModifNom.Text = med.NOM_MEDECIN.ToString();
                txtModifPrenom.Text = med.PRENOM_MEDECIN.ToString();
                cbModifSpecial.Text = (Convert.ToString(med.SPECIALITE)).Trim();
            }
        }

        private void cbSupprimer_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (cbSupprimer.SelectedIndex >= 0)
            {
                MEDECIN med = cbSupprimer.SelectedItem as MEDECIN;

                txtSuppNom.Text = med.NOM_MEDECIN.ToString();
                txtSuppPrenom.Text = med.PRENOM_MEDECIN.ToString();
                cbSuppSpecial.Text = (Convert.ToString(med.SPECIALITE)).Trim();
            }

        }

        private void loadComboBox()
        {
            if (Accueil.myBDD.MEDECINs.Count() == 0)
            {
                
                cbSupprimer.SelectedIndex = -1;
                txtSuppNom.Text = null;
                txtSuppPrenom.Text = null;
                cbSuppSpecial.SelectedIndex = -1;

                cbModifier.SelectedIndex = -1;
                cbModifSpecial.SelectedIndex = -1;
                txtModifNom.Text = null;
                txtModifPrenom.Text = null;
            }
            else
            {
                dgPersonnel.DataContext = null;
                cbModifier.DataContext = null;
                cbSupprimer.DataContext = null;
                affListe();
                cbModifier.DataContext = Accueil.myBDD.MEDECINs.ToList();
                cbSupprimer.DataContext = Accueil.myBDD.MEDECINs.ToList();
            }

        }

        private void btnAnnuler_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnConsulter_Click(object sender, RoutedEventArgs e)
        {
            affListe();
        }

        private void affListe()
        {
            var query =
    from c in Accueil.myBDD.MEDECINs
    select new { c.ID_MEDECIN, c.NOM_MEDECIN, c.PRENOM_MEDECIN, c.SPECIALITE };

            dgPersonnel.DataContext = query.ToList();
        }

        private void dgPersonnel_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            this.Close();
        }
    }
}
