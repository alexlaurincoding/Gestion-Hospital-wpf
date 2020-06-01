//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HOSPITAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class PATIENT
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PATIENT()
        {
            this.DOSSIER_ADMISSION = new HashSet<DOSSIER_ADMISSION>();
        }
    
        public string NAM { get; set; }
        public System.DateTime DATE_NAISSANCE_PATIENT { get; set; }
        public string NOM_PATIENT { get; set; }
        public string PRENOM_PATIENT { get; set; }
        public string ADRESSE_PATIENT { get; set; }
        public string VILLE_PATIENT { get; set; }
        public string PROVINCE_PATIENT { get; set; }
        public string CODE_POSTAL_PATIENT { get; set; }
        public string TELEPHONE_PATIENT { get; set; }
        public Nullable<int> ID_ASSURANCE { get; set; }
        public Nullable<int> REF_PARENT { get; set; }
    
        public virtual COMPAGNIE_ASSURANCE COMPAGNIE_ASSURANCE { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DOSSIER_ADMISSION> DOSSIER_ADMISSION { get; set; }
        public virtual PARENT PARENT { get; set; }
    }
}
