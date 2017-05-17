using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DDay.iCal;
using DDay.iCal.Serialization.iCalendar;

namespace Schedule
{
    static public class CICalConverter
    {
        public iCalendar GetNewCalendar()
        {
            return new iCalendar();
        }

        public void AddNewEvent(iCalendar iCal, DateTime Begin, DateTime End, string Discipline, string Type, string Room, string Teacher, bool IsMoved)
        {
            Event evt = iCal.Create<Event>();
                
            evt.Start = new iCalDateTime(Begin);         
            evt.End = new iCalDateTime(End);           
            evt.Description = "#Disc:"+Discipline+"#Type:"+Type+"#Teacher:"+Teacher+"#IsMoved:"+IsMoved.ToString();
            evt.Location = Room;
            evt.Summary = "Занятие по предмету '"+Discipline+"', "+ Type +", проводится в " + Room + ", преподаватель " + Teacher +", с "+ Begin.ToShortTimeString() +" до " + End.ToShortTimeString()+".";
            if (IsMoved) evt.Summary = evt.Summary + " Перенесено.";
        }

        public void AddNewEvent(iCalendar iCal, DateTime Begin, DateTime End, string Discipline, string Type, string Room, string Teacher, string SubGroup, bool IsMoved)
        {
            Event evt = iCal.Create<Event>();
                
            evt.Start = new iCalDateTime(Begin);         
            evt.End = new iCalDateTime(End);           
            evt.Description = "#Disc:"+Discipline+"#Type:"+Type+"#SubGroup:"+SubGroup+"#Teacher:"+Teacher+"#IsMoved:"+IsMoved.ToString();
            evt.Location = Room;
            evt.Summary = "Занятие по предмету '"+Discipline+"', "+ Type +" для подгруппы "+SubGroup+", проводится в " + Room + ", преподаватель " + Teacher +", с "+ Begin.ToShortTimeString() +" до " + End.ToShortTimeString()+".";
            if (IsMoved) evt.Summary = evt.Summary + " Перенесено.";
        }

        public void SerializeCalendar(iCalendar iCal, string fname)
        {
            iCalendarSerializer sz = new iCalendarSerializer();
            sz.Serialize(iCal, fname);
        }
}