import java.util.*;
import java.nio.file.*;
import java.io.IOException;

class RandomPasswordGen{
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
        getPasswordForUser("passwords.txt");
        //System.out.println(listOf29Passwords);
    }

    public static void getPasswordForUser(String filePathString){
        Map<String, String> userPasswordTable = new HashMap<>();
        Path filePath = Path.of(filePathString);
        String content = Files.readString(filePath);
        System.out.println(content);
    }
}

