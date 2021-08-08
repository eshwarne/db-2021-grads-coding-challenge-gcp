import java.io.FileWriter;
import java.util.*;
import java.nio.file.*;
import java.io.IOException;

public class RandomPasswordGen{
    public static void main(String[] args){
        int leftLimit = 97;
        int rightLimit = 122;
        int targetStringLength = 10;
        Random random = new Random();
        // List<String> listOf29Passwords = new ArrayList<String>();
        // for(int i=0; i<29; i++){
        //     String generatedString = random.ints(leftLimit, rightLimit + 1)
        //         .limit(targetStringLength)
        //         .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
        //         .toString();
        //     listOf29Passwords.add(generatedString);
        // }
        try {
            String[] passwords = getStringArrayOfEntity("E:\\Deutsche Bank Work Days\\dbgrads2021\\passwords.txt");
            String[] databases = getStringArrayOfEntity("E:\\Deutsche Bank Work Days\\dbgrads2021\\databases.txt");
            String[] users = getStringArrayOfEntity("E:\\Deutsche Bank Work Days\\dbgrads2021\\users.txt");
            String header = String.format("|%30s|        |%20s|        |%20s|","Database Name","User ID","Password");
            String seperator = String.format("|%30s|        |%20s|        |%20s|","-------------","-------","--------");
            FileWriter fileWriter = new FileWriter("E:\\Deutsche Bank Work Days\\dbgrads2021\\dbUsersPasswords.txt");
            fileWriter.write(header);
            fileWriter.write("\n");
            fileWriter.write(seperator);
            fileWriter.write("\n");
            for(int i=0; i<29; i++){
                String formatted = String.format(" %30s         %20s         %20s",databases[i],users[i],passwords[i]);
                fileWriter.write(formatted);
                fileWriter.write("\n");
            }
            fileWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String[] getStringArrayOfEntity(String filePathString) throws IOException {
        Path filePath = Path.of(filePathString);
        String content = Files.readString(filePath);
        String[] entity = content.split(", ");
        return entity;

    }
}

