object Solution {
    def sampleStats(count: Array[Int]): Array[Double] = {
     
        var ret = Array.range(0, count.length, 1).zip(count).filter(t => t._2 != 0);
        var min_el = ret.head._1;
        var max_el = ret.reverse.head._1;
        var tot = ret.foldLeft (0, 0) ((u, v) => (u._1 + v._1 * v._2, u._2 + v._2));
        var (u, v) = if (tot._2 % 2  == 0) (tot._2 >> 1, (tot._2 >> 1) + 1) else (tot._2 >> 1, tot._2 >> 1);
        var avg_acc = ret.scanLeft (0, 0) ((u, v) => (v._1, u._2 + v._2));
        var uval = avg_acc.filter (t => t._2 >= u).head._1;
        var vval = avg_acc.filter (t => t._2 >= v).head._1;
        var mode = ret.foldLeft (0, 0) ((u, v) => if (v._2 > u._2) v else u)._1;
        return Array(min_el.toDouble, max_el.toDouble, tot._1.toDouble / tot._2, 
                     (uval.toDouble + vval.toDouble) / 2.0, mode.toDouble);   
    }
}
