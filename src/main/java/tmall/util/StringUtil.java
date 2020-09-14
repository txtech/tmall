package tmall.util;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author Pepsi
 * @create 2019-08-28 18:49
 * @desc
 * @copyright vcgroup.cn
 */
public class StringUtil {

    public final static char DEFAULT_REPLACE_CHAR = '*';

    /**
     * 隐藏号码 以*代替
     * @param content 内容
     * @param firstNumberCount 不隐藏前面N位
     * @param lastNumberCount 不隐藏倒数N位
     * @return
     */
    public static String hideNumber(String content, int firstNumberCount, int lastNumberCount) {
        return hideNumber(content, firstNumberCount, lastNumberCount, DEFAULT_REPLACE_CHAR);
    }

    /**
     *
     * @param content
     * @param firstNumberCount
     * @param lastNumberCount
     * @param replaceChar
     * @return
     */
    public static String hideNumber(String content, int firstNumberCount, int lastNumberCount, char replaceChar) {
        if (content == null || content.length() < (firstNumberCount + lastNumberCount)) {
            return content;
        }
        int hideEnd = content.length() - lastNumberCount - 1;
        char[] chars = content.toCharArray();
        for (int i = 0; i < chars.length; i++) {
            if (i >= firstNumberCount && i <= hideEnd) {
                chars[i] = replaceChar;
            }
        }
        return new String(chars);
    }

    /**
     * @Description: 验证是否数字
     * @author Lucas
     * @param str
     * @return boolean
     * @throws
     * @date 2020-03-17 14:48
     */
    public static boolean isNumer(String str) {
        Pattern pattern = Pattern.compile("(^[1-9](\\d+)?(\\.\\d{1,2})?$)|(^0$)|(^\\d\\.\\d{1,2}$)");
        Matcher isNum = pattern.matcher(str);
        if (!isNum.matches()) {
            return false;
        }
        return true;
    }

    /**
     * 移除map中空key或者value空值
     * @param map
     */
    public static void removeNullEntry(Map map){
        removeNullKey(map);
        removeNullValue(map);
    }
    /**
     * 移除map的空key
     * @param map
     * @return
     */
    public static void removeNullKey(Map map){
        Set set = map.keySet();
        for (Iterator iterator = set.iterator(); iterator.hasNext();) {
            Object obj = (Object) iterator.next();
            remove(obj, iterator);
        }
    }
    /**
     * 移除map中的value空值
     * @param map
     * @return
     */
    public static void removeNullValue(Map map){
        Set set = map.keySet();
        for (Iterator iterator = set.iterator(); iterator.hasNext();) {
            Object obj = (Object) iterator.next();
            Object value =(Object)map.get(obj);
            remove(value, iterator);
        }
    }
    /**
     * 移除map中的空值
     *
     * Iterator 是工作在一个独立的线程中，并且拥有一个 mutex 锁。
     * Iterator 被创建之后会建立一个指向原来对象的单链索引表，当原来的对象数量发生变化时，这个索引表的内容不会同步改变，
     * 所以当索引指针往后移动的时候就找不到要迭代的对象，所以按照 fail-fast 原则 Iterator 会马上抛出 java.util.ConcurrentModificationException 异常。
     * 所以 Iterator 在工作的时候是不允许被迭代的对象被改变的。
     * 但你可以使用 Iterator 本身的方法 remove() 来删除对象， Iterator.remove() 方法会在删除当前迭代对象的同时维护索引的一致性。
     * @param obj
     * @param iterator
     */
    private static void remove(Object obj,Iterator iterator){
        if(obj instanceof String){
            String str = (String)obj;
            if(isEmpty(str)){ //过滤掉为null和""的值 主函数输出结果map：{2=BB, 1=AA, 5=CC, 8= }
//      if("".equals(str.trim())){ //过滤掉为null、""和" "的值 主函数输出结果map：{2=BB, 1=AA, 5=CC}
                iterator.remove();
            }
        }else if(obj instanceof Collection){
            Collection col = (Collection)obj;
            if(col==null||col.isEmpty()){
                iterator.remove();
            }
        }else if(obj instanceof Map){
            Map temp = (Map)obj;
            if(temp==null||temp.isEmpty()){
                iterator.remove();
            }
        }else if(obj instanceof Object[]){
            Object[] array =(Object[])obj;
            if(array==null||array.length<=0){
                iterator.remove();
            }
        }else{
            if(obj==null){
                iterator.remove();
            }
        }
    }
    public static boolean isEmpty(Object obj){
        return obj == null || obj.toString().length() == 0;
    }
    
    
    /**
     * @Description: 去除字符串中的空格、回车、换行符、制表符
     * @author Lucas
     * @param str
     * @return String
     * @throws
     * @date 2020-04-13 11:30 
    */
      public static String replaceBlank(String str) {
          String dest = "";
          if (str != null) {
              Pattern p = Pattern.compile("\\s*|\t|\r|\n");
              Matcher m = p.matcher(str);
              dest = m.replaceAll("");
          }
          return dest;
      }

    public static void main(String[] args) {
        Map map = new HashMap();
        map.put(1, "AA");
        map.put("2", "BB");
        map.put("5", "CC");
        map.put("6",null);
        map.put("7", "");
        map.put("8", " ");
        System.out.println(map);//输出结果：{2=BB, 1=AA, 7=, 6=null, 5=CC, 8= }
        removeNullEntry(map);
        System.out.println(map);
        String name = "阿依宝塔·对山拜";
        System.out.println(replaceBlank(name));
    }


}
