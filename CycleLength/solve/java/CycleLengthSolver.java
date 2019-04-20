import java.io.FileReader;
import java.io.FileWriter;

import java.util.List;
import java.util.ArrayList;

import org.topcoder.TopcoderReader;
import org.topcoder.TopcoderWriter;
import org.topcoder.TypeRef;

public class CycleLengthSolver {
    public static void main(String[] args) {
    try {
        TopcoderReader reader = new TopcoderReader(new FileReader(args[0]));
        int seed = (Integer) reader.next(Integer.class);
        reader.next();
        
        int a = (Integer) reader.next(Integer.class);
        reader.next();
        
        int b = (Integer) reader.next(Integer.class);
        reader.next();
        
        int m = (Integer) reader.next(Integer.class);
        reader.close();

        CycleLength solver = new CycleLength();
        TopcoderWriter writer = new TopcoderWriter(new FileWriter(args[1]));
        writer.write(solver.solve(seed, a, b, m));
        writer.close();
    } catch (Exception err) {
        err.printStackTrace(System.err);
    }
    }
}
