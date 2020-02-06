package javatests;

public class JamesMain 
{
	// We want to avoid external libraries
	public static String james_toHex(byte[] a) 
	{
		StringBuilder sb = new StringBuilder();
   
		for(byte b: a) sb.append(String.format("%02x", b));
		
		return sb.toString();
	}	

	public static void james_writefile(Object obj)
	{
		if(obj == null) return;	
		
        try
        {    
        	java.io.FileWriter fw=new java.io.FileWriter("c:\\tmp\\testout.txt", true);    
        	
        	if(obj instanceof String)
        	{
        		String strOut = obj.toString();
        		fw.write(strOut + "\r\n");
        	}
        	else if(obj instanceof byte [])
        	{
        		String strHex = james_toHex((byte []) obj);
        		fw.write(strHex + "\r\n");
        		
        		String strAscii = new String((byte []) obj);
        		fw.write(strAscii + "\r\n");        		
        	}
        	else 
        	{
        		String strOut = obj.toString();
        		String strType = obj.getClass().getTypeName();
        		
        		fw.write("Type: " + strType + " - toString()=" + strOut + "\r\n");
        	}        	
     	
        	fw.write("......................\r\n");
        	
            fw.close();    
        }
        catch(Exception e)
        {
        	System.out.println(e);
        }
                  	
	}
	


}
