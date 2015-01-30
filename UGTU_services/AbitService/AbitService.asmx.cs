using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using AbitServices.Data;
using AbitServices.DTO;

namespace AbitServices
{
    /// <summary>
    /// Summary description for Service1
    /// </summary>
    [WebService(Namespace = "http://AbitServices.ugtu.net/AbitService", Description = "Служит для предоставления выборок по ходу приёмной компании для формирования отчётности.")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]    
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class AbitService : System.Web.Services.WebService
    {
        public AbitDynamic GetAbitDynamic(IAbitDataProvider provider, int reportNum, DateTime dateBegin, int days)
        {
            // Require
            if (provider == null) throw new ArgumentNullException("provider", "Provider не может быть null!");
            
            // Get Data
            var abitResult = provider.GetAbitStatistics(reportNum, dateBegin, days);
            var abitPlan = provider.GetAbitPlan(dateBegin.Year, reportNum);
            
            // Transform to result
            var abitStat = abitResult.GroupBy(x => x.nnrecord);
            var abitUniversityStat = abitResult.GroupBy(x => x.date).Select(CreateAbitSpecStatistics).ToArray();            
            var unionStat = abitStat.Select(x => CreateAbitStatistics(abitPlan, x)).ToArray();

            return CreateAbitDynamic(abitPlan, abitUniversityStat, unionStat);            
        }

        private static AbitDynamic CreateAbitDynamic(IEnumerable<Abit_StatisticPlanResult> abitPlan, AbitSpecStatistics[] abitUniversityStat, AbitStatistics[] unionStat)
        {
            return new AbitDynamic()
                       {
                           UniversityPlanValues = new AbitStatisticsVal()
                                                      {
                                                          Budget = abitPlan.Sum(x => x._1.GetValueOrDefault()),
                                                          Ckp = abitPlan.Sum(x => x._2.GetValueOrDefault()),
                                                          Contract = abitPlan.Sum(x => x._3.GetValueOrDefault())
                                                      },
                           UniveristyStatValues = abitUniversityStat,
                           SpecStatValues = unionStat
            
                       };
        }

        private static AbitStatistics CreateAbitStatistics(IEnumerable<Abit_StatisticPlanResult> abitPlan, IGrouping<int?, Abit_StatisticNewResult> abitStatisticsItem)
        {
            return new AbitStatistics()
                       {
                           FacName =
                               abitPlan.Single(z => z.nnrecord == abitStatisticsItem.Key).CShort_name_fac,
                           SpecShortName =
                               abitPlan.Single(z => z.nnrecord == abitStatisticsItem.Key).cShort_spec,
                           SpecNum = abitPlan.Single(z => z.nnrecord == abitStatisticsItem.Key).Sh_spec,


                           PlanValues = new AbitStatisticsVal()
                                            {
                                                Budget = abitPlan.Single(z => z.nnrecord == abitStatisticsItem.Key)._1.GetValueOrDefault(),
                                                Ckp = abitPlan.Single(z => z.nnrecord == abitStatisticsItem.Key)._2.GetValueOrDefault(),
                                                Contract = abitPlan.Single(z => z.nnrecord == abitStatisticsItem.Key)._3.GetValueOrDefault()
                                            },
                           StatValues = abitStatisticsItem.Select(z => new AbitSpecStatistics()
                                                          {
                                                              ValidForDate = z.date.GetValueOrDefault(),
                                                              Values = new AbitStatisticsVal()
                                                                           {
                                                                               Budget = z._1.GetValueOrDefault(),
                                                                               Ckp = z._2.GetValueOrDefault(),
                                                                               Contract = z._3.GetValueOrDefault()
                                                                           }
                                                          }).ToArray()
                       };
        }

        private static AbitSpecStatistics CreateAbitSpecStatistics(IGrouping<DateTime?, Abit_StatisticNewResult> abitResultItem)
        {
            return new AbitSpecStatistics()
                       {
                           ValidForDate =
                               abitResultItem.Key.GetValueOrDefault(),
                           Values =
                               new AbitStatisticsVal()
                                   {
                                       Budget =
                                           abitResultItem.Sum(
                                               y =>
                                               y._1.
                                                   GetValueOrDefault
                                                   ()),
                                       Ckp =
                                           abitResultItem.Sum(
                                               y =>
                                               y._2.
                                                   GetValueOrDefault
                                                   ()),
                                       Contract =
                                           abitResultItem.Sum(
                                               y =>
                                               y._3.
                                                   GetValueOrDefault
                                                   ())
                                   }
                       };
        }

        /// <summary>
        /// Получает данные по поданным заявлениям абитуриентов
        /// </summary>
        /// <param name="reportNum">Номер отчёта. Классы отчётов заданы в таблице ABIT_Report</param>
        /// <param name="dateBegin">Начальная дата получения выборки</param>
        /// <param name="days">Количество дней в выборке</param>
        /// <returns>Данные по поданным заявлениям</returns>
        [WebMethod(Description = "Получает данные по динамике заявлений на специальности на заданный диапазон дней по указанной группе специальностей.")]
        public DTO.AbitDynamic GetAbitStatistics(int reportNum, DateTime dateBegin, int days)
        {
            using (var ctx = new Data.AbitDataDataContext())
            {
                return GetAbitDynamic(ctx, reportNum, dateBegin, days);       
            }
        }

        [WebMethod(Description = "Получает набор отчётов по динамике набора")]
        public AbitReport[] GetAbitReports()
        {
            using (var ctx = new Data.AbitDataDataContext())
            {
                return
                    ctx.ABIT_Reports.OrderBy(x=>x.RecordOrder).Select(x => new AbitReport() {Id = x.IDReport, ReportName = x.ReportName}).ToArray();
            }
        }
    }
}