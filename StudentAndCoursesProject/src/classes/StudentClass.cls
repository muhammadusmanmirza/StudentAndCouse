public class StudentClass {
    
    public List<Student__c> Students {get;set;}
    public List<Course__c> courses {get;set;}
    public list<StudentAndCourse__c> stuAndCou {get; set;}
    public student__c obj{get;set;}
    //public student__c obj1{get;set;}
    public Course__c courObj{get;set;}
    public string studName{get;set;}
    public string studEmail{get;set;}
    public string courName{get;set;}
    public id stuRollNo{get;set;}
    public boolean insertCourse {get;set;}
    public boolean showCourseFlag{get;set;}
    public boolean createHideFlage{get;set;}
    public boolean updateHideFlage{get;set;}
    public boolean showStudentFlag{get;set;}
    public id courseId{get;set;}
    public id deleteId{get;set;}
    public id updateId{get;set;}
    public id courDeleteId{get;set;}
    
   
    public StudentClass(){
        Students = new list<Student__c>();
        Students = showStud();
        courses = new list<Course__c>();
        courses = showCourse();
        stuAndCou = new List<StudentAndCourse__c>();
        obj = new student__c();
        //obj1 = new student__c();
        courObj = new Course__c();
       // obj1 = goToDetail();
        insertCourse = false;
        showCourseFlag = false;
        createHideFlage = false;
        updateHideFlage = false;
        showStudentFlag = false;
    }
    public void CreateStudentRecord(){
        student__c obj = new student__c(Name = studName,Stu_Email__c = studEmail);
        try{
         studName=Null;
         studEmail=Null;
        insert obj;
        system.debug('Record Successfull Insert');
        }
        catch(dmlException e){
            system.debug(e.getMessage());
        }
        
    }
    public list<Student__c> showStud(){
        list<student__c> stulist = [Select Name,RegistrationsNumber__c,Roll_No__c,Stu_Email__c From Student__c Order by Name ];
         return stulist;
    }
    public list<Course__c> showCourse(){
        list<Course__c> courList = [Select Name,Course_Id__c,CourseRegisNo__c from Course__c order by Course_Id__c];
        return courList;
    }
    public void CreateCourse(){
        Course__c cour = new Course__c( Name = courName);
        system.debug(courName);
        try{

            insert cour;
            courName = null;
        }
        catch(dmlException e){
            system.debug(e.getMessage());
        }
    }
    public void FlagTrue(){
        insertCourse = true;
    }
    public void ShowCourses(){
        List<StudentAndCourse__c> courName = [Select CourseName__c,coursename__r.name , coursename__r.Course_Id__c,coursename__r.CourseRegisNo__c from StudentAndCourse__c
                                             where StudentName__c =:courseId];
        List<Course__c> courList = new List<Course__c>();
        For(StudentAndCourse__c co : courName){
            course__c cou = [Select Name,Course_Id__c,CourseRegisNo__c from Course__c
                             where id =: co.CourseName__c];
            courList.add(cou);
        }
        courses = courList;
         showCourseFlag = true;
    }
    public List<selectOption> getOptions(){
        List<SelectOption> oplist = new List<SelectOption>();
        List<Course__c> cou = [Select Name from Course__c];
        oplist.add(new SelectOption(' ',' '));
        for(Course__c co : cou)
        {
            oplist.add(new SelectOption(co.Name,co.Name));
        }
         showCourseFlag = true;
        return oplist;
    }
    public void DeleteStu(){
        Student__c stuObj = [Select Name,Stu_Email__c,Roll_No__c,RegistrationsNumber__c from student__c 
                            where id =: deleteId];
        try{
              Delete stuObj;
            
        }
        catch(dmlException e){
            system.debug(e.getMessage());
        }
    }
    public PageReference goToRegistration(){
        createHideFlage  = true;
       // updateHideFlage = false;
        return page.RegistrationForm;
    }
    public pageReference goToUpdation(){
        
        Obj = [Select Name,Stu_Email__c,Roll_No__c,RegistrationsNumber__c from student__c
                            where id =:updateId ];
        studName = Obj.Name;
        studEmail =Obj.Stu_Email__c;
        updateHideFlage = true;
        return page.RegistrationForm;
    }
    public void UpdateStudentRecord(){
        Obj.Name =  studName;
        Obj.Stu_Email__c = studEmail;
        update obj;
         studName = null;
         studEmail = null;
        system.debug('Update Successfull');
    }
    public void InsertCourse(){
        
        List<Course__c> couList = [Select Name from Course__c
                                  where Name like: courName];
        list<Student__c>stuLists = [select Name,Stu_Email__c from Student__c
                                   where id =: courseId];
        Student__C obj1 = stuLists[0];
        Course__c obj = couList[0];
        StudentAndCourse__c stuAndCou = new StudentAndCourse__c(Name=obj1.Name,Stu_Email__c=obj1.Stu_Email__c,StudentName__c=courseId , CourseName__c = obj.Id);
        insert stuAndCou;
        ShowCourses();
    }
    public void DeleteCourse(){
        courObj = [Select id ,Name,Course_Id__c,CourseRegisNo__c from Course__c
                  where  id=:courDeleteId ];
        Delete courObj;
    }
    public void showStudents(){
        showStudentFlag = true;
        List<Student__c> stud = new list<Student__c>();
        list<StudentAndCourse__c> stuAndCou = [Select StudentName__r.Name,StudentName__r.Stu_Email__c,StudentName__r.Roll_No__c,StudentName__r.RegistrationsNumber__c from StudentAndCourse__C
                                              where CourseName__c =:courseId];
        for(StudentAndCourse__c co : stuAndCou){
            stud.add(new Student__c(Name=co.StudentName__r.Name,
                                     Stu_Email__c=co.StudentName__r.Stu_Email__c       
                                           ));
            Students = stud;
        }
    }
    public PageReference goToCourses(){
        return page.Courses;
    }
    public PageReference goToDetail(){
       // PageReference pg = new PageReference('/apex/DetailPage');
       system.debug('-----------------id'+stuRollNo);
        student__c stu = [Select Name,Stu_Email__c,Roll_No__c,RegistrationsNumber__c from student__c
                               where id =:stuRollNo limit 1];
        list<StudentAndCourse__c> stuACou = [Select coursename__r.name , coursename__r.Course_Id__c,coursename__r.CourseRegisNo__c from studentAndCourse__c
                                      where StudentName__c =:stuRollNo];
        stuAndCou = stuAcou;
        system.debug('--------------'+stuACou);
        system.debug('-----------student------------'+stu);
       // pg.setRedirect(true);
        obj = stu;
        
        return page.DetailPage;
        
    }
    public PageReference goToReport(){
       // PageReference pg = new PageReference('/apex/DetailPage');
       system.debug('-----------------id'+stuRollNo);
        student__c stu = [Select Name,Stu_Email__c,Roll_No__c,RegistrationsNumber__c from student__c
                               where id =:stuRollNo limit 1];
        list<StudentAndCourse__c> stuACou = [Select coursename__r.name , coursename__r.Course_Id__c,coursename__r.CourseRegisNo__c from studentAndCourse__c
                                      where StudentName__c =:stuRollNo];
        stuAndCou = stuAcou;
        system.debug('--------------'+stuACou);
        system.debug('-----------student------------'+stu);
       // pg.setRedirect(true);
        obj = stu;
        
        return page.Report;
        
    }
    public PageReference HomePage(){
        system.debug('fdfdfdfdfdfdf');
       return page.HomePage;
        
    }
    public void DelRelCourse(){
        system.debug('hhhhhhhhhhhhhhhhhhhhh');
       StudentAndCourse__c stu = [Select CourseName__r.name , CourseName__r.Course_Id__c,CourseName__r.CourseRegisNo__c from StudentAndCourse__c
                                      where studentName__c =:courseId limit 1];
        delete stu;
        ShowCourses();
    }

    // Public method
    public void sendMail(String address, String subject, String body) {
        // Create an email message object
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        // Pass this email message to the built-in sendEmail method 
        // of the Messaging class
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
                                 new Messaging.SingleEmailMessage[] { mail });
        
        // Call a helper method to inspect the returned results
        inspectResults(results);
    }
    
    // Helper method
    private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResult = true;
        
        // sendEmail returns an array of result objects.
        // Iterate through the list to inspect results. 
        // In this class, the methods send only one email, 
        // so we should have only one result.
        for (Messaging.SendEmailResult res : results) {
            if (res.isSuccess()) {
                System.debug('Email sent successfully');
            }
            else {
                sendResult = false;
                System.debug('The following errors occurred: ' + res.getErrors());                 
            }
        }
        
        return sendResult;
    }

}