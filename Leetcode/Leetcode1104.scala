object Solution {
    
    def logBase2(n : Int) : Int = 
        if (n <= 1) 0
        else 1 + logBase2(n / 2)

    def computePar(n : Int) : Int = {
        var lev = logBase2(n)
        var tpar = n / 2
        var offset = Math.pow(2, lev).toInt - 1 - tpar
        return Math.pow(2, lev - 1).toInt + offset
        
    }
    
    def constructList (n : Int) : List[Int] =  n match {
        case 0 => Nil
        case 1 => List(1)
        case _ => n :: constructList(computePar(n))
    }
    
    def pathInZigZagTree(label: Int): List[Int] = 
        constructList(label).reverse   
}
