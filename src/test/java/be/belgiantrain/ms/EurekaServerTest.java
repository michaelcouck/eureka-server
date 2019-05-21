package be.belgiantrain.ms;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import java.lang.reflect.Type;
import java.util.*;

@RunWith(JUnit4.class)
public class EurekaServerTest {

    @Test
    public void bla() {
        class Tuple implements Comparable<Tuple> {
            Object one;
            Object two;
            Object three;
            public Tuple(final Object one, final Object two, final Object three) {
                this.one = one;
                this.two = two;
                this.three = three;
            }
            @Override
            public int compareTo(final Tuple that) {
                // TODO: Do your comparison here for the fields one, two and three
                return 0;
            }
        }
        Map<Tuple, Object> mapKeyedByCompositeTuple = new HashMap<>();
        // TODO: Inside your loop
        for (int i = 10; i > 0; i--) {
            Tuple key = new Tuple("cell-one-value-" + i, "cell-two-value-" + i, "cell-three-value-" + i);
            mapKeyedByCompositeTuple.put(key, "cell-four-value-" + i);
        }
        System.out.println(mapKeyedByCompositeTuple);
    }

    @Test
    public void blaBla() {

        class Sort {
            String name;
            String dataType;
            String order;
            int sequence;
            Sort(final String name, final String dataType, final String order, final int sequence) {
                this.name = name;
                this.dataType = dataType;
                this.order = order;
                this.sequence = sequence;
            }
        }

        String sortArray = "[{\"name\":\"NAME\",\"datatype\":\"String\",\"order\":\"asc\",\"sequence\":1},{\"name\":\"SYSTEM\",\"datatype\":\"int\",\"order\":\"asc\",\"sequence\":2},{\"name\":\"AGE\",\"datatype\":\"int\",\"order\":\"desc\",\"sequence\":4},{\"name\":\"TITLE\",\"datatype\":\"String\",\"order\":\"desc\",\"sequence\":3}]";
        Type listType = new TypeToken<Sort[]>(){}.getType();
        Sort[] sortList = new Gson().fromJson(sortArray, listType);
        System.out.println(Arrays.toString(sortList));
        // First sort the sort list
        Arrays.sort(sortList);

        // TODO: Create data structure for customer, i.e. detail, src, sysdata...
        class Customer {
            String name;
            String title;
            Integer age;
            String system;
        }
        String customerJson = "[{\"name\": \"A\",\"title\": \"B\",\"age\": 1,\"system\": \"C\"},{\"name\": \"B\",\"title\": \"B\",\"age\": 1,\"system\": \"C\"},{\"name\": \"C\",\"title\": \"A\",\"age\": 5,\"system\": \"E\"},{\"name\":\"F\",\"title\":\"G\",\"age\": 3,\"system\": \"A\"},{\"name\": \"B\",\"title\": \"C\",\"age\": 9,\"system\": \"D\"},{\"name\": \"X\",\"title\": \"X\",\"age\": 100,\"system\": \"X\"}]";
    }

}