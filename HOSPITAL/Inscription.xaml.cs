using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    /// Interaction logic for Inscription.xaml
    /// </summary>
    public partial class Inscription : Window
    {
        PATIENT patient = new PATIENT();
        
        DEPARTEMENT departement = new DEPARTEMENT();
        DOSSIER_ADMISSION admission = new DOSSIER_ADMISSION();
        LIT lit = new LIT();
        string typeLit;
        int age;
        int litChirStandard;
        int litChirSemi;
        int litChirPrive;
        int litPediStandard;
        int litPediSemi;
        int litPediPrive;
        int litMourrStandard;
        int litMourrSemi;
        int litMourrPrive;

        double prixLit;
        double prixTV;
        double prixTelephone;
        double prixTotal;
        ObservableCollection<MEDECIN> medecins = new ObservableCollection<MEDECIN>();


       
        public Inscription(string nam)
        {
                InitializeComponent();

                patient = Accueil.myBDD.PATIENTs.Find(nam);
                dateChirurgie.DisplayDateStart = DateTime.Now;
                dateChirurgie.SelectedDate = DateTime.Now;
                txtInscrNom.Text = patient.NOM_PATIENT;
                //trouver l'age
                TimeSpan ts = DateTime.Now - Convert.ToDateTime(patient.DATE_NAISSANCE_PATIENT);
                age = Convert.ToInt32(ts.Days) / 365;
                txtAge.Text = age.ToString();

                if (patient.ID_ASSURANCE != null)
                {
                    checkAssurer.IsChecked = true;
                }
                cbDepartement.DataContext = Accueil.myBDD.DEPARTEMENTs.ToList();
                cbLitDemander.DataContext = Accueil.myBDD.TYPE_LIT.ToList();

                if (checkChirurgie.IsChecked == false && age <= 16)
                {
                    cbDepartement.SelectedIndex = 1;
                }
                else
                {
                    cbDepartement.SelectedIndex = 2;
                
                }

                nombreDeLit();
                updateComboBoxLit();
                loadCbMedecin();
        }



        public void updateComboBoxLit()
        {
            if(departement.ID_DEPARTEMENT == 101)
            {
                if (litChirStandard == 0)
                {
                    cbLitDemander.Items.RemoveAt(0);
                }
                if (litChirSemi == 0)
                {
                    cbLitDemander.Items.RemoveAt(1);
                }
                if(litChirPrive == 0)
                {
                    cbLitDemander.Items.RemoveAt(2);
                }             
            }else if (departement.ID_DEPARTEMENT == 102)
            {
                if (litPediStandard == 0)
                {
                    cbLitDemander.Items.RemoveAt(0);
                }
                if (litPediSemi == 0)
                {
                    cbLitDemander.Items.RemoveAt(1);
                }
                if (litPediPrive == 0)
                {
                    cbLitDemander.Items.RemoveAt(2);
                }
            }
            else if (departement.ID_DEPARTEMENT == 103)
            {
                if (litMourrStandard == 0)
                {
                    cbLitDemander.Items.RemoveAt(0);
                }
                if (litMourrSemi == 0)
                {
                    cbLitDemander.Items.RemoveAt(1);
                }
                if (litMourrPrive == 0)
                {
                    cbLitDemander.Items.RemoveAt(2);
                }
            }
        }

        private void btnInscEnregistrer_Click(object sender, RoutedEventArgs e)
        {
            bool litAssigne = false;
            IEnumerable<DOSSIER_ADMISSION> patientPresent;
            List<DOSSIER_ADMISSION> dossierPatient = new List<DOSSIER_ADMISSION>();

            patientPresent = from DOSSIER in Accueil.myBDD.DOSSIER_ADMISSION
                             where DOSSIER.NAM == patient.NAM
                             && DOSSIER.ID_MEDECIN != null
                             && DOSSIER.LIT.LIT_OCCUPE != false
                             select DOSSIER;
            foreach (DOSSIER_ADMISSION item in patientPresent)
            {
                dossierPatient.Add(item);
            }
                                
            if (dossierPatient.Count() > 0)
            {
                DOSSIER_ADMISSION dossier = dossierPatient.First();
               MEDECIN med = Accueil.myBDD.MEDECINs.Find(dossier.ID_MEDECIN);
                MessageBox.Show("Le patient est deja prix en charge par le docteur " + med.NOM_MEDECIN, "Attention", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            else
            {
                foreach (LIT l in Accueil.myBDD.LITs)
                {
                    if (litAssigne == false)
                    {
                        if (l.LIT_OCCUPE == false && l.NUMERO_TYPE == ((TYPE_LIT)cbLitDemander.SelectedItem).NUMERO_TYPE && l.ID_DEPARTEMENT == departement.ID_DEPARTEMENT)
                        {
                            lit = l;
                            lit.LIT_OCCUPE = true;
                            litAssigne = true;
                        }
                    }
                }

                if (litAssigne == false)
                {
                    foreach (LIT l in Accueil.myBDD.LITs)
                    {
                        if (litAssigne == false)
                        {
                            if (l.LIT_OCCUPE == false && l.NUMERO_TYPE == ((TYPE_LIT)cbLitDemander.SelectedItem).NUMERO_TYPE + 1 && l.ID_DEPARTEMENT == departement.ID_DEPARTEMENT)
                            {
                                lit = l;
                                lit.LIT_OCCUPE = true;
                                litAssigne = true;
                            }
                        }
                    }
                }

                if (litAssigne == false)
                {
                    foreach (LIT l in Accueil.myBDD.LITs)
                    {
                        if (litAssigne == false)
                        {
                            if (l.LIT_OCCUPE == false && l.NUMERO_TYPE == ((TYPE_LIT)cbLitDemander.SelectedItem).NUMERO_TYPE + 2 && l.ID_DEPARTEMENT == departement.ID_DEPARTEMENT)
                            {
                                lit = l;
                                lit.LIT_OCCUPE = true;
                                litAssigne = true;
                            }
                        }
                    }
                }

                if (litAssigne == true)
                {

                    if (checkChirurgie.IsChecked == true)
                    {
                        admission.CHIRURGIE_PROGRAMME = true;
                        admission.DATE_CHIRURGIE = dateChirurgie.SelectedDate;
                    }
                    else
                    {
                        admission.CHIRURGIE_PROGRAMME = false;
                        admission.DATE_CHIRURGIE = null;
                    }
                    admission.DATE_ADMISSION = DateTime.Today;
                    admission.DATE_CONGE = null;
                    admission.NAM = patient.NAM;
                    admission.NUMERO_LIT = lit.NUMERO_LIT;
                    MEDECIN med = cbSelectMedecin.SelectedItem as MEDECIN;
                    admission.ID_MEDECIN = med.ID_MEDECIN;


                    MessageBoxResult result = MessageBox.Show("Voulez vous cree cette demande d'admission?", "Demande d'admission", MessageBoxButton.YesNo, MessageBoxImage.Question);
                    facturation();
                    if (result == MessageBoxResult.Yes)
                    {
                        Accueil.myBDD.DOSSIER_ADMISSION.Add(admission);
                        try
                        {
                            Accueil.myBDD.SaveChanges();
                            MessageBox.Show("Admission ajouter avec succes\n " +
                                "Tarif Journalier : \n" +
                                "Prix du lit : " + prixLit + "$\n" +
                                "Location Televiseur : " + prixTV + "$\n" +
                                "Location Telephone : " + prixTelephone + "$\n" +
                                "Total : " + prixTotal + "$");
                            nombreDeLit();
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(ex.Message);
                        }

                    }
                }
                else
                {
                    MessageBox.Show("Il n'y a plus de lit disponible dans le departement " + departement.NOM_DEPARTEMENT, "Attention", MessageBoxButton.OK, MessageBoxImage.Warning);
                }

            }

        }

        private void checkChirurgie_Unchecked(object sender, RoutedEventArgs e)
        {
            dateChirurgie.IsEnabled = false;
            loadCbMedecin();
        }

        private void checkChirurgie_Checked(object sender, RoutedEventArgs e)
        {
            dateChirurgie.IsEnabled = true;
            medecins.Clear();
            cbDepartement.SelectedIndex = 0;
            foreach (MEDECIN medecin in Accueil.myBDD.MEDECINs.ToList())
            {
                if(Convert.ToString(medecin.SPECIALITE).Trim() == "Chirurgie")
                medecins.Add(medecin);
                
            }

            cbSelectMedecin.ItemsSource = medecins;
            cbSelectMedecin.SelectedIndex = 0;

        }

        private void cbLitDemander_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            typeLit = cbLitDemander.Text;
        }



        private void nombreDeLit()
        {
            litChirStandard = 0;
            litChirSemi = 0;
            litChirPrive = 0;
            litPediStandard = 0;
            litPediSemi = 0;
            litPediPrive = 0;
            litMourrStandard = 0;
            litMourrSemi = 0;
            litMourrPrive = 0;

            foreach (LIT lits in Accueil.myBDD.LITs)
            {
                if(lits.LIT_OCCUPE == false)
                {
                    if (lits.ID_DEPARTEMENT == 101)
                    {
                        if(lits.NUMERO_TYPE == 1)
                        {
                            litChirStandard++;
                        }else if (lits.NUMERO_TYPE == 2)
                        {
                            litChirSemi++;
                        }else if (lits.NUMERO_TYPE == 3)
                        {
                            litChirPrive++;
                        }
                    }
                    else if(lits.ID_DEPARTEMENT == 102)
                    {
                        if (lits.NUMERO_TYPE == 1)
                        {
                            litPediStandard++;
                        }
                        else if (lits.NUMERO_TYPE == 2)
                        {
                            litPediSemi++;
                        }
                        else if (lits.NUMERO_TYPE == 3)
                        {
                            litPediPrive++;
                        }
                    }
                    else if(lits.ID_DEPARTEMENT == 103)
                    {
                        if (lits.NUMERO_TYPE == 1)
                        {
                            litMourrStandard++;
                        }
                        else if (lits.NUMERO_TYPE == 2)
                        {
                            litMourrSemi++;
                        }
                        else if (lits.NUMERO_TYPE == 3)
                        {
                            litMourrPrive++;
                        }
                    }

                }
               
                
            }

            lblLitChirStandard.Content = litChirStandard;
            lblLitChirSemiPrive.Content = litChirSemi;
            lblLitChirPrive.Content = litChirPrive;

            lblLitPediStandard.Content = litPediStandard;
            lblLitPediSemiPrive.Content = litPediSemi;
            lblLitPediPrive.Content = litPediPrive;

            lblLitMourrirSandard.Content = litMourrStandard;
            lblLitMourrirSemiPrive.Content = litMourrSemi;
            lblLitMourrirPrive.Content = litMourrPrive;
                               
        }

        public void facturation()
        {
            
            if(patient.ID_ASSURANCE == null || lit.NUMERO_TYPE != 1)
            {
                if (departement.ID_DEPARTEMENT == 101)
                {
                    if(litChirStandard > 0)
                    {
                        if(lit.NUMERO_TYPE == 2)
                        {
                            prixLit = 267;
                        }else if (lit.NUMERO_TYPE == 3)
                        {
                            prixLit = 571;
                        }                      
                    }else if(litChirStandard == 0 && litChirSemi > 0)
                    {
                        if(lit.NUMERO_TYPE == 3)
                        {
                            prixLit = 571;
                        }
                    }
                }else if (departement.ID_DEPARTEMENT == 102)
                {
                    if (litPediStandard > 0)
                    {
                        if (lit.NUMERO_TYPE == 2)
                        {
                            prixLit = 267;
                        }
                        else if (lit.NUMERO_TYPE == 3)
                        {
                            prixLit = 571;
                        }
                    }
                    else if (litPediStandard == 0 && litPediSemi > 0)
                    {
                        if (lit.NUMERO_TYPE == 3)
                        {
                            prixLit = 571;
                        }
                    }
                    
                }else if (departement.ID_DEPARTEMENT == 103)
                {
                    if (litMourrStandard > 0)
                    {
                        if (lit.NUMERO_TYPE == 2)
                        {
                            prixLit = 267;
                        }
                        else if (lit.NUMERO_TYPE == 3)
                        {
                            prixLit = 571;
                        }

                    }
                    else if (litMourrStandard == 0 && litMourrSemi > 0)
                    {
                        if (lit.NUMERO_TYPE == 3)
                        {
                            prixLit = 571;
                        }
                    }
                }
            }else 
            {
                prixLit = 0;
            }

            if(patient.ID_ASSURANCE == null)
            {
                if(checkTV.IsChecked == true)
                {
                    prixTV = 42.5;
                }
                if(checkTelephone.IsChecked == true)
                {
                    prixTelephone = 7.5;
                }
            }

            prixTotal = prixLit + prixTV + prixTelephone;
        }

        private void cbDepartement_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            departement = cbDepartement.SelectedItem as DEPARTEMENT;
        }

        private void loadCbMedecin()
        {
            if (age <= 16)
            {
                cbDepartement.SelectedIndex = 1;
                medecins.Clear();
                foreach (MEDECIN medecin in Accueil.myBDD.MEDECINs.ToList())
                {
                    if (Convert.ToString(medecin.SPECIALITE).Trim() == "Pédiatrie")
                        medecins.Add(medecin);
                }
            }
            else
            {
                cbDepartement.SelectedIndex = 2;
                medecins.Clear();
                foreach (MEDECIN medecin in Accueil.myBDD.MEDECINs.ToList())
                {
                    if (Convert.ToString(medecin.SPECIALITE).Trim() == "Aide a Mourrir")
                        medecins.Add(medecin);
                }
            }
            departement = cbDepartement.SelectedItem as DEPARTEMENT;
            cbSelectMedecin.ItemsSource = medecins;
            cbSelectMedecin.SelectedIndex = 0;
        }

        private void btnInscAnnuler_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }


}
