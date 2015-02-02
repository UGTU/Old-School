using Abiturient;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using Abiturient.DataTransferObjects;


namespace UGTUServicesTests
{
    /// <summary>
    ///This is a test class for AbitServiceTest and is intended
    ///to contain all AbitServiceTest Unit Tests
    ///</summary>
    [TestClass()]
    public class AbitServiceTest
    {
        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion

        /// <summary>
        ///A test for AddAbitPersonalData
        ///</summary>
        
        [TestMethod()]
        public void AddAbitPersonalDataTestOnServer()
        {
            //AbitService target = new AbitService(); // TODO: Initialize to an appropriate value

            AbitOnline.AbitServiceSoap target = new AbitOnline.AbitServiceSoapClient();

            AbitOnline.AddAbitPersonalDataRequest req = new AbitOnline.AddAbitPersonalDataRequest();

            req.Body = new AbitOnline.AddAbitPersonalDataRequestBody();

            req.Body.LastName = "Web";
            req.Body.FirstName = "Method";
            req.Body.MiddleName = "Test";
            req.Body.Birth = new DateTime(1986, 07, 14);
            req.Body.BirthPlace = string.Empty;
            req.Body.IsPhysChallenged = false;
            req.Body.HasKids = false;
            req.Body.HasJob = false; 
            req.Body.IsMale = false;
            req.Body.NeedsRoom = false;
            req.Body.MedalKey = 1;
            req.Body.MilStateKey = null;
            req.Body.CellPhone = string.Empty;
            req.Body.Phone = string.Empty;
            req.Body.eMail = string.Empty;
            req.Body.CitizenshipKey = null;
            req.Body.PrepKey = null;
            req.Body.CommunityJobKey = null;
            req.Body.FamStateKey = null;
            req.Body.SpecCountKey = null;
            req.Body.SchoolKey = 19;
            req.Body.GraduateYear = 2010;
            req.Body.FactIndex = string.Empty;
            req.Body.FactStreetKey = null;
            req.Body.FactBuilding = string.Empty;
            req.Body.FactFlat = string.Empty;
            req.Body.SignIndex = string.Empty;
            req.Body.SignStreetKey = null;
            req.Body.SignBuilding = string.Empty;
            req.Body.SignFlat = string.Empty;
            req.Body.AdditionalInfo = string.Empty;
            req.Body.ServiceRecYears = 0;
            req.Body.ServiceRecMonths = 0;
            req.Body.Duty = string.Empty;
            req.Body.OrganizationKey = null;
            req.Body.Benefits = string.Empty;

            int actual = target.AddAbitPersonalData(req).Body.AddAbitPersonalDataResult;//LastName, FirstName, MiddleName, Birth, BirthPlace, IsPhysChallenged, HasKids, HasJob, IsMale, NeedsRoom, MedalKey, MilStateKey, CellPhone, Phone, eMail, CitizenshipKey, PrepKey, CommunityJobKey, FamStateKey, SpecCountKey, SchoolKey, GraduateYear, FactIndex, FactStreetKey, FactBuilding, FactFlat, SignIndex, SignStreetKey, SignBuilding, SignFlat, AdditionalInfo, ServiceRecYears, ServiceRecMonths, Duty, OrganizationKey, Benefits);
            Assert.IsNotNull(actual);
            Assert.IsTrue(actual!=0);
        }

        [TestMethod()]
        public void AddAbitPersonalDataTestOnServer2()
        {
            //AbitService target = new AbitService(); // TODO: Initialize to an appropriate value

            AbitOnline.AbitServiceSoap target = new AbitOnline.AbitServiceSoapClient();

            AbitOnline.AddAbitPersonalDataRequest req = new AbitOnline.AddAbitPersonalDataRequest();

            req.Body = new AbitOnline.AddAbitPersonalDataRequestBody();

            req.Body.LastName = "Web";
            req.Body.FirstName = "Method";
            req.Body.MiddleName = "Test";
            req.Body.Birth = new DateTime(2011, 07, 14);
            req.Body.BirthPlace = string.Empty;
            req.Body.IsPhysChallenged = false;
            req.Body.HasKids = false;
            req.Body.HasJob = false;
            req.Body.IsMale = false;
            req.Body.NeedsRoom = false;
            req.Body.MedalKey = 1;
            req.Body.MilStateKey = null;
            req.Body.CellPhone = string.Empty;
            req.Body.Phone = string.Empty;
            req.Body.eMail = string.Empty;
            req.Body.CitizenshipKey = null;
            req.Body.PrepKey = null;
            req.Body.CommunityJobKey = null;
            req.Body.FamStateKey = null;
            req.Body.SpecCountKey = null;
            req.Body.SchoolKey = 19;
            req.Body.GraduateYear = 2010;
            req.Body.FactIndex = string.Empty;
            req.Body.FactStreetKey = null;
            req.Body.FactBuilding = string.Empty;
            req.Body.FactFlat = string.Empty;
            req.Body.SignIndex = string.Empty;
            req.Body.SignStreetKey = null;
            req.Body.SignBuilding = string.Empty;
            req.Body.SignFlat = string.Empty;
            req.Body.AdditionalInfo = string.Empty;
            req.Body.ServiceRecYears = 0;
            req.Body.ServiceRecMonths = 0;
            req.Body.Duty = string.Empty;
            req.Body.OrganizationKey = null;
            req.Body.Benefits = string.Empty;

            int actual = target.AddAbitPersonalData(req).Body.AddAbitPersonalDataResult;//LastName, FirstName, MiddleName, Birth, BirthPlace, IsPhysChallenged, HasKids, HasJob, IsMale, NeedsRoom, MedalKey, MilStateKey, CellPhone, Phone, eMail, CitizenshipKey, PrepKey, CommunityJobKey, FamStateKey, SpecCountKey, SchoolKey, GraduateYear, FactIndex, FactStreetKey, FactBuilding, FactFlat, SignIndex, SignStreetKey, SignBuilding, SignFlat, AdditionalInfo, ServiceRecYears, ServiceRecMonths, Duty, OrganizationKey, Benefits);
            Assert.IsNotNull(actual);
            Assert.IsTrue(actual != 0);
        }

        /// <summary>
        ///A test for AddAbitAppl
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        public void AddAbitApplTest()
        {
            AbitService target = new AbitService(); // TODO: Initialize to an appropriate value
            int ncode = 32241; // TODO: Initialize to an appropriate value
            int RecruitID = 369; // TODO: Initialize to an appropriate value
            int CatID = 1; // TODO: Initialize to an appropriate value
            bool isMain = true; // TODO: Initialize to an appropriate value
            int actual;
            actual = target.AddAbitAppl(ncode, RecruitID, CatID, isMain);
            Assert.IsNotNull(actual);
        }

        /// <summary>
        ///A test for AddAbitFactAddress
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        public void AddAbitFactAddressTest()
        {
            AbitService target = new AbitService(); // TODO: Initialize to an appropriate value
            int AddressID = 26404; // TODO: Initialize to an appropriate value
            int StreetKey = 2383; // TODO: Initialize to an appropriate value
            string Building = "333"; // TODO: Initialize to an appropriate value
            string flat = "666"; // TODO: Initialize to an appropriate value
            string index = "169301"; // TODO: Initialize to an appropriate value
            target.EditAbitAddress(AddressID, StreetKey, Building, flat, index);
        }

        /// <summary>
        ///A test for AddAbitExam
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.

        [TestMethod()]
        public void AddAbitExamTest()
        {
            AbitService target = new AbitService(); // TODO: Initialize to an appropriate value
            int AppID = 14326; // TODO: Initialize to an appropriate value
            int DiscID = 12; // TODO: Initialize to an appropriate value
            int ExTypeID = 5; // TODO: Initialize to an appropriate value
            string VedNum = "666"; // TODO: Initialize to an appropriate value
            Nullable<int> Ball = 55; // TODO: Initialize to an appropriate value
            int expected = 0; // TODO: Initialize to an appropriate value
            int actual;
            actual = target.AddAbitExam(AppID, DiscID, ExTypeID, VedNum, Ball);
            Assert.AreNotEqual(expected, actual);
        }

         [TestMethod()]
        public void EditAbitExamTest()
        {
            AbitService target = new AbitService(); // TODO: Initialize to an appropriate value
            int ID = 47163; // TODO: Initialize to an appropriate value
            int DiscID = 12; // TODO: Initialize to an appropriate value
            int ExTypeID = 1; // TODO: Initialize to an appropriate value
            string VedNum = "665"; // TODO: Initialize to an appropriate value
            Nullable<int> Ball = 33; // TODO: Initialize to an appropriate value
            int expected = 0; // TODO: Initialize to an appropriate value
            int actual = 1;
            target.EditAbitExam(ID, DiscID, ExTypeID, VedNum, Ball);
            Assert.AreNotEqual(expected, actual);
        }

        
    }
}
