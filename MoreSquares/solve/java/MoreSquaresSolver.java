import java.io.FileReader;
import java.io.FileWriter;

import java.util.List;
import java.util.ArrayList;

import org.topcoder.TopcoderReader;
import org.topcoder.TopcoderWriter;
import org.topcoder.TypeRef;

public class MoreSquaresSolver {
    public static void main(String[] args) {
    try {
        TopcoderReader reader = new TopcoderReader(new FileReader(args[0]));
        int N = (Integer) reader.next(Integer.class);
        reader.next();
        
        int SX = (Integer) reader.next(Integer.class);
        reader.next();
        
        int SY = (Integer) reader.next(Integer.class);
        reader.next();
        
        List<Integer> XprefixBoxed = (List<Integer>) reader.next(new TypeRef<List<Integer>>(){}.getType());
        int[] Xprefix = new int[XprefixBoxed.size()];
        for (int _i = 0; _i < XprefixBoxed.size(); ++_i)
            Xprefix[_i] = XprefixBoxed.get(_i);
        reader.next();
        
        List<Integer> YprefixBoxed = (List<Integer>) reader.next(new TypeRef<List<Integer>>(){}.getType());
        int[] Yprefix = new int[YprefixBoxed.size()];
        for (int _i = 0; _i < YprefixBoxed.size(); ++_i)
            Yprefix[_i] = YprefixBoxed.get(_i);
        reader.close();

        MoreSquares solver = new MoreSquares();
        TopcoderWriter writer = new TopcoderWriter(new FileWriter(args[1]));
        writer.write(solver.countLocations(N, SX, SY, Xprefix, Yprefix));
        writer.close();
    } catch (Exception err) {
        err.printStackTrace(System.err);
    }
    }
}
