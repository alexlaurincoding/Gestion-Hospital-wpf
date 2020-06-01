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
    /// Interaction logic for FenetrePrepose.xaml
    /// </summary>
    public partial class FenetrePrepose : Window
    {
        public FenetrePrepose()
        {
            InitializeComponent();
            cbAssurances.DataContext = Accueil.myBDD.COMPAGNIE_ASSURANCE.ToList();
            cbSelectionNam.DataContext = Accueil.myBDD.PATIENTs.ToList();
        }

        private void btnPatientEnreg_Click(object sender, RoutedEventArgs e)
        {
            PARENT newParent = new PARENT();
            PATIENT newPatient = new PATIENT();

            newParent.nom_PARENT = txtParentNom.Text;
            newParent.PRENOM_PARENT = txtParentPrenom.Text;
            newParent.ADRESSE_PARENT = txtParentAdresse.Text;
            newParent.VILLE_PARENT = txtParentVille.Text;
            newParent.PROVINCE_PARENT = cbParentProvince.Text;
            newParent.CODE_POSTAL_PARENT = txtParentCodeP.Text;
            newParent.TELEPHONE_PARENT = txtParentTel.Text;

            Accueil.myBDD.PARENTs.Add(newParent);

            try
            {
                Accueil.myBDD.SaveChanges();
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }

            newPatient.NAM = txtPatientNAM.Text;
            newPatient.NOM_PATIENT = txtPatientNom.Text;
            newPatient.PRENOM_PATIENT = txtPatientPrenom.Text;
            newPatient.ADRESSE_PATIENT = txtPatientAdresse.Text;
            newPatient.VILLE_PATIENT = txtPatientVille.Text;
            newPatient.PROVINCE_PATIENT = cbPatientProvince.Text;
            newPatient.CODE_POSTAL_PATIENT = txtPatientCodeP.Text;
            newPatient.TELEPHONE_PATIENT = txtPatientTel.Text;
            newPatient.REF_PARENT = newParent.ref_parent;
            newPatient.DATE_NAISSANCE_PATIENT = datePatient.SelectedDate.Value;
            if(checkboxSansAssurances.IsChecked == false)
            {
                newPatient.ID_ASSURANCE = (cbAssurances.SelectedItem as COMPAGNIE_ASSURANCE).ID_ASSURANCE;
            }
            else
            {
                newPatient.ID_ASSURANCE = null;

            }
            Accueil.myBDD.PATIENTs.Add(newPatient);
            
            try
            {
                Accueil.myBDD.SaveChanges();
                MessageBox.Show("Patient ajouté avec succès");
                cbSelectionNam.DataContext = null;
                cbSelectionNam.DataContext = Accueil.myBDD.PATIENTs.ToList();
                

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }
            finally
            {

            }
            
        }

        private void CheckBox_Checked(object sender, RoutedEventArgs e)
        {
            cbAssurances.SelectedIndex = -1;
            cbAssurances.IsEnabled = false;
        }

        private void cbSansAssurances_Unchecked(object sender, RoutedEventArgs e)
        {
            cbAssurances.SelectedIndex = 0;
            cbAssurances.IsEnabled = true;
        }

        private void afficherInfoClient(string nam)
        {
            PATIENT p = new PATIENT();
            PARENT par = new PARENT();
            COMPAGNIE_ASSURANCE ass = new COMPAGNIE_ASSURANCE();
            p = Accueil.myBDD.PATIENTs.Find(nam);
            par = Accueil.myBDD.PARENTs.Find(p.REF_PARENT);
            ass = Accueil.myBDD.COMPAGNIE_ASSURANCE.Find(p.ID_ASSURANCE);

            txtAdmissionNAM.Text = p.NAM;
            txtAdmissionNom.Text = p.NOM_PATIENT;
            txtAdmissionPrenom.Text = p.PRENOM_PATIENT;
            txtAdmissionAdresse.Text = p.ADRESSE_PATIENT;
            txtAdmissionVille.Text = p.VILLE_PATIENT;
            txtAdmissionProvince.Text = p.PROVINCE_PATIENT;
            txtAdmissionCodeP.Text = p.CODE_POSTAL_PATIENT;
            txtAdmissionTel.Text = p.TELEPHONE_PATIENT;
            txtAdmissionParent.Text = (par.PRENOM_PARENT.Trim() + " " + par.nom_PARENT);
            if(ass != null)
            {
              txtAdmissionAssur.Text = ass.NOM_COMPAGNIE;
            }
            else
            {
                txtAdmissionAssur.Text = "Sans Assurances";
            }
            
            dateNaissAdmission.SelectedDate = p.DATE_NAISSANCE_PATIENT;
            
        }


        private void btnSelectionNam_Click(object sender, RoutedEventArgs e)
        {
            string nam = cbSelectionNam.Text;
            Console.WriteLine(nam);
            afficherInfoClient(nam);
            txtAdmissionNAM.IsEnabled = false;
        }

        private void btnAdmisAnnuler_Click(object sender, RoutedEventArgs e)
        {
            txtAdmissionNAM.IsEnabled = false;
            txtAdmissionNAM.Text = null;
            txtAdmissionNom.Text = null;
            txtAdmissionPrenom.Text = null;
            txtAdmissionAdresse.Text = null;
            txtAdmissionVille.Text = null;
            txtAdmissionProvince.Text = null;
            txtAdmissionCodeP.Text = null;
            txtAdmissionTel.Text = null;
            txtAdmissionParent.Text = null;
            txtAdmissionAssur.Text = null;

        }

        private void btnAdmisConsulter_Click(object sender, RoutedEventArgs e)
        {
            ListePatient list = new ListePatient();
            
            list.ShowDialog();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            string nam = txtAdmissionNAM.Text;
            afficherInfoClient(nam);
        }

        private void btnAdmisInscrire_Click(object sender, RoutedEventArgs e)
        {
            string nam = txtAdmissionNAM.Text;
            if(nam != "")
            {
                Inscription insc = new Inscription(nam);
                insc.ShowDialog();
            }
            else
            {
                MessageBox.Show("Veuillez selectionner un patient.");
            }




        }

        private void btnPatientAnnuler_Click(object sender, RoutedEventArgs e)
        {
            txtParentNom.Text = null;
            txtParentPrenom.Text = null;
            txtParentAdresse.Text = null;
            txtParentVille.Text = null;
            cbParentProvince.SelectedIndex = -1;
            txtParentCodeP.Text = null;
            txtParentTel.Text = null;

            txtPatientNAM.Text = null;
            txtPatientNom.Text = null;
            txtPatientPrenom.Text = null;
            txtPatientAdresse.Text = null;
            txtPatientVille.Text = null;
            cbPatientProvince.SelectedIndex = -1;
            txtPatientCodeP.Text = null;
            txtPatientTel.Text = null;          
            datePatient.SelectedDate = DateTime.Today;
            checkboxSansAssurances.IsChecked = false;
        }

        private void btnPatientQuitter_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }


    }
}

