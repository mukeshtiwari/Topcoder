import java.io.FileReader;
import java.io.FileWriter;

import java.util.List;
import java.util.ArrayList;

import org.topcoder.TopcoderReader;
import org.topcoder.TopcoderWriter;
import org.topcoder.TypeRef;

public class OneHandSortSolver {
    public static void main(String[] args) {
    try {
        TopcoderReader reader = new TopcoderReader(new FileReader(args[0]));
        List<Integer> targetBoxed = (List<Integer>) reader.next(new TypeRef<List<Integer>>(){}.getType());
        int[] target = new int[targetBoxed.size()];
        for (int _i = 0; _i < targetBoxed.size(); ++_i)
            target[_i] = targetBoxed.get(_i);
        reader.close();

        OneHandSort solver = new OneHandSort();
        TopcoderWriter writer = new TopcoderWriter(new FileWriter(args[1]));
        int[] result = solver.sortShelf(target);
        List<Integer> resultBoxed = new ArrayList<Integer>();
        for (int _i = 0; _i < result.length; ++_i) {
            resultBoxed.add(result[_i]);
        }
        writer.write(resultBoxed);
        writer.close();
    } catch (Exception err) {
        err.printStackTrace(System.err);
    }
    }
}
