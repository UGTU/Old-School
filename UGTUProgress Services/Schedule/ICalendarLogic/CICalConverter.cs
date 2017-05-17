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

            evt.DTStart = new iCalDateTime(ei.Pattern.BeginDate.Year, ei.Pattern.BeginDate.Month, ei.Pattern.BeginDate.Day, ei.Begin.Hour, ei.Begin.Minute, ei.Begin.Second);
            evt.DTEnd = new iCalDateTime(ei.Pattern.BeginDate.Year, ei.Pattern.BeginDate.Month, ei.Pattern.BeginDate.Day, ei.End.Hour, ei.End.Minute, ei.End.Second);

            evt.Description = "#Disc:" + ei.Discipline + "#Type:" + ei.Type + "#Teacher:" + ei.Teacher + "#IsMoved:" + ei.IsMoved.ToString();
            evt.Location = ei.Room;
            evt.Summary =  ei.Discipline + ", " + ei.Type+ ", " + ei.Teacher + ", с " + ei.Begin.ToShortTimeString() + " до " + ei.End.ToShortTimeString() + ".";

            //List<ICalendarProperty> props = new List<ICalendarProperty>(;

            //evt.Properties.

            if (ei.IsMoved) evt.Summary = evt.Summary + " Перенесено.";

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