import java.io.FileReader;
import java.io.FileWriter;

import java.util.List;
import java.util.ArrayList;

import org.topcoder.TopcoderReader;
import org.topcoder.TopcoderWriter;
import org.topcoder.TypeRef;

public class SwappingNodesSolver {
    public static void main(String[] args) {
    try {
        TopcoderReader reader = new TopcoderReader(new FileReader(args[0]));
        List<Integer> leavesBoxed = (List<Integer>) reader.next(new TypeRef<List<Integer>>(){}.getType());
        int[] leaves = new int[leavesBoxed.size()];
        for (int _i = 0; _i < leavesBoxed.size(); ++_i)
            leaves[_i] = leavesBoxed.get(_i);
        reader.next();
        
        int numberOfLeaves = (Integer) reader.next(Integer.class);
        reader.close();

        SwappingNodes solver = new SwappingNodes();
        TopcoderWriter writer = new TopcoderWriter(new FileWriter(args[1]));
        int[] result = solver.swapNodes(leaves, numberOfLeaves);
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
