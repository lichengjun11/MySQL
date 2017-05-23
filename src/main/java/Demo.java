import sun.java2d.opengl.WGLSurfaceData;

import java.io.*;

/**
 * Created by lichengjun on 2017/5/21.
 */

// 测试
public class Demo {
    public static void main(String[] args) {
        try {
            BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\lichengjun\\Desktop\\www.csdn.net.sql"));
            String line;
            while ((line = br.readLine()) != null) {
                System.out.println(line);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
