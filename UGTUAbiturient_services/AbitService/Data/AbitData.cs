using System;
using System.Collections.Generic;

namespace AbitServices.Data
{
    partial class AbitDataDataContext : IAbitDataProvider
    {
        public IEnumerable<Abit_StatisticNewResult> GetAbitStatistics(int reportNum, System.DateTime forDate, int days)
        {            
            if (days < 1) throw new ArgumentOutOfRangeException("days", "Число дней должно быть больше 0.");
            if (days > 60) throw new ArgumentOutOfRangeException("days", "Запрошено слишком большое количество дней в отчёте. Значение должно быть не больше 60.");

            return this.Abit_StatisticNew(forDate.Year, reportNum, forDate, days);
        }

        public  IEnumerable<Abit_StatisticPlanResult>  GetAbitPlan(int year, int reportNum)
        {
            return this.Abit_StatisticPlan(year, reportNum);
        }
    }
}
