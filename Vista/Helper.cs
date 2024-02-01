using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;

namespace Vista
{
    public static class Helper
    {
        public static bool validarTextoVacio(object control)
        {
            if(control is TextBox texto)
            {
                if (string.IsNullOrEmpty(texto.Text))
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }

            return false;
        }


    }

}