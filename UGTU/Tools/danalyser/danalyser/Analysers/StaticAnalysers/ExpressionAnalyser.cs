using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.StaticAnalysers
{
    public abstract class ExpressionAnalyser: BaseStaticAnalyser
    {
        /// <summary>
        /// Результат выражения
        /// </summary>
        protected class ExprResult
        {
            private bool isConstant, wasOperand, wasValue;
            private object value;

            /// <summary>
            /// Константное ли значение
            /// </summary>
            public bool IsConstant { get { return isConstant; } set { isConstant = value; } }

            /// <summary>
            /// Был ли хоть один операнд (если небыло, то это пока не выражение а константа)
            /// </summary>
            public bool WasOperand { get { return wasOperand; } set { wasOperand = value; } }

            /// <summary>
            /// Было ли до этого выражение инициировано значением
            /// </summary>
            public bool WasValue { get { return wasValue; } set { wasValue = value; } }

            /// <summary>
            /// Является ли выражение константным
            /// </summary>
            public bool ConstantExpression { get { return isConstant && wasOperand; } }

            /// <summary>
            /// Значение выражения
            /// </summary>
            public object Value { get { return value; } set { this.value = value; this.wasValue = true; } }

            /// <summary>
            /// Конструктор
            /// </summary>
            public ExprResult()
            {
                this.isConstant = true;
                this.wasOperand = false;
                this.wasValue = false;
            }

            /// <summary>
            /// Объединить результаты двух выражений
            /// </summary>
            /// <param name="parent"></param>
            public void Add(ExprResult parent)
            {
                this.isConstant &= parent.isConstant;
                this.wasOperand |= parent.wasOperand;
                this.wasValue |= parent.wasValue;
                if (!this.wasValue) this.value = parent.value;
            }
        }

        protected AnalyserParameters e;

        /// <summary>
        /// Строка
        /// </summary>
        protected void Str()
        {
            while (true)
            {
                switch (e.Current.Token)
                {
                    case DelphiTokens.String:
                    case DelphiTokens.Char:
                        e.Next();
                        break;
                    default:
                        return;
                }
            }
        }

        /// <summary>
        /// Знаковое число
        /// </summary>
        protected object SignedReal()
        {
            string value = string.Empty;
            while (true)
            {
                switch (e.Current.Token)
                {
                    case DelphiTokens.Addition:
                    case DelphiTokens.Subtraction:
                        value += e.Current.Text;
                        e.Next();
                        break;
                    default:
                        switch (e.Current.Token)
                        {
                            case DelphiTokens.Digits:
                                value += e.Current.Text;
                                e.Next();
                                if (e.MatchTokens(DelphiTokens.Dot))
                                {
                                    value += ",";
                                    e.Next();
                                    if (e.MatchTokens(DelphiTokens.Digits))
                                    {
                                        value += e.Current.Text;
                                        e.Next();
                                    }
                                    return Convert.ToDouble(value);
                                }
                                return Convert.ToInt32(value);
                            case DelphiTokens.HexConstant:
                                e.Next();
                                break;
                        }
                        return 0;
                }
            }
        }

        /// <summary>
        /// Константа
        /// </summary>
        protected object Const()
        {
            switch (e.Current.Token)
            {
                case DelphiTokens.String:
                case DelphiTokens.Char:
                    Str();
                    return string.Empty;
                case DelphiTokens.True:
                case DelphiTokens.False:
                    e.Next();
                    return true;
                default:
                    return SignedReal();
            }
        }

        /// <summary>
        /// Интервал значений
        /// </summary>
        protected void Interval()
        {
            SimpleExpression();
            if (e.MatchTokens(DelphiTokens.Interval))
            {
                e.Next();
                SimpleExpression();
            }
        }

        /// <summary>
        /// Несколько интервалов
        /// </summary>
        protected void Intervals()
        {
            Interval();
            while (e.MatchTokens(DelphiTokens.Comma))
            {
                e.Next();
                Interval();
            }
        }

        /// <summary>
        /// Вообще после любой переменной может идти многократное разыменования (если это указатель на указатель)
        /// </summary>
        protected void OptionalCarets()
        {
            while (e.MatchTokens(DelphiTokens.Caret))
                e.Next();
        }

        /// <summary>
        /// Возможен индекс после имени переменной (если она массив)
        /// </summary>
        protected void OptionalArrayIndex()
        {
            while (e.MatchTokens(DelphiTokens.LSBr))
            {
                e.Next();
                OptionalExpressionList();
                e.Match(DelphiTokens.RBr);
                OptionalCarets();
                OptionalFunctionParams();
            }
        }

        /// <summary>
        /// Возможны параметры после имени переменной (если она функция/процедура)
        /// </summary>
        protected void OptionalFunctionParams()
        {
            while (e.MatchTokens(DelphiTokens.LBr))
            {
                e.Next();
                if (!e.MatchTokens(DelphiTokens.RBr))
                    AssigmentParams();
                e.Match(DelphiTokens.RBr);
                OptionalCarets();
                OptionalArrayIndex();
            }
        }

        /// <summary>
        /// После имени переменной может идти любая последовательность () [] ^
        /// </summary>
        protected void OptionalAFExtension()
        {
            OptionalCarets();
            switch (e.Current.Token)
            {
                case DelphiTokens.LSBr:
                    OptionalArrayIndex();
                    break;
                case DelphiTokens.LBr:
                    OptionalFunctionParams();
                    break;
            }
        }

        /// <summary>
        /// Возможно округление значения (x:2)
        /// </summary>
        protected void OptionalRealRounded()
        {
            if (e.MatchTokens(DelphiTokens.Colon))
            {
                e.Next();
                SimpleExpression();
            }
        }

        /// <summary>
        /// Параметр может быть задан в виде присвоения (What:=x)
        /// </summary>
        protected void AssigmentParam()
        {
            if (e[e.CurrentIndex + 1].Token == DelphiTokens.Assigment)
            {
                e.Match(DelphiTokens.Id);
                e.Match(DelphiTokens.Assigment);
                Expression();
            }
            else
            {
                Expression();
                OptionalRealRounded();
                OptionalRealRounded();
            }
        }

        /// <summary>
        /// Набор параметров типа присваивания
        /// </summary>
        protected void AssigmentParams()
        {
            AssigmentParam();
            while (e.MatchTokens(DelphiTokens.Comma))
            {
                e.Next();
                AssigmentParam();
            }
        }

        /// <summary>
        /// Операнд-переменная
        /// </summary>
        protected void Variable()
        {
            bool loop = true;
            switch (e.Current.Token)
            {
                case DelphiTokens.LBr:
                    e.Next();
                    Expression();
                    e.Match(DelphiTokens.RBr);
                    loop = (e.MatchTokens(DelphiTokens.Dot));
                    if (loop) e.Next();
                    break;
                case DelphiTokens.LSBr:
                    e.Next();
                    if (!e.MatchTokens(DelphiTokens.RSBr))
                        Intervals();
                    e.Match(DelphiTokens.RSBr);
                    loop = false;
                    break;
            }
            while (loop)
            {
                e.Next();
                OptionalAFExtension();
                if (e.MatchTokens(DelphiTokens.Dot))
                    e.Next();
                else return;
            }
        }

        /// <summary>
        /// Наивысший приоритет
        /// </summary>
        /// <returns>результат выражения</returns>
        protected ExprResult Factor()
        {
            ExprResult result = new ExprResult();
            switch (e.Current.Token)
            {
                case DelphiTokens.Not:
                case DelphiTokens.AtSign:
                case DelphiTokens.Inherited:
                    e.Next();
                    result.Add(Factor());
                    break;
                case DelphiTokens.String:
                case DelphiTokens.Char:
                case DelphiTokens.Addition:
                case DelphiTokens.Subtraction:
                case DelphiTokens.Digits:
                case DelphiTokens.HexConstant:
                case DelphiTokens.True:
                case DelphiTokens.False:
                    result.Value = Const();
                    break;
                default:
                    Variable();
                    result.IsConstant = false;
                    break;
            }
            return result;
        }

        /// <summary>
        /// Высокий приоритет
        /// </summary>
        /// <returns>результат выражения</returns>
        protected ExprResult Term()
        {
            ExprResult result = Factor();
            while (true)
            {
                switch (e.Current.Token)
                {
                    case DelphiTokens.Multiply:
                    case DelphiTokens.Division:
                    case DelphiTokens.Div:
                    case DelphiTokens.Mod:
                    case DelphiTokens.And:
                    case DelphiTokens.Shl:
                    case DelphiTokens.Shr:
                        result.WasOperand = true;
                        e.Next();
                        result.Add(Factor());
                        break;
                    default:
                        return result;
                }
            }
        }

        /// <summary>
        /// Низкий приоритет
        /// </summary>
        /// <returns>результат выражения</returns>
        protected ExprResult SimpleExpression()
        {
            ExprResult result = Term();
            while (true)
            {
                switch (e.Current.Token)
                {
                    case DelphiTokens.Addition:
                    case DelphiTokens.Subtraction:
                    case DelphiTokens.Or:
                    case DelphiTokens.Xor:
                        result.WasOperand = true;
                        e.Next();
                        result.Add(Term());
                        break;
                    default:
                        return result;
                }
            }
        }

        /// <summary>
        /// Низший приоритет
        /// </summary>
        /// <returns>результат выражения</returns>
        protected ExprResult Expression()
        {
            ExprResult result = SimpleExpression();
            while (true)
            {
                switch (e.Current.Token)
                {
                    case DelphiTokens.Equal:
                    case DelphiTokens.Less:
                    case DelphiTokens.Greater:
                    case DelphiTokens.LessOrEqual:
                    case DelphiTokens.GreaterOrEqual:
                    case DelphiTokens.NotEqual:
                    case DelphiTokens.In:
                    case DelphiTokens.Is:
                    case DelphiTokens.As:
                        result.WasOperand = true;
                        e.Next();
                        result.Add(SimpleExpression());
                        break;
                    default:
                        return result;
                }
            }
        }

        /// <summary>
        /// Возможен список выражений
        /// </summary>
        private void OptionalExpressionList()
        {
            while (true)
            {
                switch (e.Current.Token)
                {
                    case DelphiTokens.Addition:
                    case DelphiTokens.Subtraction:
                    case DelphiTokens.Digits:
                    case DelphiTokens.HexConstant:
                    case DelphiTokens.Char:
                    case DelphiTokens.String:
                    case DelphiTokens.LBr:
                    case DelphiTokens.LSBr:
                    case DelphiTokens.AtSign:
                    case DelphiTokens.Not:
                    case DelphiTokens.True:
                    case DelphiTokens.False:
                    case DelphiTokens.Inherited:
                        Expression();
                        break;
                    case DelphiTokens.Comma:
                        e.Next();
                        Expression();
                        break;
                    default:
                        if (e.MatchTokens(DelphiTokens.Id))
                            Expression();
                        else return;
                        break;
                }
            }
        }
    }
}
