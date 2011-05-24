 bool CheckNumber(int[] digits)
 {
   int sum = 0;
   bool alt = false;
   for(int i = digits.Length - 1; i >= 0; i--)
   {
     if(alt)
     {
       digits[i] *= 2;
       if(digits[i] > 9)
       {
         digits[i] -= 9; // equivalent to adding the digits of value
       }
     }
     sum += digits[i];
     alt = !alt;
   }
   return sum % 10 == 0;
 }
