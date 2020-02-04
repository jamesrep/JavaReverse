
.method public static james_toHex : ([B)Ljava/lang/String; 
    .code stack 6 locals 6 
L0:     new java/lang/StringBuilder 
L3:     dup 
L4:     invokespecial Method java/lang/StringBuilder <init> ()V 
L7:     astore_1 
L8:     aload_0 
L9:     dup 
L10:    astore 5 
L12:    arraylength 
L13:    istore 4 
L15:    iconst_0 
L16:    istore_3 
L17:    goto L49 

        .stack full 
            locals Object [B Object java/lang/StringBuilder Top Integer Integer Object [B 
            stack 
        .end stack 
L20:    aload 5 
L22:    iload_3 
L23:    baload 
L24:    istore_2 
L25:    aload_1 
L26:    ldc '%02x' 
L28:    iconst_1 
L29:    anewarray java/lang/Object 
L32:    dup 
L33:    iconst_0 
L34:    iload_2 
L35:    invokestatic Method java/lang/Byte valueOf (B)Ljava/lang/Byte; 
L38:    aastore 
L39:    invokestatic Method java/lang/String format (Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String; 
L42:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L45:    pop 
L46:    iinc 3 1 

        .stack same 
L49:    iload_3 
L50:    iload 4 
L52:    if_icmplt L20 
L55:    aload_1 
L56:    invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L59:    areturn 
L60:    
        .linenumbertable 
            L0 8 
            L8 10 
            L55 12 
        .end linenumbertable 
        .localvariabletable 
            0 is a [B from L0 to L60 
            1 is sb Ljava/lang/StringBuilder; from L8 to L60 
            2 is b B from L25 to L46 
        .end localvariabletable 
    .end code 
.end method 

.method public static james_writefile : (Ljava/lang/Object;)V 
    .code stack 4 locals 4 
L0:     aload_0 
L1:     ifnonnull L5 
L4:     return 
        .catch java/lang/Exception from L5 to L187 using L190 

        .stack same 
L5:     new java/io/FileWriter 
L8:     dup 
L9:     ldc 'c:\\tmp\\testout.txt' 
L11:    iconst_1 
L12:    invokespecial Method java/io/FileWriter <init> (Ljava/lang/String;Z)V 
L15:    astore_1 
L16:    aload_0 
L17:    instanceof java/lang/String 
L20:    ifeq L54 
L23:    aload_0 
L24:    invokevirtual Method java/lang/Object toString ()Ljava/lang/String; 
L27:    astore_2 
L28:    aload_1 
L29:    new java/lang/StringBuilder 
L32:    dup 
L33:    aload_2 
L34:    invokestatic Method java/lang/String valueOf (Ljava/lang/Object;)Ljava/lang/String; 
L37:    invokespecial Method java/lang/StringBuilder <init> (Ljava/lang/String;)V 
L40:    ldc '\r\n' 
L42:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L45:    invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L48:    invokevirtual Method java/io/FileWriter write (Ljava/lang/String;)V 
L51:    goto L177 

        .stack append Object java/io/FileWriter 
L54:    aload_0 
L55:    instanceof [B 
L58:    ifeq L130 
L61:    aload_0 
L62:    checkcast [B 
L65:    invokestatic Method javatests/JamesMain james_toHex ([B)Ljava/lang/String; 
L68:    astore_2 
L69:    aload_1 
L70:    new java/lang/StringBuilder 
L73:    dup 
L74:    aload_2 
L75:    invokestatic Method java/lang/String valueOf (Ljava/lang/Object;)Ljava/lang/String; 
L78:    invokespecial Method java/lang/StringBuilder <init> (Ljava/lang/String;)V 
L81:    ldc '\r\n' 
L83:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L86:    invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L89:    invokevirtual Method java/io/FileWriter write (Ljava/lang/String;)V 
L92:    new java/lang/String 
L95:    dup 
L96:    aload_0 
L97:    checkcast [B 
L100:   invokespecial Method java/lang/String <init> ([B)V 
L103:   astore_3 
L104:   aload_1 
L105:   new java/lang/StringBuilder 
L108:   dup 
L109:   aload_3 
L110:   invokestatic Method java/lang/String valueOf (Ljava/lang/Object;)Ljava/lang/String; 
L113:   invokespecial Method java/lang/StringBuilder <init> (Ljava/lang/String;)V 
L116:   ldc '\r\n' 
L118:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L121:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L124:   invokevirtual Method java/io/FileWriter write (Ljava/lang/String;)V 
L127:   goto L177 

        .stack same_extended 
L130:   aload_0 
L131:   invokevirtual Method java/lang/Object toString ()Ljava/lang/String; 
L134:   astore_2 
L135:   aload_0 
L136:   invokevirtual Method java/lang/Object getClass ()Ljava/lang/Class; 
L139:   invokevirtual Method java/lang/Class getTypeName ()Ljava/lang/String; 
L142:   astore_3 
L143:   aload_1 
L144:   new java/lang/StringBuilder 
L147:   dup 
L148:   ldc 'Type: ' 
L150:   invokespecial Method java/lang/StringBuilder <init> (Ljava/lang/String;)V 
L153:   aload_3 
L154:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L157:   ldc ' - toString()=' 
L159:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L162:   aload_2 
L163:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L166:   ldc '\r\n' 
L168:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L171:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L174:   invokevirtual Method java/io/FileWriter write (Ljava/lang/String;)V 

        .stack same 
L177:   aload_1 
L178:   ldc '......................\r\n' 
L180:   invokevirtual Method java/io/FileWriter write (Ljava/lang/String;)V 
L183:   aload_1 
L184:   invokevirtual Method java/io/FileWriter close ()V 
L187:   goto L198 

        .stack full 
            locals Object java/lang/Object 
            stack Object java/lang/Exception 
        .end stack 
L190:   astore_1 
L191:   getstatic Field java/lang/System out Ljava/io/PrintStream; 
L194:   aload_1 
L195:   invokevirtual Method java/io/PrintStream println (Ljava/lang/Object;)V 

        .stack same 
L198:   return 
L199:   
        .linenumbertable 
            L0 17 
            L5 21 
            L16 23 
            L23 25 
            L28 26 
            L51 27 
            L54 28 
            L61 30 
            L69 31 
            L92 33 
            L104 34 
            L127 35 
            L130 38 
            L135 39 
            L143 41 
            L177 44 
            L183 46 
            L187 47 
            L190 48 
            L191 50 
            L198 53 
        .end linenumbertable 
        .localvariabletable 
            0 is obj Ljava/lang/Object; from L0 to L199 
            1 is fw Ljava/io/FileWriter; from L16 to L187 
            2 is strOut Ljava/lang/String; from L28 to L51 
            2 is strHex Ljava/lang/String; from L69 to L127 
            3 is strAscii Ljava/lang/String; from L104 to L127 
            2 is strOut Ljava/lang/String; from L135 to L177 
            3 is strType Ljava/lang/String; from L143 to L177 
            1 is e Ljava/lang/Exception; from L191 to L198 
        .end localvariabletable 
    .end code 
.end method 

