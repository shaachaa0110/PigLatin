public void setup() 
{
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}
}

public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
	int counter = 0;
  	for(int i = 0; i < sWord.length(); i++){
    	if(sWord.charAt(i) != 'a' && sWord.charAt(i) != 'e' && sWord.charAt(i) != 'i' && sWord.charAt(i) != 'o' && sWord.charAt(i) != 'u'){
      		counter++;
    	}else{
      		break;
    	}
  	}
  	if(counter == sWord.length()){
    	counter = -1;
  	}
  	return counter;
}

public boolean qu(String sWord){
	boolean value = false;
	if(sWord.length() >= 2 && sWord.charAt(0) == 'q' && sWord.charAt(1) == 'u'){
		value = true;
	}
	return value;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	//for words that are all consonants, add ay to the end of the word
	if(findFirstVowel(sWord) == -1)
	{
		return sWord + "ay";
	}
	//for words that begin with vowels, add way to the end of the word
	if(findFirstVowel(sWord) == 0){
		return sWord + "way";
	}
	//for words begining with qu, move qu to the end and add ay to the end
	if(qu(sWord)){
		String removedQU = new String(sWord.substring(2, sWord.length() - 1));
		return removedQU + "qu" + "ay";
	}
	//for words that begin with consonants, move the consonants to the end of the word and add ay
	if(findFirstVowel(sWord) != 0){
		String cut = new String(sWord.substring(findFirstVowel(sWord), sWord.length()));
		for(int i = 0; i < findFirstVowel(sWord); i++){
			cut += sWord.charAt(i); 
		}
		return cut + "ay";
	}else{
		return "ERROR!";
	}
}
