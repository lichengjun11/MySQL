import java.io.*;

/**
 * Created by lichengjun on 2017/5/25.
 */
public class City {
    public static void main(String[] args) {
        try {
            BufferedReader reader = new BufferedReader(new FileReader("data/BaiduMap_cityCenter(1).txt"));
            String line;
            while ((line = reader.readLine()) != null){
                String s1 = line.split(",")[0];
                String s2 = line.split(",")[1];
                String s3 = line.split(",")[2];//{name: '海门', value: [121.15, 31.89, 90]},
                System.out.println("{name: '"+s1+"', value: ["+s2 +","+s3+"]},");

            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
