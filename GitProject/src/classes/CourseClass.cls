public class CourseClass {
    // Lists
    public List<Course__c> Courses {get;set;}
    //public List<Student__c>StudentLists{get;set;}
    // Strings
    public String coursName {get;set;}
    // Id
    public Id courseDeleteId {get;set;}
    public id courseStudentId{get;set;}
    // booleans
    public boolean createCourseFlag {get;set;}
    public CourseClass(){
        Courses = showCourse();
        
    }
    public List<Course__c> showCourse(){
        List<Course__c> courseList =[Select Name from Course__c];
        return courseList;
    }
    public void deleteCourse(){
        List<Course__c> delCourse = [Select Name from Course__c
                                    where Id =: courseDeleteId];
        try{
        delete delCourse;
            showCourse();}
        catch(DMLException e){
            System.debug(e);
        }
    }
    public void createCourse(){
        Course__c creCourse = new Course__c(Name=coursName);
        try{
            insert creCourse;
            showCourse();
        }
        catch(DmlException e){
            System.debug(e);
        }
    }
   public void createFlag(){
        createCourseFlag = true;
    }
    public List<Student__c> getshowStudents(){
        List<Student__c> stuList=new List<Student__c>();
        List<Student_And_Course__c> showStudent =[Select Student__r.Name,Student__r.Registration__c,Student__r.Roll_No__c from Student_And_Course__c
                                                 where Course__c =:courseStudentId ];
        for(Student_And_Course__c stu : showStudent){
            
            stuList.add(new Student__c(Name=stu.Student__r.Name,
                           Registration__c=stu.Student__r.Registration__c,
                           Roll_No__c = stu.Student__r.Roll_No__c));
        }
              
        return stuList;
    }
}