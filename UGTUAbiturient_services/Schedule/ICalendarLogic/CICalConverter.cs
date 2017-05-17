using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DDay.iCal;
using DDay.iCal.Serialization.iCalendar;
using Schedule.DataTransferObjects;

namespace Schedule
{
    static public class CICalConverter
    {
        static public iCalendar GetNewCalendar()
        {
            return new iCalendar();
        }

        static public void AddNewEvent(iCalendar iCal, EventInfo ei)
        {
            Event evt = iCal.Create<Event>();

            if (ei.Pattern != null)
            {
                evt.DTStart = new iCalDateTime(ei.Pattern.BeginDate.Year, ei.Pattern.BeginDate.Month, ei.Pattern.BeginDate.Day, ei.Begin.Hour, ei.Begin.Minute, ei.Begin.Second);
                evt.DTEnd = new iCalDateTime(ei.Pattern.BeginDate.Year, ei.Pattern.BeginDate.Month, ei.Pattern.BeginDate.Day, ei.End.Hour, ei.End.Minute, ei.End.Second);
            }
            else
            {
                evt.DTStart = new iCalDateTime(ei.Begin.Year, ei.Begin.Month, ei.Begin.Day, ei.Begin.Hour, ei.Begin.Minute, ei.Begin.Second);
                evt.DTEnd = new iCalDateTime(ei.End.Year, ei.End.Month, ei.End.Day, ei.End.Hour, ei.End.Minute, ei.End.Second);
            }
            //evt.Description = "#Disc:" + ei.Discipline + "#Type:" + ei.Type + "#Teacher:" + ei.Teacher + "#IsMoved:" + ei.IsMoved.ToString();

            evt.Properties.Add(new CalendarProperty("Название дисциплины", ei.Discipline));
            evt.Properties.Add(new CalendarProperty("Короткое название дисциплины", ei.DisciplineShort));
            evt.Properties.Add(new CalendarProperty("Тип занятия", ei.Type));
            evt.Properties.Add(new CalendarProperty("Полное имя преподавателя", ei.Teacher.Name));
            evt.Properties.Add(new CalendarProperty("ФИО преподавателя", ei.Teacher.ShortName));
            evt.Properties.Add(new CalendarProperty("Группы", ei.CalcUnit));

            evt.Location = ei.Room;
            evt.Summary = ei.DisciplineShort + ", " + ei.Type + ", " + ei.CalcUnit + ", " + ei.Teacher.ShortName+", "+ei.Room;

            PeriodList pl = new PeriodList();

            if (ei.Exceptions!=null)
            foreach (DateTime dt in ei.Exceptions)
                pl.Add(new Period(new DDay.iCal.iCalDateTime(dt)));

            if (pl.Count>0)
            evt.ExceptionDates.Add(pl);

            //if (ei.IsMoved) evt.Summary = evt.Summary + " Перенесено.";

            if (ei.Pattern!= null)
            {
            FrequencyType ft = FrequencyType.None; 

            switch (ei.Pattern.Type) 
            {
               case 1: ft = FrequencyType.Daily;
                    break;
                case 2:ft = FrequencyType.Weekly;
                    break;
                case 3:ft = FrequencyType.Monthly;
                    break;
            }

            RecurrencePattern rp = new RecurrencePattern(ft, ei.Pattern.Frequency);

            List<WeekDay> wdList = GetDayFromMask(ei.Pattern.RepeatMask);
            foreach (WeekDay wd in wdList)
            rp.ByDay.Add(wd);

            rp.Until = ei.Pattern.EndDate;

            evt.RecurrenceRules.Add(rp);
            }
        }

        private static List<WeekDay> GetDayFromMask(string mask)
        {
            List<WeekDay> res = new List<WeekDay>();

            if (mask.Contains('2')) res.Add(new WeekDay(DayOfWeek.Monday));
            if (mask.Contains('3')) res.Add(new WeekDay(DayOfWeek.Tuesday));
            if (mask.Contains('4')) res.Add(new WeekDay(DayOfWeek.Wednesday));
            if (mask.Contains('5')) res.Add(new WeekDay(DayOfWeek.Thursday));
            if (mask.Contains('6')) res.Add(new WeekDay(DayOfWeek.Friday));
            if (mask.Contains('7')) res.Add(new WeekDay(DayOfWeek.Saturday));

            return res;
        }

        static public void SerializeCalendar(iCalendar iCal, string fname)
        {
            iCalendarSerializer sz = new iCalendarSerializer();
            sz.Serialize(iCal, fname);
        }

        static public string SerializeCalendarToString(iCalendar iCal)
        {
            iCalendarSerializer sz = new iCalendarSerializer();
            return sz.SerializeToString(iCal);
        }
    }
}