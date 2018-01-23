@isTest
public class CoursesTest {

    @isTest static void InsertTest(){
        CourseClass c = new  CourseClass();
        c.coursName = 'Physics';
        c.createCourse();
    }
    @isTest static void InsertTestCatch(){
        CourseClass c = new CourseClass();
        c.coursName=null;
        c.createCourse();
    }
    @isTest static void DeleteCoursTest(){
        CourseClass c = new CourseClass();
        c.courseDeleteId = null;
        c.deleteCourse();
    }
    @isTest static void getShowStudenttest(){
        CourseClass c = new CourseClass();
        Student__c stu=new Student__c(Name='Ahmed' , Registration__c='12', Roll_No__c='23');
        Course__c cou=new Course__c(Name='AI');
        insert stu;
        insert cou;
        Student_And_Course__c sac=new Student_And_Course__c(Name='Pholla', Student__c=stu.Id, Course__c=cou.Id);
        insert sac;
        c.courseStudentId=cou.Id;
        List<Student__c> listStu = c.getshowStudents();
        
    }
    @isTest static void FlagTest(){
        CourseClass c = new CourseClass();
        c.createCourseFlag = false;
        c.createFlag();
    }
  
}