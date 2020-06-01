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
    /// Interaction logic for FenetreMedecin.xaml
    /// </summary>
    public partial class FenetreMedecin : Window
    {
        public FenetreMedecin()
        {
            InitializeComponent();
            cbIdentifierMedecin.DataContext = Accueil.myBDD.MEDECINs.ToList();
        }

        private void cbIdentifierMedecin_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            loadDatagrid();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            DOSSIER_ADMISSION patientGueri = (DOSSIER_ADMISSION)dgListePatient.SelectedItem;

            
            MessageBoxResult result = MessageBox.Show("Voulez vous donner conger a " + patientGueri.PATIENT.PRENOM_PATIENT.Trim() + " " + patientGueri.PATIENT.NOM_PATIENT.Trim() + "?", "Donner Congé", MessageBoxButton.YesNo, MessageBoxImage.Question);

            if (result == MessageBoxResult.Yes)
            {
               
                try
                {
                    patientGueri.LIT.LIT_OCCUPE = false;
                    patientGueri.DATE_CONGE = DateTime.Now;
                    Accueil.myBDD.SaveChanges();
                    loadDatagrid();
                    MessageBox.Show("Le patient a eue son congé.", "Donner Congé", MessageBoxButton.OK, MessageBoxImage.Information);

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
                
            }
            
        }

        public void loadDatagrid()
        {
            MEDECIN med = cbIdentifierMedecin.SelectedItem as MEDECIN;
            IEnumerable<DOSSIER_ADMISSION> patient;
            List<DOSSIER_ADMISSION> listePatient = new List<DOSSIER_ADMISSION>();

            patient = from DOSSIER in Accueil.myBDD.DOSSIER_ADMISSION
                      where DOSSIER.ID_MEDECIN == med.ID_MEDECIN && DOSSIER.LIT.LIT_OCCUPE != false
                      select DOSSIER;
            foreach (DOSSIER_ADMISSION item in patient)
            {
                if (item.DATE_CONGE == null)
                {
                    listePatient.Add(item);
                }               
            }
            dgListePatient.ItemsSource = null;
            dgListePatient.ItemsSource = listePatient.ToList();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
