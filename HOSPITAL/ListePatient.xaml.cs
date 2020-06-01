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
    /// Interaction logic for ListePatient.xaml
    /// </summary>
    public partial class ListePatient : Window
    {

        public ListePatient()
        {
            InitializeComponent();
            var query =
                from c in Accueil.myBDD.PATIENTs
                select new { c.NAM, c.NOM_PATIENT, c.PRENOM_PATIENT, c.ADRESSE_PATIENT, c.VILLE_PATIENT, c.PROVINCE_PATIENT,
                c.CODE_POSTAL_PATIENT, c.TELEPHONE_PATIENT, c.DATE_NAISSANCE_PATIENT, c.ID_ASSURANCE, c.REF_PARENT};

                dgPatients.DataContext = query.ToList();
        }

        private void btnAnnuler_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void dgPatients_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
