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
    /// Interaction logic for Accueil.xaml
    /// </summary>
    public partial class Accueil : Window
    {
        public static HOSPITALEntities1 myBDD;
        public Accueil()
        {
            InitializeComponent();
            myBDD = new HOSPITALEntities1();
        }

        private void btnLogin_Click(object sender, RoutedEventArgs e)
        {
            if ((txtLoginUser.Text).ToUpper() == "ADMIN"  && (loginPassword.Password).ToUpper() == "ADMIN")
            {
                Admin admin = new Admin();
                admin.ShowDialog();
            }else if ((txtLoginUser.Text).ToUpper() == "MEDECIN" && (loginPassword.Password).ToUpper() == "MEDECIN")
            {
                FenetreMedecin medecin = new FenetreMedecin();
                medecin.ShowDialog();
            }else if ((txtLoginUser.Text).ToUpper() == "PREPOSE" && (loginPassword.Password).ToUpper() == "PREPOSE")
            {
                FenetrePrepose prepose = new FenetrePrepose();
                prepose.ShowDialog();
            }
}
    }
}
