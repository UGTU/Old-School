using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Schedule.DataTransferObjects;
using Abiturient.DataTransferObjects;

namespace Abiturient
{
    /// <summary>
    /// Summary description for AbitService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class AbitService : System.Web.Services.WebService
    {
        private string conn = "Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True";

        # region CollectionMethods

        [WebMethod(Description = "Получает коллекцию факультетов университета", CacheDuration=86400)]
        public FacInfo[] GetUGTUFaculties()
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                FacInfo[] fiArray = ctx.Facs.Select(x =>
                        new FacInfo() {ID = x.Ik_fac, Name = x.Cname_fac, ShortName = x.Cshort_name_fac }).OrderBy(k => k.Name).ToArray();

                return fiArray;
            }
        }

        [WebMethod(Description = "Получает коллекцию специальностей университета", CacheDuration = 86400)]
        public SpecInfo[] GetUGTUSpecialties()
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                SpecInfo[] siArray = ctx.Relation_spec_facs.Select(x =>
                        new SpecInfo() { ID = x.ik_spec_fac, Name = x.Spec_stud.Cname_spec + " (" + x.Fac.Cshort_name_fac + ")" + "(" + x.Spec_stud.Direction.cName_direction + ")" }).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию специальностей факультета", CacheDuration = 86400)]
        public SpecInfo[] GetFacultySpecialties(int facID)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                SpecInfo[] siArray = ctx.Relation_spec_facs.Where(p => (p.ik_fac == facID)).Select(x =>
                        new SpecInfo() { ID = x.ik_spec_fac, Name = x.Spec_stud.Cname_spec + " (" + x.Spec_stud.Direction.cName_direction + ")" }).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию наборов факультета для текущего года", CacheDuration = 86400)]
        public RecruitInfo[] GetFacultyRecruitments(int facID)
        {
            int CurYear = DateTime.Today.Year;

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                RecruitInfo[] siArray = ctx.ABIT_Diapazon_spec_facs.Where(p=> p.NNyear==CurYear).Where(p => (p.Relation_spec_fac.ik_fac == facID)).Select(x =>
                        new RecruitInfo() { ID = x.NNrecord, Name = x.Relation_spec_fac.Spec_stud.Cname_spec + " (" + x.Relation_spec_fac.Spec_stud.Direction.cName_direction + ")" }).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию гражданств", CacheDuration = 86400)]
        public CitizenshipInfo[] GetCitizenships()
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                CitizenshipInfo[] siArray = ctx.grazds.Select(x => new CitizenshipInfo() { ID = x.ik_grazd, Name = x.c_grazd}).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию стран", CacheDuration = 86400)]
        public CountryInfo[] GetCountries()
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                CountryInfo[] siArray = ctx.Stranas.Select(x => new CountryInfo() { ID = x.Ik_strana, Name = x.Cstrana }).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию регионов страны", CacheDuration = 86400)]
        public RegionInfo[] GetRegions(int ikStrana)
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                RegionInfo[] siArray = ctx.Regions.Where(p => p.Ik_strana == ikStrana).Select(x => new RegionInfo() { ID = x.Ik_region, Name = x.Cregion }).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию районов региона", CacheDuration = 86400)]
        public CountyInfo[] GetCounties(int ikRegion)
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                CountyInfo[] siArray = ctx.Raions.Where(p => p.Ik_region == ikRegion).Select(x => new CountyInfo() { ID = x.Ik_raion, Name = x.Craion}).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию городов района", CacheDuration = 43200)]
        public TownInfo[] GetTowns(int ikCounty)
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                TownInfo[] siArray = ctx.Gorods.Where(p => p.Ik_raion == ikCounty).Select(x => new TownInfo() { ID = x.Ik_gorod, Name = x.Cgorod}).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию улиц города", CacheDuration = 43200)]
        public StreetInfo[] GetStreets(int ikTown)
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                StreetInfo[] siArray = ctx.Streets.Where(p => p.ik_gorod == ikTown).Select(x => new StreetInfo() { ID = x.Ik_street, Name = x.CStreet}).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию учебных заведений города", CacheDuration = 43200)]
        public SchoolInfo[] GetSchools(int ikTown)
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                SchoolInfo[] siArray = ctx.Zaved_studs.Where(p => p.Ik_gorod == ikTown).Select(x => new SchoolInfo() { ID = x.ik_zaved, Name = x.cName_zaved }).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию видов специального учета")]
        public SCountInfo[] GetSpecCounts()
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                SCountInfo[] siArray = ctx.Special_uchets.Select(x => new SCountInfo() { ID = x.Ik_special_uchet, Name = x.Cspecial_uchet}).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию иностранных языков")]
        public LangInfo[] GetLanguages()
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                LangInfo[] siArray = ctx.Langs.Select(x => new LangInfo() { ID = x.Ik_lang, Name = x.Cname_lang }).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию степеней владения")]
        public MastInfo[] GetMasteries()
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                MastInfo[] siArray = ctx.Step_vlads.Select(x => new MastInfo() { ID = x.Ik_step_vlad, Name = x.Cname_step_vlad }).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию видов довузовской подготовки")]
        public PrepInfo[] GetPreps()
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                PrepInfo[] siArray = ctx.Abit_podgs.Select(x => new PrepInfo() { ID = x.Ik_podg, Name = x.Cname_podg }).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию видов медалей")]
        public MedalInfo[] GetMedalTypes()
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                MedalInfo[] siArray = ctx.medal_abits.Select(x => new MedalInfo() { ID = x.ik_medal, Name = x.cmedal}).OrderBy(k => k.ID).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию предприятий")]
        public OrgInfo[] GetOrganizations()
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                OrgInfo[] siArray = ctx.Predprs.Select(x => new OrgInfo() { ID = x.Ik_pred, Name = x.Cname_pred}).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию военных званий")]
        public MilInfo[] GetMilStates()
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                MilInfo[] siArray = ctx.Voen_zvanies.Select(x => new MilInfo() { ID = x.Ik_voen_zvanie, Name = x.Cvoen_zvanie }).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию видов документов")]
        public DocTypeInfo[] GetDocTypes()
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                DocTypeInfo[] siArray = ctx.documents.Select(x => new DocTypeInfo() { ID = x.ik_vid_doc, Name = x.cvid_doc}).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию видов документов об образовании")]
        public DocTypeInfo[] GetEducationalDocTypes()
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                DocTypeInfo[] siArray = ctx.documents.Where(p=> p.IsEducational).Select(x => new DocTypeInfo() { ID = x.ik_vid_doc, Name = x.cvid_doc }).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию видов документов, устанавливающих личность")]
        public DocTypeInfo[] GetIdentityDocTypes()
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                DocTypeInfo[] siArray = ctx.documents.Where(p => p.IsIdentity).Select(x => new DocTypeInfo() { ID = x.ik_vid_doc, Name = x.cvid_doc }).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию категорий поступления")]
        public EntTypeInfo[] GetEntranceTypes()
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                EntTypeInfo[] siArray = ctx.Kat_zaches.Select(x => new EntTypeInfo() { ID = x.Ik_kat_zach, Name = x.Cname_kat_zach }).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию семейных положений")]
        public FamStateInfo[] GetFamStates()
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                FamStateInfo[] siArray = ctx.sem_pols.Select(x => new FamStateInfo() { ID = x.ik_sem_pol, Name = x.csem_pol }).OrderBy(k => k.Name).ToArray();
                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию видов сдачи вступительного экзамена")]
        public ExamTypeInfo[] GetExamTypes()
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                ExamTypeInfo[] siArray = ctx.ABIT_VidSdachis.Select(x => new ExamTypeInfo() { ID = x.ik_sdach, Name = x.cname_sdach}).OrderBy(k => k.Name).ToArray();
                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию дисциплин для вступительного экзамена")]
        public ExamDiscInfo[] GetExamDisciplines()
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                ExamDiscInfo[] siArray = ctx.ABIT_Discs.Select(x => new ExamDiscInfo() { ID = x.ik_disc, Name = x.сname_disc }).OrderBy(k => k.Name).ToArray();
                return siArray;
            }

        }

        #endregion

        # region PersonalDataMethods

        [WebMethod(Description = "Проверяет, есть ли в базе личные данные студента с заданным номером зачетной книжки и номером паспорта")]
        public bool IsValid(string NBook, string NPass)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                try
                {
                    int ncode = (int)ctx.Zaches.Where(p => (p.Nn_zach == NBook)).Select(x => x.Student.nCode).Single();

                    DocInfo pass = GetIDDocumentData(ncode);

                    if (pass.Number == NPass) return true;
                }

                catch
                {   
                    return false;
                }
                return false;
            }
        }

        [WebMethod(Description = "Возвращает информацию о студенте с заданным номером зачетной книжки и номером паспорта")]
        public StudInfo GetStudInfo(string NBook, string NPass)
        {
            StudInfo res = null;

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                try
                {
                    int ncode = (int)ctx.Zaches.Where(p => (p.Nn_zach == NBook)).Select(x => x.Student.nCode).Single();

                    DocInfo pass = GetIDDocumentData(ncode);

                    if (pass.Number == NPass)
                    {
                        res = ctx.Students.Where(p => (p.nCode == ncode)).Select(x => new StudInfo() { ID = (int)x.nCode, FullName = x.Person.Clastname + " " + x.Person.Cfirstname + " " + x.Person.Cotch }).First();
                    }
                }
                catch
                {
                    return res;
                }
                return res;
            }
        }

        [WebMethod(Description = "Возвращает информацию о текущей группе студента по идентификатору")]
        public GroupInfo GetStudGroupInfo(int StudID)
        {
            GroupInfo res = null;

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                try
                {
                    int BookID = (int)ctx.Zaches.Where(p => (p.nCode == StudID)).Select(x => x.Ik_zach).First();

                    int GroupID = (int)ctx.StudGrups.Where(p => (p.Ik_prikazOtch == null) && (p.Ik_prikazZach != null) && (p.Ik_zach == BookID)).Select(x => x.Ik_grup).First();

                    res = ctx.Grups.Where(x => x.Ik_grup == GroupID).Select(p => new GroupInfo() { ID = p.Ik_grup, Name = p.Cname_grup, DateOfEnter = (DateTime)p.DateCreate, IDSpec = p.Relation_spec_fac.ik_spec_fac, IDFac = p.Relation_spec_fac.ik_fac }).Single();
                }
                catch
                {
                    return res;
                }
                return res;
            }
        }

        [WebMethod(Description = "Добавляет в сиcтему набор личных данных и возвращает личный номер абитуриента")]
        public int? AddAbitPersonalData(string LastName, string FirstName, string MiddleName, DateTime Birth, string BirthPlace, bool? IsPhysChallenged, bool? HasKids,
            bool? HasJob, bool? IsMale, bool? NeedsRoom, int? MedalKey, int? MilStateKey, string CellPhone, string Phone, string eMail, int? CitizenshipKey, int? PrepKey, 
            int? CommunityJobKey, int? FamStateKey, int? SpecCountKey, int? SchoolKey, int? GraduateYear,  string AdditionalInfo, int? ServiceRecYears, int? ServiceRecMonths, string Duty, int? OrganizationKey, string Benefits)
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
            int? code = (int?)ctx.AppendAbit(1, LastName, FirstName, MiddleName, Birth, BirthPlace, IsPhysChallenged, HasKids,
            HasJob, IsMale, NeedsRoom, MedalKey, MilStateKey, CellPhone, Phone, eMail, null, null, CitizenshipKey, PrepKey, null,
            CommunityJobKey, FamStateKey, SpecCountKey, SchoolKey, GraduateYear, "", 0, "",
            null, "", "", 0, "", null, "", AdditionalInfo, null, ServiceRecYears, ServiceRecMonths, Duty, OrganizationKey, Benefits).ReturnValue;

            ApplicationException e = new ApplicationException("Неверные данные! Абитуриент не добавлен.");

            if (code == null)
                throw e;
            
            if (code == 0)
            {
                throw e;
            }   

                return code;
            }
            
        }



        [WebMethod(Description = "Редактирует набор личных данных абитуриента по личному номеру")]
        public void EditAbitPersonalData(int ncode, string LastName, string FirstName, string MiddleName, DateTime Birth, string BirthPlace, bool? IsPhysChallenged, bool? HasKids,
            bool? HasJob, bool? IsMale, bool? NeedsRoom, int? MedalKey, int? MilStateKey, string CellPhone, string Phone, string eMail, int? CitizenshipKey, int? PrepKey,
            int? CommunityJobKey, int? FamStateKey, int? SpecCountKey, int? SchoolKey, int? GraduateYear, 
            string AdditionalInfo, int? ServiceRecYears, int? ServiceRecMonths, string Duty, int? OrganizationKey, string Benefits)
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                ctx.AppendAbit(0, LastName, FirstName, MiddleName, Birth, BirthPlace, IsPhysChallenged, HasKids,
                HasJob, IsMale, NeedsRoom, MedalKey, MilStateKey, CellPhone, Phone, eMail, null, null, CitizenshipKey, PrepKey, null,
                CommunityJobKey, FamStateKey, SpecCountKey, SchoolKey, GraduateYear, "", 0, "",
                null, "", "", 0, "", null, "", AdditionalInfo, ncode, ServiceRecYears, ServiceRecMonths, Duty, OrganizationKey, Benefits);

                return;
            }

        }

        [WebMethod(Description = "Добавляет в сиcтему документ, связанный с указанным абитуриентом")]
        public void AddAbitDoc(int ncode, int DocTypeID, string Serie, string Number, string GivenBy, DateTime Given)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                ctx.AppendDoc(ncode, DocTypeID, Serie,Number, Given, GivenBy);
                return;
            }
        }

        [WebMethod(Description = "Редактирует документ, связанный с указанным абитуриентом")]
        public void EditAbitDoc(int id_doc, int DocTypeID, string Serie, string Number, string GivenBy, DateTime Given)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                ctx.EditDoc(id_doc, DocTypeID, Given, GivenBy, Number, Serie);
                return;
            }
        }

        [WebMethod(Description = "Добавляет в сиcтему иноcтранный язык, связанный с указанным абитуриентом")]
        public void AddAbitLang(int ncode, int LangID, int? MasteryID)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                ctx.AppendLang(MasteryID, ncode , 1, LangID, null);
                return;
            }
        }

        [WebMethod(Description = "Редактирует иноcтранный язык, связанный с указанным абитуриентом")]
        public void EditAbitLang(int ncode, int LangID, int? MasteryID)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                ctx.AppendLang(MasteryID, ncode, 0, LangID, LangID);
                return;
            }
        }

        [WebMethod(Description = "Получает ключи полного адреса улицы")]
        public AddressKeysInfo GetStreetAddressKeys(int StreetKey)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                AddressKeysInfo si = ctx.Streets.Where(p => (p.Ik_street == StreetKey)).Select(x =>
                        new AddressKeysInfo() { ID = x.Ik_street, TownKey = x.ik_gorod, RaionKey = x.Gorod.Ik_raion, RegionKey = x.Gorod.Raion.Ik_region, CountryKey = x.Gorod.Raion.Region.Ik_strana }).Single();

                return si;
            }

        }

        [WebMethod(Description = "Получает ключи полного адреса школы")]
        public AddressKeysInfo GetSchoolAddressKeys(int SchoolKey)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                AddressKeysInfo si = ctx.Zaved_studs.Where(p => (p.ik_zaved == SchoolKey)).Select(x =>
                        new AddressKeysInfo() { ID = x.ik_zaved, TownKey = x.Ik_gorod, RaionKey = x.Gorod.Ik_raion, RegionKey = x.Gorod.Raion.Ik_region, CountryKey = x.Gorod.Raion.Region.Ik_strana }).Single();

                return si;
            }

        }

        private int AddAbitAddress(int ncode, int AddressTypeKey, int StreetKey, string Building, string flat, string index)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                int code = Convert.ToInt16(ctx.AppendPersonAddress(ncode, AddressTypeKey, StreetKey, Building, "", flat, index, null, null).ReturnValue);
                return code;
            }

        }

        [WebMethod(Description = "Добавляет в сиcтему фактический адрес абитуриента")]
        public int AddAbitFactAddress(int ncode, int StreetKey, string Building, string flat, string index)
        {
            return AddAbitAddress(ncode, 1, StreetKey, Building, flat, index);
        }

        [WebMethod(Description = "Добавляет в сиcтему адрес прописки абитуриента")]
        public int AddAbitSignAddress(int ncode, int StreetKey, string Building, string flat, string index)
        {
            return AddAbitAddress(ncode, 2, StreetKey, Building, flat, index);
        }

        [WebMethod(Description = "Редактирует адрес абитуриента")]
        public void EditAbitAddress(int AddressID, int StreetKey, string Building, string flat, string index)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                int AddressTypeKey = ctx.PersonAddresses.Where(p => p.ik_personAddress == AddressID).Select(x => x.ik_AddressType).Single();
                ctx.UpdatePersonAddress(AddressTypeKey, StreetKey, Building, "", flat, index, null, null, AddressID);
            }
        }

        [WebMethod(Description = "Возвращает набор личных данных абитуриента, включая адреса, язык и документы")]
        public AbitInfo GetAbitData(int ncode)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                AbitInfo res = ctx.Persons.Where(p => p.nCode == ncode).Select(x => new AbitInfo()
                {
                    ID = (int)x.nCode,
                    FirstName = x.Cfirstname,
                    LastName = x.Clastname,
                    MidName = x.Cotch,
                    BirthPlace = x.Cplacebirth,
                    Birth = x.Dd_birth,
                    IsPhysChallenged = x.Linval,
                    HasKids = x.Ldeti,
                    HasJob = x.Lrab,
                    IsMale = x.lSex,
                    NeedsRoom = x.Lobchegit,
                    MedalKey = x.Student.ik_medal,
                    MilStateKey = x.ik_voen_zvanie,
                    CellPhone = x.cSotTel,
                    Phone = x.ctelefon,
                    eMail = x.cEmail,
                    CitizenshipKey = x.Ik_grazd,
                    PrepKey = x.Student.Ik_podg,
                    CommunityJobKey = x.Student.Ik_ob_rab,
                    FamStateKey = x.Ik_sem_pol,
                    SpecCountKey = x.Student.Ik_special_uchet,
                    SchoolKey = x.Student.Ik_zaved,
                    GraduateYear = (int?)x.Student.Ngodokon,
                    AdditionalInfo = x.Student.Cdopsved,
                    ServiceRecYears = x.Student.StazYear,
                    ServiceRecMonths = x.Student.StazMonth,
                    Duty = x.Student.cDolgnost,
                    OrganizationKey = x.Student.ik_pred,
                    Benefits = x.Student.cLgot
                }).Single();

                res.FactAddress = GetFactAddress(ncode);
                res.SignAddress = GetSignAddress(ncode);

                res.BaseLang = GetBaseLangData(ncode);

                res.EdDocument = GetEdDocumentData(ncode);
                res.IDDocument = GetIDDocumentData(ncode);
                return res;
            }
            
        }

        //Возвращает документ абитуриента, удостоверяющий личность")]
        private DocInfo GetIDDocumentData(int ncode)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                try
                {
                    DocInfo res = ctx.Doc_studs.Where(p => (p.nCode == ncode) && (p.document.IsIdentity)).Select(x => new DocInfo()
                    {
                        ID = (int)x.Ik_doc,
                        DocTypeKey = x.Ik_vid_doc,
                        DocTypeName = x.document.cvid_doc,
                        Given = x.Dd_vidan,
                        GivenBy = x.Cd_kem_vidan,
                        Serie = x.Cd_seria,
                        Number = x.Np_number
                    }).First();

                    return res;
                }
                catch
                {
                    return null;
                }
            }
        }

        //Возвращает документ абитуриента, удостоверяющий образование")]
        private DocInfo GetEdDocumentData(int ncode)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                try
                {
                    DocInfo res = ctx.Doc_studs.Where(p => (p.nCode == ncode) && (p.document.IsEducational)).Select(x => new DocInfo()
                    {
                        ID = (int)x.Ik_doc,
                        DocTypeKey = x.Ik_vid_doc,
                        DocTypeName = x.document.cvid_doc,
                        Given = x.Dd_vidan,
                        GivenBy = x.Cd_kem_vidan,
                        Serie = x.Cd_seria,
                        Number = x.Np_number
                    }).First();

                    return res;
                }
                catch
                {
                    return null;
                }
            }
        }

        //Возвращает язык, изучавшийся абитуриентом в школе")]
        private LangKnowledgeInfo GetBaseLangData(int ncode)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                try
                {
                    LangKnowledgeInfo res = ctx.Lang_studs.Where(p => (p.nCode == ncode)).Select(x => new LangKnowledgeInfo()
                    {
                        ID = (int)x.nCode,
                        LangID = x.Ik_lang,
                        LangName = x.Lang.Cname_lang,
                        MasteryID = x.Ik_step_vlad,
                        MasteryName = x.Step_vlad.Cname_step_vlad
                    }).First();

                    return res;
                }
                catch
                {
                    return null;
                }
            }
        }

        //Возвращает фактический адрес проживания абитуриента")]
        private AddressInfo GetFactAddress(int ncode)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                try
                {
                    AddressInfo res = ctx.PersonAddresses.Where(p => (p.nCode == ncode) && (p.ik_AddressType == 1)).Select(x => new AddressInfo()
                    {
                        ID = (int)x.ik_personAddress,
                        StreetKey = x.Address.Ik_street,
                        StreetName = x.Address.Street.CStreet,
                        Building = x.Address.BuildingNumber,
                        Struct = x.Address.StructNumber,
                        FlatNum = x.Address.FlatNumber,
                        PostIndex = x.Address.fIndex
                    }).First();
                    return res;
                }
                catch
                {
                    return null;
                }
            }
        }

        //Возвращает адрес прописки абитуриента")]
        private AddressInfo GetSignAddress(int ncode)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                try
                {
                    AddressInfo res = ctx.PersonAddresses.Where(p => (p.nCode == ncode) && ((p.ik_AddressType == 2) || (p.ik_AddressType == 3))).Select(x => new AddressInfo()
                    {
                        ID = (int)x.ik_personAddress,
                        StreetKey = x.Address.Ik_street,
                        StreetName = x.Address.Street.CStreet,
                        Building = x.Address.BuildingNumber,
                        Struct = x.Address.StructNumber,
                        FlatNum = x.Address.FlatNumber,
                        PostIndex = x.Address.fIndex
                    }).First();

                    return res;
                }
                catch
                {
                    return null;
                }
            }
        }

        #endregion

        # region EntrantAppMethods

        [WebMethod(Description = "Добавляет в сиcтему заявление абитуриента, возвращает ключ заявления")]
        public int AddAbitAppl(int ncode, int RecruitID, int CatID, bool isMain)
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                int code = ctx.ABIT_add_postup_online(ncode, RecruitID, CatID, DateTime.Today, isMain);

                return code;
            }

        }

        [WebMethod(Description = "Редактирует заявление абитуриента")]
        public void EditAbitAppl(int AppID, int ncode, int RecruitID, int CatID, bool isMain)
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                ctx.ABIT_edit_postup_online(AppID, ncode, RecruitID, CatID, isMain);
                return;
            }

        }

        [WebMethod(Description = "Удаляет заявление абитуриента")]
        public void RemoveAbitAppl(int AppID)
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                ctx.ABIT_del_postup_online(AppID);
                return;
            }

        }

        [WebMethod(Description = "Добавляет экзамен к заявлению абитуриента, возвращает ID экзамена")]
        public int AddAbitExam(int AppID, int DiscID, int ExTypeID, string VedNum, int? Ball)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                return ctx.ABIT_add_vstup_exam(Ball, AppID, DiscID, ExTypeID, VedNum);
            }
        }

        [WebMethod(Description = "Редактирует экзамен абитуриента")]
        public int EditAbitExam(int? ExamID, int? DiscID, int? ExTypeID, string VedNum, int? Ball)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                return ctx.ABIT_Edit_vstup_exam_online(Ball, DiscID, ExTypeID, VedNum, ExamID);
            }
        }

        [WebMethod(Description = "Удаляет экзамен из заявления абитуриента")]
        public void DelAbitExam(int ExamID)
        {

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                ctx.ABIT_Del_vstup_ekz(ExamID); 
            }

        }

        [WebMethod(Description = "Возвращает данные всех заявлений абитуриента")]
        public AppInfo[] GetAllAppData(int ncode)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                AppInfo[] res = ctx.ABIT_postups.Where(p => p.nCode == ncode).Select(x => new AppInfo()
                {
                    ID = (int)x.NN_abit,
                    AppDate = x.dd_pod_zayav,
                    AppOnlineDate = x.dd_online,
                    AppEntryDate = x.dd_vvoda_zayav,
                    AppReturnDate = x.dd_vozvr_zayav,
                    CatEntryKey = x.ik_kat_zach,
                    CatEntryTypeKey = x.Kat_zach.ik_type_kat,
                    CatEntryName = x.Kat_zach.Cname_kat_zach,
                    EntryStateKey = x.ik_zach,
                    EntryStateName = x.ABIT_sost_zach.cname_zach,

                    NumRecord = x.NNrecord,
                    RegNumber = x.RegNomer,
                    IsPrimary = x.IsMain,
                    IsReal = x.Realy_postup,
                    Exams = GetAbitExams(x.NN_abit)
                }).ToArray();

                return res;
            }
        }

        [WebMethod(Description = "Возвращает данные заявления абитуриента")]
        public AppInfo GetAppData(int AppKey)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                AppInfo res = ctx.ABIT_postups.Where(p => p.NN_abit == AppKey).Select(x => new AppInfo()
                {
                    ID = (int)x.NN_abit,
                    AppDate = x.dd_pod_zayav,
                    AppOnlineDate = x.dd_online,
                    AppEntryDate = x.dd_vvoda_zayav,
                    AppReturnDate = x.dd_vozvr_zayav,
                    CatEntryKey = x.ik_kat_zach,
                    CatEntryTypeKey = x.Kat_zach.ik_type_kat,
                    CatEntryName = x.Kat_zach.Cname_kat_zach,
                    EntryStateKey = x.ik_zach,
                    EntryStateName = x.ABIT_sost_zach.cname_zach,

                    NumRecord = x.NNrecord,
                    RegNumber = x.RegNomer,
                    IsPrimary = x.IsMain,
                    IsReal = x.Realy_postup
                }).Single();

                res.Exams = GetAbitExams(AppKey);

                return res;
            }
        }

        // получает вступительные экзамены абитуриента
        private ExamInfo[] GetAbitExams(int AppKey)
        {
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                ExamInfo[] res = ctx.ABIT_Vstup_exams.Where(p => p.NN_abit == AppKey).Select(x => new ExamInfo()
                {
                    ID = (int)x.id,
                    DiscKey = x.ik_disc,
                    DocNum = x.NNvedom,
                    ExamTypeKey = x.ik_sdach,
                    RoomKey = x.id_rasp_kab,
                    Balls = x.cosenka
                }).ToArray();

                return res;
            }
        }

        #endregion

        #region EntrantReportMethods

        [WebMethod(Description = "Возвращает предстоящие абитуриенту экзамены")]
        public EventInfo[] GetEventsData(int ncode)
        {      
            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                int[] aiarray = ctx.ABIT_postups.Where(p => p.nCode == ncode).Select(x => x.NN_abit).ToArray();

                EventInfo[] res = ctx.ABIT_Vstup_exams.Where(p => aiarray.Contains(p.NN_abit)&&(p.cosenka == null)).Select(x => new EventInfo()
                {
                    ID = (int)x.id,
                    SitKey = x.id_rasp_kab,
                    RoomKey = x.ABIT_Rassadka.Room.ik_room,
                    RoomName = x.ABIT_Rassadka.Room.Cname_room,
                    DiscKey = x.ABIT_Disc.ik_disc,
                    DiscName = x.ABIT_Disc.сname_disc,
                    Begins = x.ABIT_Rassadka.ABIT_Raspisanie.TimeBegin,
                    Ends = x.ABIT_Rassadka.ABIT_Raspisanie.TimeEnd,
                    Date = x.ABIT_Rassadka.ABIT_Raspisanie.date_of,
                    EventTypeName = x.ABIT_Rassadka.ABIT_Raspisanie.ABIT_Meropriatie.cname_mer
                    
                }).ToArray();

                return res;
            }
        }

        [WebMethod(Description = "Возвращает статистику поступления")]
        public EnterInfo GetApplicationStatistic(int IDApp)
        {
            // нужно: учесть ЦКП (они занимают места первыми) 

            EnterInfo res = new EnterInfo();

            res.Application = GetAppData(IDApp);

            using (DataLayer.AbitDataContext ctx = new DataLayer.AbitDataContext(conn))
            {
                res.AvgBall = ctx.GetAbitAverageBall(IDApp);

                int?[] AVGBalls = ctx.AbitAverageBalls.Where(p => (p.ik_type_kat == res.Application.CatEntryTypeKey)&&(p.NNrecord == res.Application.NumRecord)).Select(x => x.AVGBall).OrderByDescending(p => p.Value).ToArray();

                int? PassCount = null;
                
                if (res.Application.CatEntryTypeKey == 1) 
                PassCount = ctx.ABIT_Diapazon_spec_facs.Where(p => p.NNrecord == res.Application.NumRecord).Select(x => x.MestBudjet).Single();

                if (PassCount != null)
                {
                    if ((PassCount > AVGBalls.Length) || (PassCount == 0) && (res.Application.CatEntryTypeKey == 3))
                        res.PassBall = ctx.ABIT_proh_balls.Where(p => (p.NNrecord == res.Application.NumRecord) && (p.ik_kat_zach == res.Application.CatEntryKey)).Select(x => x.Ball).Single();
                    res.PassBall = AVGBalls[(int)PassCount - 1];
                }
                else
                    res.PassBall = ctx.ABIT_proh_balls.Where(p => (p.NNrecord == res.Application.NumRecord) && (p.ik_kat_zach == res.Application.CatEntryKey)).Select(x => x.Ball).Single();

                return res;
            }
        }
        #endregion

    }
}
