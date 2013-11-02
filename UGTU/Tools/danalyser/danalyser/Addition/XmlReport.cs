using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;

namespace DelphiAnalyser.Addition
{
    [XmlRoot("Report")]
    public class XmlReport
    {
        private DateTime date;
        private List<SerializableError> errors;

        public DateTime Date { get { return date; } set { date = value; } }
        [XmlArrayItem("Error")]
        public List<SerializableError> Errors { get { return errors; } set { errors = value; } }

        public XmlReport()
        {
            date = DateTime.Now;
            errors = new List<SerializableError>();
        }
    }
}
