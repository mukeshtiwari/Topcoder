import java.io.FileReader;
import java.io.FileWriter;

import java.util.List;
import java.util.ArrayList;

import org.topcoder.TopcoderReader;
import org.topcoder.TopcoderWriter;
import org.topcoder.TypeRef;

public class OneHandRoadPaintingSolver {
    public static void main(String[] args) {
    try {
        TopcoderReader reader = new TopcoderReader(new FileReader(args[0]));
        List<Integer> dStartBoxed = (List<Integer>) reader.next(new TypeRef<List<Integer>>(){}.getType());
        int[] dStart = new int[dStartBoxed.size()];
        for (int _i = 0; _i < dStartBoxed.size(); ++_i)
            dStart[_i] = dStartBoxed.get(_i);
        reader.next();
        
        List<Integer> dEndBoxed = (List<Integer>) reader.next(new TypeRef<List<Integer>>(){}.getType());
        int[] dEnd = new int[dEndBoxed.size()];
        for (int _i = 0; _i < dEndBoxed.size(); ++_i)
            dEnd[_i] = dEndBoxed.get(_i);
        reader.next();
        
        int paintPerBrush = (Integer) reader.next(Integer.class);
        reader.close();

        OneHandRoadPainting solver = new OneHandRoadPainting();
        TopcoderWriter writer = new TopcoderWriter(new FileWriter(args[1]));
        writer.write(solver.fastest(dStart, dEnd, paintPerBrush));
        writer.close();
    } catch (Exception err) {
        err.printStackTrace(System.err);
    }
    }
}
