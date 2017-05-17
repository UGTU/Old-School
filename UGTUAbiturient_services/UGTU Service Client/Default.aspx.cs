using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UGTU_Service_Client
{
    public partial class _Default : System.Web.UI.Page
    {
        public _Default()
        {
            PreRender += new EventHandler(_Default_PreRender);
        }

        void _Default_PreRender(object sender, EventArgs e)
        {
            net.ugtu.ist.services.StudentProgressService ps = new net.ugtu.ist.services.StudentProgressService();
            ps.GetStudentProgressAsync("1", "1");
            ps.GetStudentProgressCompleted += new net.ugtu.ist.services.GetStudentProgressCompletedEventHandler(ps_GetStudentProgressCompleted);               
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        void ps_GetStudentProgressCompleted(object sender, net.ugtu.ist.services.GetStudentProgressCompletedEventArgs e)
        {
            Response.Write("Статус студента: " + e.Result.CurrentStatus+"<br>");
            foreach (net.ugtu.ist.services.SemesterInfo si in e.Result.Semesters)
            {
                Response.Write("<table> <tr> <td><h3>Дисциплина</h3></td><td><h3>Вид</h3></td><td><h3>Оценка</h3></td><td><h3>Дата получения</h3></td><td><h3>Плановая дата</h3></td></tr>");
                foreach (net.ugtu.ist.services.ProgressInfo pi in si.Progress)
                {
                    Response.Write("<tr>");
                    Response.Write("<td>" + pi.Discipline + "</td>" + "<td>" + pi.LessonType + "</td>" + "<td>" + pi.Mark + "</td>" + "<td>" + pi.PassDate.ToShortDateString() + "</td>" + "<td>" + pi.PlanDate.ToShortDateString() + "</td>");
                    Response.Write("</tr>");
                }
                Response.Write("</table>");
            }
        }
    }
}