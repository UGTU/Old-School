using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AbitServices.Data
{
    public interface IAbitDataProvider
    {
        IEnumerable<Abit_StatisticNewResult> GetAbitStatistics(int reportNum, DateTime forDate, int days);
        IEnumerable<Abit_StatisticPlanResult> GetAbitPlan(int year, int reportNum);
    }
}
