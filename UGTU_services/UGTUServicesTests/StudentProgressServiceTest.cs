using StudentProgress;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;

namespace UGTUServicesTests
{
    
    
    /// <summary>
    ///This is a test class for StudentProgressServiceTest and is intended
    ///to contain all StudentProgressServiceTest Unit Tests
    ///</summary>
    [TestClass()]
    public class StudentProgressServiceTest
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
        ///A test for GetStudentProgress
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        //[HostType("ASP.NET")]
        ////[AspNetDevelopmentServerHost("%PathToWebRoot%")]
        //[AspNetDevelopmentServerHost(@"C:\Users\tanyav.IST\Desktop\ugtu Services\UGTU Services\StudentProgress", "/")]
        ////[AspNetDevelopmentServerHost("C:\\Users\\tanyav.IST\\Desktop\\ugtu Services\\UGTU Services\\StudentProgress", "/")]
        //[UrlToTest("http://localhost:1665/StudentProgressService.asmx")]
        public void GetStudentProgressTest()
        {
            const string ID = "070779";
            StudentProgressService target = new StudentProgressService(); // TODO: Initialize to an appropriate value
            string StudentID = ID; // TODO: Initialize to an appropriate value
            string PasportNum = "973144"; // TODO: Initialize to an appropriate value            
            StudentProgressDTO actual;
            actual = target.GetStudentProgress(StudentID, PasportNum);
            Assert.IsNotNull(actual);
            Assert.AreEqual(ID, actual.ID);
            //проверка сроков сессии
            Assert.AreEqual(1, actual.Semesters[0].SemesterNum);
            Assert.AreEqual(DateTime.Parse("01.09.2007"), actual.Semesters[0].SemesterStartDate);
            Assert.AreEqual(DateTime.Parse("28.12.2007"), actual.Semesters[0].SemesterEndDate);
            Assert.AreEqual(DateTime.Parse("04.01.2008"), actual.Semesters[0].SessionStartDate);
            Assert.AreEqual(DateTime.Parse("20.01.2008"), actual.Semesters[0].SessionEndDate);

            Assert.AreEqual(2, actual.Semesters[1].SemesterNum);
            Assert.AreEqual(DateTime.Parse("04.02.2008"), actual.Semesters[1].SemesterStartDate);
            Assert.AreEqual(DateTime.Parse("30.05.2008"), actual.Semesters[1].SemesterEndDate);
            Assert.AreEqual(DateTime.Parse("02.06.2008"), actual.Semesters[1].SessionStartDate);
            Assert.AreEqual(DateTime.Parse("28.06.2008"), actual.Semesters[1].SessionEndDate);

            Assert.AreEqual(3, actual.Semesters[2].SemesterNum);
            Assert.AreEqual(DateTime.Parse("01.09.2008"), actual.Semesters[2].SemesterStartDate);
            Assert.AreEqual(DateTime.Parse("29.12.2008"), actual.Semesters[2].SemesterEndDate);
            Assert.AreEqual(DateTime.Parse("08.01.2009"), actual.Semesters[2].SessionStartDate);
            Assert.AreEqual(DateTime.Parse("02.02.2009"), actual.Semesters[2].SessionEndDate);

            Assert.AreEqual(4, actual.Semesters[3].SemesterNum);
            Assert.AreEqual(DateTime.Parse("02.02.2009"), actual.Semesters[3].SemesterStartDate);
            Assert.AreEqual(DateTime.Parse("30.05.2009"), actual.Semesters[3].SemesterEndDate);
            Assert.AreEqual(DateTime.Parse("01.06.2009"), actual.Semesters[3].SessionStartDate);
            Assert.AreEqual(DateTime.Parse("30.06.2009"), actual.Semesters[3].SessionEndDate);
 
            Assert.AreEqual(5, actual.Semesters[4].SemesterNum);
            Assert.AreEqual(DateTime.Parse("01.09.2009"), actual.Semesters[4].SemesterStartDate);
            Assert.AreEqual(DateTime.Parse("26.12.2009"), actual.Semesters[4].SemesterEndDate);
            Assert.AreEqual(DateTime.Parse("11.01.2010"), actual.Semesters[4].SessionStartDate);
            Assert.AreEqual(DateTime.Parse("30.01.2010"), actual.Semesters[4].SessionEndDate);
 
            Assert.AreEqual(6, actual.Semesters[5].SemesterNum);
            Assert.AreEqual(DateTime.Parse("01.02.2010"), actual.Semesters[5].SemesterStartDate);
            Assert.AreEqual(DateTime.Parse("08.05.2010"), actual.Semesters[5].SemesterEndDate);
            Assert.AreEqual(DateTime.Parse("10.05.2010"), actual.Semesters[5].SessionStartDate);
            Assert.AreEqual(DateTime.Parse("22.05.2010"), actual.Semesters[5].SessionEndDate);
 
            /*  Assert.AreEqual(3, actual.Semesters[2].SemesterNum);
            Assert.AreEqual(DateTime.Parse("04.02.2008"), actual.Semesters[2].SemesterStartDate);
            Assert.AreEqual(DateTime.Parse("30.05.2008"), actual.Semesters[2].SemesterEndDate);
            Assert.AreEqual(DateTime.Parse("02.06.2008"), actual.Semesters[2].SessionStartDate);
            Assert.AreEqual(DateTime.Parse("28.06.2008"), actual.Semesters[2].SessionEndDate);

            Assert.AreEqual(3, actual.Semesters[2].SemesterNum);
            Assert.AreEqual(DateTime.Parse("04.02.2008"), actual.Semesters[2].SemesterStartDate);
            Assert.AreEqual(DateTime.Parse("30.05.2008"), actual.Semesters[2].SemesterEndDate);
            Assert.AreEqual(DateTime.Parse("02.06.2008"), actual.Semesters[2].SessionStartDate);
            Assert.AreEqual(DateTime.Parse("28.06.2008"), actual.Semesters[2].SessionEndDate);*/

            //проверка продлений сессии
            Assert.AreEqual(DateTime.Parse("11.02.2008"), actual.Semesters[0].Prolong.ProlongTo);
            Assert.AreEqual("По семейным обстоятельствам", actual.Semesters[0].Prolong.ProlongReason);

            Assert.AreEqual(DateTime.Parse("10.07.2008"), actual.Semesters[1].Prolong.ProlongTo);
            Assert.AreEqual("В связи с пребыванием на спортивном соревновании", actual.Semesters[1].Prolong.ProlongReason);

            //проверка аттестаций
            Assert.AreEqual(2,actual.Semesters[4].CheckPoints[0].CheckPointNum);
            Assert.AreEqual(DateTime.Parse("20.03.2010"),actual.Semesters[4].CheckPoints[0].CheckPointStartDate);
            Assert.AreEqual(DateTime.Parse("25.03.2010"), actual.Semesters[4].CheckPoints[0].CheckPointEndDate);
            Assert.AreEqual("Управление данными", actual.Semesters[4].CheckPoints[0].Disciplines[7].Discipline);
            Assert.AreEqual(true, actual.Semesters[4].CheckPoints[0].Disciplines[7].HasPassed);
            Assert.AreEqual(20, actual.Semesters[4].CheckPoints[0].Disciplines[7].AbsentHours);
            Assert.AreEqual(10, actual.Semesters[4].CheckPoints[0].Disciplines[7].AbsentByReasonHours);


             //Assert.AreEqual(DateTime.Parse("Ухтинский государственный технический университет"), actual.Thesis.Holder);
           // Assert.AreEqual(DateTime.Parse("Семериков А.В."), actual.Thesis.Manager);
        }


        [TestMethod()]
        //[HostType("ASP.NET")]
        ////[AspNetDevelopmentServerHost("%PathToWebRoot%")]
        //[AspNetDevelopmentServerHost(@"C:\Users\tanyav.IST\Desktop\ugtu Services\UGTU Services\StudentProgress", "/")]
        ////[AspNetDevelopmentServerHost("C:\\Users\\tanyav.IST\\Desktop\\ugtu Services\\UGTU Services\\StudentProgress", "/")]
        //[UrlToTest("http://localhost:1665/StudentProgressService.asmx")]
        public void GetNotActiveStudentProgressTest()
        {
            const string ID = "060807";
            StudentProgressService target = new StudentProgressService(); // TODO: Initialize to an appropriate value
            string StudentID = ID; // TODO: Initialize to an appropriate value
            string PasportNum = ""; // TODO: Initialize to an appropriate value            
            StudentProgressDTO actual;
            actual = target.GetStudentProgress(StudentID, PasportNum);
            Assert.IsNotNull(actual);
            Assert.AreEqual(ID, actual.ID);
            Assert.AreEqual("Отчислен", actual.CurrentStatus);
        }


        [TestMethod()]
        //[HostType("ASP.NET")]
        ////[AspNetDevelopmentServerHost("%PathToWebRoot%")]
        //[AspNetDevelopmentServerHost(@"C:\Users\tanyav.IST\Desktop\ugtu Services\UGTU Services\StudentProgress", "/")]
        ////[AspNetDevelopmentServerHost("C:\\Users\\tanyav.IST\\Desktop\\ugtu Services\\UGTU Services\\StudentProgress", "/")]
        //[UrlToTest("http://localhost:1665/StudentProgressService.asmx")]
        public void GetGraduatedByDateStudentProgressTest()
        {
            const string ID = "030570";
            StudentProgressService target = new StudentProgressService(); // TODO: Initialize to an appropriate value
            string StudentID = ID; // TODO: Initialize to an appropriate value
            string PasportNum = "343434"; // TODO: Initialize to an appropriate value            
            StudentProgressDTO actual;
            actual = target.GetStudentProgress(StudentID, PasportNum);
            Assert.IsNotNull(actual);
            Assert.AreEqual(ID, actual.ID);
            Assert.AreEqual("Завершил обучение", actual.CurrentStatus);
        }


        [TestMethod()]
        //[HostType("ASP.NET")]
        ////[AspNetDevelopmentServerHost("%PathToWebRoot%")]
        //[AspNetDevelopmentServerHost(@"C:\Users\tanyav.IST\Desktop\ugtu Services\UGTU Services\StudentProgress", "/")]
        ////[AspNetDevelopmentServerHost("C:\\Users\\tanyav.IST\\Desktop\\ugtu Services\\UGTU Services\\StudentProgress", "/")]
        //[UrlToTest("http://localhost:1665/StudentProgressService.asmx")]
        public void GetGraduatedByThesisStudentProgressTest()
        {
            const string ID = "070779";
            StudentProgressService target = new StudentProgressService(); // TODO: Initialize to an appropriate value
            string StudentID = ID; // TODO: Initialize to an appropriate value
            string PasportNum = "973144"; // TODO: Initialize to an appropriate value            
            StudentProgressDTO actual;
            actual = target.GetStudentProgress(StudentID, PasportNum);
            Assert.IsNotNull(actual);
            Assert.AreEqual(ID, actual.ID);
            Assert.AreEqual("Завершил обучение", actual.CurrentStatus);
        }


        [TestMethod()]
        //[HostType("ASP.NET")]
        ////[AspNetDevelopmentServerHost("%PathToWebRoot%")]
        //[AspNetDevelopmentServerHost(@"C:\Users\tanyav.IST\Desktop\ugtu Services\UGTU Services\StudentProgress", "/")]
        ////[AspNetDevelopmentServerHost("C:\\Users\\tanyav.IST\\Desktop\\ugtu Services\\UGTU Services\\StudentProgress", "/")]
        //[UrlToTest("http://localhost:1665/StudentProgressService.asmx")]
        public void GetOnLeaveStudentProgressTest()
        {
            const string ID = "070773";
            StudentProgressService target = new StudentProgressService(); // TODO: Initialize to an appropriate value
            string StudentID = ID; // TODO: Initialize to an appropriate value
            string PasportNum = "197891"; // TODO: Initialize to an appropriate value            
            StudentProgressDTO actual;
            actual = target.GetStudentProgress(StudentID, PasportNum);
            Assert.IsNotNull(actual);
            Assert.AreEqual(ID, actual.ID);
            Assert.AreEqual("В академ. отпуске", actual.CurrentStatus);
        }

    }
}
