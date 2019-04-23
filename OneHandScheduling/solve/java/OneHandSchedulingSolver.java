import java.io.FileReader;
import java.io.FileWriter;

import java.util.List;
import java.util.ArrayList;

import org.topcoder.TopcoderReader;
import org.topcoder.TopcoderWriter;
import org.topcoder.TypeRef;

public class OneHandSchedulingSolver {
    public static void main(String[] args) {
    try {
        TopcoderReader reader = new TopcoderReader(new FileReader(args[0]));
        List<Integer> tStartBoxed = (List<Integer>) reader.next(new TypeRef<List<Integer>>(){}.getType());
        int[] tStart = new int[tStartBoxed.size()];
        for (int _i = 0; _i < tStartBoxed.size(); ++_i)
            tStart[_i] = tStartBoxed.get(_i);
        reader.next();
        
        List<Integer> tEndBoxed = (List<Integer>) reader.next(new TypeRef<List<Integer>>(){}.getType());
        int[] tEnd = new int[tEndBoxed.size()];
        for (int _i = 0; _i < tEndBoxed.size(); ++_i)
            tEnd[_i] = tEndBoxed.get(_i);
        reader.close();

        OneHandScheduling solver = new OneHandScheduling();
        TopcoderWriter writer = new TopcoderWriter(new FileWriter(args[1]));
        writer.write(solver.checkSchedule(tStart, tEnd));
        writer.close();
    } catch (Exception err) {
        err.printStackTrace(System.err);
    }
    }
}
