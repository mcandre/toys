 int[] CreateNumber(int length)
 {
   Random random = new Random();
   int[] digits = new int[length];
   for(int i = 0; i < length - 1; i++)
   {
     digits[i] = random.Next(10);
   }
   int sum = 0;
   bool alt = true;
   for(int i = length - 2; i >= 0; i--)
   {
     if(alt)
     {
       int temp = digits[i];
       temp *= 2;
       if(temp > 9)
       {
         temp -= 9;
       }
       sum += temp;
     }
     else
     {
       sum += digits[i];
     }
     alt = !alt;
   }
   int modulo = sum % 10;
   if(modulo > 0)
   {
     digits[length-1] = 10 - modulo;
   }
   return digits;
 }
