using Schedule;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using Schedule.DataTransferObjects;
using DDay.iCal;
using System.Text;
using System.IO;

namespace UGTUServicesTests
{
    
    
    /// <summary>
    ///This is a test class for ScheduleServiceTest and is intended
    ///to contain all ScheduleServiceTest Unit Tests
    ///</summary>
    [TestClass()]
    public class ScheduleServiceTest
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
        ///A test for GetCalendarForGroup
        ///</summary>
        [TestMethod()]
        public void GetCalendarForGroupTest()
        {
            ScheduleService target = new ScheduleService(); // TODO: Initialize to an appropriate value
            GroupInfo group = new GroupInfo(); // TODO: Initialize to an appropriate value
            group.ID = 1181;
            group.Name = "IST-1-09";
            iCalendar actual;
            actual = target.GetCalendarForGroup(group.ID);
            CICalConverter.SerializeCalendar(actual, "C:\\TestResult.ics");

            string tmp = CICalConverter.SerializeCalendarToString(actual);

            StreamReader sr = new StreamReader("C:\\TestResult.ics");

            string tmp2 = sr.ReadToEnd();

            StreamWriter sw = new StreamWriter("C:\\StringTestResult.ics");

            sw.Write(tmp);

            sw.Close();

        }
    }
}
